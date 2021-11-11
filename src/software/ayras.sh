install_ayras(){
    git clone https://github.com/Potabi/ayras ${release}/usr/local/tmp/ayras
    pkg install -y qt5-qmake trueos-libqt5 | true # Ensure Qmake is on the host system
    cd ${release}/usr/local/tmp/ayras
    chroot ${release} cd /usr/local/tmp/ayras && qmake-qt5
    chroot ${release} cd /usr/local/tmp/ayras && make
    chroot ${release} cd /usr/local/tmp/ayras && make install && ls
    exit 1
}