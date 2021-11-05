# Potabi welcome is indefinitely on pause.
. ${cwd}/src/software/vlang.sh 
# . ${cwd}/src/software/potabi-welcome.sh
. ${cwd}/src/software/doas.sh
. ${cwd}/src/software/package.sh

setup_software(){
    # install_potabi-welcome
    install_vlang
    install_doas
    install_package
}