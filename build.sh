#!/bin/sh
set -e -u

# Run script as root
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

export cwd="`realpath | sed 's|/scripts||g'`"

. ${cwd}/conf/build.conf
. ${cwd}/conf/general.conf

cleanup(){

}

workspace(){

}

software(){
    # Software installation from GhostBSD build
    cp /etc/resolv.conf ${release}/etc/resolv.conf
    mkdir -p ${release}/var/cache/pkg
    mount_nullfs ${software} ${release}/var/cache/pkg
    mount -t devfs devfs ${release}/dev
    cat ${cwd}/packages/${tag}.${desktop} | xargs pkg -c ${release} install -y
    mkdir -p ${release}/compat/linux/proc
    rm ${release}/etc/resolv.conf
    umount ${release}/var/cache/pkg
}

user(){
    chroot ${release} pw useradd ${liveuser} \
    -c "Potabi User" -d "/usr/home/${liveuser}"\
    -g wheel -G operator -m -s /usr/local/bin/tcsh -k /usr/share/skel -w none
    chroot ${release} su ${liveuser} -c "mkdir -p /usr/home/${liveuser}/Desktop"
}

config(){
    # rc.conf
    chroot ${release} touch /etc/rc.conf
    chroot ${release} sysrc hostname="potabi"
    chroot ${release} sysrc moused_enable="YES"
    chroot ${release} sysrc dbus_enable="YES"
    chroot ${release} sysrc lightdm_enable="YES"
    chroot ${release} sysrc webcamd_enable="YES"
}

uzip(){
    umount ${release}/dev
    install -o root -g wheel -m 755 -d "${cdroot}"
    mkdir "${cdroot}/data"
}

ramdisk(){

}

boot(){

}

image(){
    sh ${cwd}/src/mkisoimages.sh -b ${label} ${isopath} ${cdroot}
    cd ${iso}
    echo "Build completed"
    ls
}