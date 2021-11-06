. ${sftdir}/vlang.sh 
# Potabi welcome is indefinitely on pause.
# . ${cwd}/src/software/potabi-welcome.sh
. ${sftdir}/doas.sh
. ${sftdir}/package.sh

setup_software(){
    # install_potabi-welcome
    install_vlang
    install_doas
    install_package
}