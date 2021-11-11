install_ayras(){
    cd ${release}/usr/local/tmp
    fetch https://github.com/Potabi/ayras/archive/refs/tags/v1.6.1.tar.gz
    pkg install -y qmake | true # Ensure Qmake is on the host system
    tar xf v1.6.1.tar.gz
    cd ayras-v1.6.1
    qmake PREFIX=${release}/usr/local LIBPREFIX=${release}/usr/local
    chroot ${release} ls
}