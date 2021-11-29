install_potabi-installer(){
    mkdir -pv ${release}/usr/local/potabi | true
    cd ${release}/usr/local/potabi
    fetch https://github.com/ghostbsd/pc-sysinstall/archive/refs/heads/master.zip -o pc-sysinstall.zip
    fetch https://github.com/potabi/potabi-installer/archive/refs/heads/master.zip -o potabi-installer.zip
    unzip -d pc-sysinstall pc-sysinstall.zip
    unzip -d potabi-installer potabi-installer.zip
    cd ${release}/usr/local/potabi/pc-sysinstall
    chroot ${release} make install
    cd ${release}/usr/local/potabi/potabi-installer
    chroot ${release} python3.8 setup.py install
}