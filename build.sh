#!/bin/sh
set -e -u 

# Run script as root
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root"
    exit 1
fi

export cwd="`realpath | sed 's|/scripts||g'`"

. ${cwd}/conf/build.conf
. ${cwd}/conf/general.conf

cleanup(){
    umount ${release} || true
    umount ${release}/dev || true
    umount ${release}/var/cache/pkg/ || true
    mdconfig -d -u 0 || true
    rm -rf ${livecd}/pool.img || true
    rm -rf ${livecd} || true
}

setup(){
    # Make directories
    mkdir -pv ${livecd} ${base} ${iso} ${software} ${base} ${release} ${cdroot}

    # Create and mount pool
    rm -f ${livecd}/pool.img || true
    truncate -s 6g ${livecd}/pool.img
    mdconfig -a -t vnode -f ${livecd}/pool.img -u 0
    gpart create -s GPT md0
    gpart add -t freebsd-ufs md0
    bsdlabel -w md0 auto
    newfs -U md0a
    mount /dev/md0a ${release}
}

build(){
    # Add and extract base/kernel into ${release}
    cd ${base}
    fetch https://github.com/Potabi/release/releases/download/${version}-base/base.txz
    fetch https://github.com/Potabi/release/releases/download/${version}-base/kernel.txz
    tar -zxvf base.txz -C ${release}
    tar -zxvf kernel.txz -C ${release}

    # Add base items
    touch ${release}/etc/fstab
    mkdir -pv ${release}/cdrom

    # Add packages
    cp /etc/resolv.conf ${release}/etc/resolv.conf
    mkdir -pv ${release}/var/cache/pkg
    mount_nullfs ${software} ${release}/var/cache/pkg
    mount -t devfs devfs ${release}/dev
    cat ${cwd}/packages/${tag}.${desktop} | xargs pkg -c ${release} install -y
    rm ${release}/etc/resolv.conf
    umount ${release}/var/cache/pkg
    
    # rc
    . ${cwd}/src/setuprc.sh
    setuprc

    # Add live user
    chroot ${release} pw useradd ${liveuser} \
    -c "Potabi Live User" -d "/usr/home/${liveuser}"\
    -g wheel -G operator -m -s /bin/tcsh -k /usr/share/skel -w none

    chroot ${release} mkdir -pv /home/${liveuser}/Desktop /home/${liveuser}/Documents /home/${liveuser}/Downloads /home/${liveuser}/Music /home/${liveuser}/Pictures /home/${liveuser}/Projects /home/${liveuser}/Videos

    # Add desktop environment
    sed -i '' "s@#greeter-session=example-gtk-gnome@greeter-session=slick-greeter@" ${release}/usr/local/etc/lightdm/lightdm.conf
    
    if [ "${desktop}" == "mate" ] ; then
        sed -i '' "s@#user-session=default@user-session=mate@" ${release}/usr/local/etc/lightdm/lightdm.conf
    elif [ "${desktop}" == "xfce" ] ; then
        sed -i '' "s@#user-session=default@user-session=xfce@" ${release}/usr/local/etc/lightdm/lightdm.conf
    elif [ "${desktop}" == "cinnamon" ] ; then
        sed -i '' "s@#user-session=default@user-session=cinnamon@" ${release}/usr/local/etc/lightdm/lightdm.conf
    elif [ "${desktop}" == "kde" ] ; then
        sed -i '' "s@#user-session=default@user-session=plasma@" ${release}/usr/local/etc/lightdm/lightdm.conf
    fi

    if [ "${desktop}" == "mate" ] ; then
        echo "exec ck-launch-session mate-session" >> ${release}/usr/home/${liveuser}/.xinitrc
        echo "exec ck-launch-session mate-session" > ${release}/root/.xinitrc
    elif [ "${desktop}" == "xfce" ] ; then
        echo "exec ck-launch-session startxfce4" > ${release}/usr/home/${liveuser}/.xinitrc
        echo "exec ck-launch-session startxfce4" > ${release}/root/.xinitrc
    elif [ "${desktop}" == "cinnamon" ] ; then
        echo "exec ck-launch-session cinnamon-session" > ${release}/usr/home/${liveuser}/.xinitrc
        echo "exec ck-launch-session cinnamon-session" > ${release}/root/.xinitrc
    elif [ "${desktop}" == "kde" ] ; then
        echo "exec ck-launch-session startplasma-x11"> ${release}/usr/home/${liveuser}/.xinitrc
        echo "exec ck-launch-session startplasma-x11" > ${release}/root/.xinitrc
    fi

    # Add login.conf
    cp -R boot/ ${cdroot}/boot/
    mkdir ${cdroot}/etc
}

image(){
    sh ${cwd}/src/mkisoimages.sh -b ${label} ${isopath} ${cdroot}
    cd ${iso}
    echo "Build completed"
    ls
}

cleanup
setup
build
image