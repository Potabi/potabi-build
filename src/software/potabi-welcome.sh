install_potabi-welcome(){
    mkdir -pv ${release}/usr/local/potabi/welcome
    git clone https://github.com/Potabi/welcome ${release}/usr/local/potabi/welcome/. --depth 1
    cd ${release}/usr/local/potabi/welcome
    npm install
}