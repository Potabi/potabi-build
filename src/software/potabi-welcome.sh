install_potabi-welcome(){
    mkdir -pv
    git clone https://github.com/Potabi/welcome ${release}/usr/local/potabi/welcome/. --depth 1
    chroot ${release} cd /usr/local/potabi/welcome && npm install
}