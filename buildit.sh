#!/bin/bash
set -eu

d_my="$( dirname "$( readlink -e "${0}" )" )"
d_mnt="$( mktemp -d )"
#d_tmp="$( mktemp -d )"

d_tmp="${d_my}/tmp"
test -e "${d_tmp}" && {
    echo "${d_tmp} exists, stop."
    exit 42
}
mkdir -p "${d_tmp}"

cleanup()
{
    rm -rf "${d_tmp}"
    mountpoint -q "${d_mnt}" && umount "${d_mnt}" || :
    test -d "${d_mnt}" && rmdir "${d_mnt}"
}
trap cleanup EXIT

usage()
{
    bn="$( basename "${0}" )"
    bs="${bn//?/ }"
    {
	echo "Usage: ${bn} [-l|<resource_set>]"
	echo "       ${bs} [-vm <vm_prefix>]"
	echo "       ${bs} [-vg <vol_group>]"
    } >&2
    exit 1
}

VM=ci
VG=ubuntu-vg

res_sets=(
    $(
	rd="$( readlink -e "${d_my}/res" )"
	find "${rd}" -regex "${rd}/[^/]+/scripts/[0-9]+-[a-z_-]+\.sh" -print0 |
	    xargs -0 -n 1 -r dirname -z |
	    xargs -0 -n 1 -r dirname -z |
	    sort -zu |
	    xargs -0 -n 1 -r basename
    )
)
res_set=

while test ${#} -gt 0
do
    case "${1}" in
	-l)
	    for ss in "${res_sets[@]}"
	    do
		echo "${ss}"
	    done
	    shift
	    exit 0
	    ;;
	-vm)
	    [[ "${2:-}" =~ ^[^-] ]] || {
		echo "Missing value for -vm"
		exit 42
	    }
	    VM="${2}"
	    shift 2
	    ;;
	-vg)
	    [[ "${2:-}" =~ ^[^-] ]] || {
		echo "Missing value for -vg"
		exit 42
	    }
	    VG="${2}"
	    shift 2
	    ;;
	*)
	    c="$( basename "${1}" )"
	    shift
	    for ss in "${res_sets[@]}"
	    do
		test "${c}" = "${ss}" && {
		    res_set="${c}"
		    break
		}
	    done
	    test -z "${res_set}" && {
		echo "No such script set '${c}'"
		exit 42
	    }
	    ;;
    esac
done

while test -z "${res_set}"
do
    select res_set in "${res_sets[@]}"
    do
	test -z "${res_set}" ||
	    break
    done
done

export VM VG

mkdir "${d_tmp}/share"
rsync -r -L -p -t -o -g -v "${d_my}/res/${res_set}/" "${d_tmp}/share/"
rsync -r -L -p -t -o -g -v "${d_my}/res/common/" "${d_tmp}/share/"

clean_old_vm(){
    echo "*** Cleaning old VM ***"
    virsh destroy "$VM" || :
    virsh undefine "$VM" || :
}

setup_storage(){
    echo "*** Setting up storage ***"
    if
	! lvs -S 'lv_name = thinpool' -o lv_name --noheading |
	    grep -q "^  thinpool$"
    then
        echo "No thin pool. Creating..."
        lvcreate -L 1G -T "${VG}/thinpool"
    fi
    if
	[[ ! -e "/dev/${VG}/${VM}-root" ]]
    then
        echo "No root fs" >&2
        exit 1
    fi

    lvremove -f "/dev/${VG}/${VM}-root-snap" || :
    lvcreate --snapshot --name "${VM}-root-snap" --size 5G "/dev/${VG}/${VM}-root"
    # Make thin data and swap LVs
    lvremove -f "/dev/${VG}/${VM}-data"
    lvremove -f "/dev/${VG}/${VM}-swap"
    lvcreate --name "${VM}-data" -V 10G "${VG}/thinpool"
    lvcreate --name "${VM}-swap" -V 1G "${VG}/thinpool"
    mkswap "/dev/${VG}/${VM}-swap"
}

mount_guest(){
    echo "*** Mounting guest ***"
    mount "/dev/${VG}/${VM}-root-snap" "${d_mnt}"
}

