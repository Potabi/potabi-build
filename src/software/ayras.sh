install_ayras(){
    git clone https://github.com/Potabi/ayras ${release}/usr/local/tmp/ayras
    pkg install -y qmake | true # Ensure Qmake is on the host system
    cd ${release}/usr/local/tmp/ayras
    qmake PREFIX=${release}/usr/local LIBPREFIX=${release}/usr/local
    chroot ${release} ls
}