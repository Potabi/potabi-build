install_ayras(){
    git clone https://github.com/Potabi/ayras ${release}/usr/local/tmp/ayras
    pkg install -y qt5-qmake qmake trueos-libqt5 | true # Ensure Qmake is on the host system
    mkdir -pv /usr/lib/qt5
    mkdir -pv /usr/lib/qt5/bin
    mkdir -pv ${release}/usr/lib/qt5
    mkdir -pv ${release}/usr/lib/qt5/bin
    ln ${release}/usr/local/bin/qmake ${release}/usr/lib/qt5/bin/qmake
    cd ${release}/usr/local/tmp/ayras
    chroot ${release} cd env QMAKESPEC=freebsd-g++ && qmake && ls
    chroot ${release} cd /usr/local/tmp/ayras && qmake && ls
    chroot ${release} cd /usr/local/tmp/ayras && make && ls
    chroot ${release} cd /usr/local/tmp/ayras && make install && ls
    exit 1
}