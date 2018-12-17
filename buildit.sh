#!/bin/bash

export VM=ci
export VG=virt

function clean_old_vm(){
    sudo virsh destroy $VM
    sudo virsh undefine $VM
}

function setup_storage(){
    if [[ ! -e /dev/mapper/${VG}-thinpool-tpool ]]; then
        echo No thin pool. Creating...
        lvcreate -L 1G -T ${VG}/thinpool
    fi
    if [[ ! -e /dev/${VG}/${VM}-root ]]; then
        echo No root fs
        exit 1
    fi
      
    lvremove -f /dev/${VG}/${VM}-root-snap
    lvcreate --snapshot --name ${VM}-root-snap --size 5G /dev/${VG}/${VM}-root
    # Make thin data and swap LVs
    lvremove -f /dev/${VG}/${VM}-data
    lvremove -f /dev/${VG}/${VM}-swap
    lvcreate --name ${VM}-data -V 10G ${VG}/thinpool
    lvcreate --name ${VM}-swap -V 1G ${VG}/thinpool
}

function mount_guest(){
    mount /dev/${VG}/${VM}-root-snap /mnt
}

function fixup_snapshot() {
    cat <<EOF > /mnt/etc/fstab
/dev/vda        /       ext4    rw,noatime,user_xattr,acl,barrier=1,data=ordered        0       1
EOF
    chroot /mnt systemctl enable cloud-init.service
    chroot /mnt passwd
    # set passwd until cloud-init runs
}

function get_kernel() {
    rm -rf /kvmboot/${VM}
    mkdir -p /kvmboot/${VM}
    cp /mnt/boot/vmlinuz-*  /kvmboot/${VM}/
    cp /mnt/boot/initrd-*  /kvmboot/${VM}/
}

function umount_guest(){
    umount /mnt
}
function create_config_iso(){
    cd /mer/jolla/devel/infra/deploy/cc-iso/
    genisoimage -o ${VM}_config.iso -V cidata -r -J meta-data user-data network-config

}
function create_vm() {
    sudo virt-install --name ${VM} --memory 512 --os-type linux \
         -w network=default,model=virtio \
         --disk vol=virsh_virt/${VM}-root-snap,bus=virtio,cache=none,format=raw --import \
         --disk path=/dev/${VG}/${VM}-swap,bus=virtio,cache=none,format=raw \
         --disk path=/dev/${VG}/${VM}-data,bus=virtio,cache=none,format=raw \
         --graphics none \
         --disk path=/mer/jolla/devel/infra/deploy/cc-iso/${VM}_config.iso,device=cdrom\
         --boot kernel=/kvmboot/${VM}/vmlinuz-4.4.162-78-default,initrd=/kvmboot/${VM}/initrd-4.4.162-78-default,kernel_args="root=/dev/vda console=ttyS0"
}

function show_console() {
    sudo virsh console ${VM}
}


clean_old_vm
setup_storage
mount_guest
fixup_snapshot
get_kernel
umount_guest

create_config_iso
create_vm
#show_console
exit 0


