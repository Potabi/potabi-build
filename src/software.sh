. ${cwd}/src/software/vlang.sh 
. ${cwd}/src/software/potabi-welcome.sh
. ${cwd}/src/software/doas.sh

setup_software(){
    install_potabi-welcome
    install_vlang
    install_doas
}