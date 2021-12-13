install_potabi-installer(){
    cp ${sftdir}/pkg/pc-sysinstall-2021041900,1.pkg ${release}/usr/local/tmp/pc-sysinstall-2021041900,1.pkg
    cp ${sftdir}/pkg/potabi-installer-ptbi.9.6.pkg ${release}/usr/local/tmp/potabi-installer-ptbi.9.6.pkg

    chroot ${release} pkg install -y /usr/local/tmp/pc-sysinstall-2021041900,1.pkg
    chroot ${release} pkg install -y /usr/local/tmp/potabi-installer-ptbi.9.6.pkg
}
