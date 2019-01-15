#!/bin/bash
set -eu

OS="42.3"
TARGET="${1:-/dev/sdb}"

egrep -q "^${TARGET}" /etc/mtab && {
    echo "${TARGET} appears in /etc/mtab, stop." >&2
    exit 42
}

PKGS=(
    bash-completion
    curl
    emacs-nox
    iptables
    iputils
    less
    openssh
    puppet
    rsync
    sudo
    terminfo
    wget
    wicked
)
NOPKGS=(
    gfxboot
    gfxboot-branding-openSUSE
    grub2
    grub2-branding-openSUSE
    lvm2
    plymouth
    plymouth-branding-openSUSE
    rpcbind
    ruby2.1
)

tmp_d="$( mktemp -d )"
tmp_mnt="${tmp_d}/mnt"
tmp_rootfs="${tmp_d}/rootfs"
dsc="${tmp_d}/kiwi-descriptions/suse/x86_64/suse-leap-${OS}-JeOS/"

cleanup()
{
    umount "${tmp_mnt}"
    rm -rf "${tmp_d}"
}
trap cleanup EXIT

zypper ar -f http://download.opensuse.org/repositories/Virtualization:/Appliances:/Builder/openSUSE_Leap_42.3/Virtualization:Appliances:Builder.repo || :
zypper in --no-recommends python3-kiwi unzip curl checkmedia

mkdir -p "${tmp_rootfs}"
mkdir -p "${tmp_mnt}"
mount "${TARGET}" "${tmp_mnt}"

cd "${tmp_d}"
git clone https://github.com/SUSE/kiwi-descriptions

kiwi-ng                         \
    --logfile=kiwi_${OS}.log    \
    --debug                     \
    system prepare              \
    --description="${dsc}"      \
    --root="${tmp_rootfs}"      \
    --allow-existing-root       \
    --ignore-repos              \
    --add-repo=http://download.opensuse.org/distribution/leap/${OS}/repo/oss/,yast2,"openSUSE-${OS}_OSS",1,true          \
    --add-repo=http://download.opensuse.org/distribution/leap/${OS}/repo/non-oss/,yast2,"openSUSE-${OS}_Non-OSS",1,true  \
    --add-repo=http://download.opensuse.org/update/leap/${OS}/oss/,rpm-md,"openSUSE-${OS}_Update",1,true                 \
    --add-repo=http://download.opensuse.org/update/leap/${OS}/non-oss/,rpm-md,"openSUSE-${OS}_Update-Non-OSS",1,true     \
    "${NOPKGS[@]/#/--delete-package=}" "${PKGS[@]/#/--add-package=}"

rsync -HAXav --numeric-ids --delete "${tmp_rootfs}/" "${tmp_mnt}"