install_remove_packages()
{
    local pac_in=(
	cloud-init
	cloud-init-config-suse
    )
    local pac_rm=(
    )

    set -x
    touch "${d_mnt}/etc/resolv.conf"
    mv "${d_mnt}/etc/resolv.conf" "${d_mnt}/etc/resolv.conf.orig"
    cp /etc/resolv.conf "${d_mnt}/etc/resolv.conf"
    chroot "${d_mnt}" zypper --no-gpg-checks --non-interactive ref
    test -z "${pac_in:-}" ||
	chroot "${d_mnt}" zypper in -y --no-recommends "${pac_in[@]}"
    test -z "${pac_rm:-}" ||
	chroot "${d_mnt}" zypper rm -u -y "${pac_rm[@]}"
    mv -f "${d_mnt}/etc/resolv.conf.orig" "${d_mnt}/etc/resolv.conf"
}

fixup_snapshot() {
    echo "*** Fixing up snapshot ***"
    cat <<EOF > "${d_mnt}/etc/fstab"
/dev/vda        /       ext4    rw,noatime,user_xattr,acl,barrier=1,data=ordered                                  0  1
EOF
    chroot "${d_mnt}" systemctl enable cloud-init.service
    chroot "${d_mnt}" systemctl enable cloud-config.service
    chroot "${d_mnt}" systemctl enable cloud-final.service

    echo "gpgcheck      = 0" >> "${d_mnt}/etc/zypp/zypp.conf"
    for f in "${d_mnt}"/etc/zypp/repos.d/openSUSE-*.repo
    do
	sed -ri '/^\s*priority\s*=\s*[0-9]+\s*/ d' "${f}"
	echo "priority = 99" >> "${f}"
    done
}

get_kernel() {
    echo "*** Getting the kernel ***"
    rm -rf "/kvmboot/${VM}"
    mkdir -p "/kvmboot/${VM}"
    cp "${d_mnt}"/boot/vmlinuz-* "/kvmboot/${VM}/"
    cp "${d_mnt}"/boot/initrd-* "/kvmboot/${VM}/"
}

umount_guest(){
    echo "*** Unmounting guest ***"
    umount "${d_mnt}"
}
create_network(){
    echo "*** Creating the network ***"
    nw_tmp="$( mktemp )"
    cat <<EOF > "${nw_tmp}"
<network>
  <name>${VM}-network</name>
  <forward mode="nat" />
  <ip address="10.10.10.1" netmask="255.255.255.0">
    <dhcp>
      <range start="10.10.10.2" end="10.10.10.100" />
      <host mac="da:9c:4a:e0:bb:9f" ip="10.10.10.2" />
    </dhcp>
  </ip>
</network>
EOF
   virsh net-destroy "${VM}-network" || :
   virsh net-undefine "${VM}-network" || :
   virsh net-create "${nw_tmp}"
   rm -f "${nw_tmp}"
}

create_config_iso(){
    echo "*** Creating a config ISO ***"
    genisoimage -o "${d_tmp}/${VM}_config.iso" -V cidata -r -J meta-data user-data
}

create_vm() {
    boot=
    boot="${boot}kernel=/kvmboot/${VM}/vmlinuz-4.4.165-81-default,"
    boot="${boot}initrd=/kvmboot/${VM}/initrd-4.4.165-81-default,"
    boot="${boot}kernel_args=\"root=/dev/vda console=ttyS0\""
    disks=(
        "path=/dev/${VG}/${VM}-root-snap,bus=virtio,cache=none,format=raw --import"
        "path=/dev/${VG}/${VM}-swap,bus=virtio,cache=none,format=raw"
        "path=/dev/${VG}/${VM}-data,bus=virtio,cache=none,format=raw"
	"path=${d_tmp}/${VM}_config.iso,device=cdrom"
    )

    echo "*** Creating the VM ***"
    virt-install --name "${VM}" --memory 2048 --os-type linux            \
         -w network="${VM}-network",model=virtio,mac=da:9c:4a:e0:bb:9f   \
         --filesystem "${d_tmp}/share",host0                             \
         --graphics none                                                 \
	 ${disks[@]/#/--disk }                                           \
         --boot "${boot}"
}

show_console() {
    echo "*** Showing the console ***"
    virsh console "${VM}"
}


clean_old_vm
setup_storage
mount_guest
#install_remove_packages
fixup_snapshot
get_kernel
umount_guest
create_network
create_config_iso
create_vm
#show_console
exit 0
