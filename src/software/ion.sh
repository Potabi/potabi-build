# Ion is the OFFICIAL shell for Potabi Systems
# Beta-4 1.0A and later.
install_ion(){
    cd ${release}/usr/local/tmp
    fetch https://gitlab.redox-os.org/redox-os/ion/-/archive/master/ion-master.tar.gz
    tar xf ion-master.tar.gz
    cd ${release}/usr/local/tmp/ion-master 
    chroot ${release} make RUSTUP=0
    chroot ${release} make install prefix=/usr
    chroot ${release} make update-shells prefix=/usr
}