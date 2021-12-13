. ${sftdir}/vlang.sh 
# Potabi welcome is indefinitely on pause.
# . ${cwd}/src/software/potabi-welcome.sh
. ${sftdir}/doas.sh
. ${sftdir}/ayras.sh
. ${sftdir}/package.sh
. ${sftdir}/ptbinst.sh

setup_software(){
    mkdir -pv ${release}/usr/local/tmp # This is where many things to go get tested for compile
    # install_potabi-welcome
    install_ayras
    install_vlang
    install_doas
    install_package
    install_potabi-installer
}
