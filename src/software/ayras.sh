install_ayras(){
    git clone https://github.com/Potabi/ayras ${release}/usr/local/tmp/ayras
    pkg install -y qt5-qmake trueos-libqt5 | true # Ensure Qmake is on the host system
    cd ${release}/usr/local/tmp/ayras
    qmake-qt5 PREFIX=${release}/usr/local LIBPREFIX=${release}/usr/local
    chroot ${release} ls
}