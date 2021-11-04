install_potabi-welcome(){
    # chroot ${release} cp /usr/share/skel/Desktop/potabi-welcome.Desktop /home/${liveuser}/.config/autostart/potabi-welcome.desktop
    cp ${cwd}/uzip/potabi-welcome/files/usr/share/skel/Desktop/potabi-welcome.Desktop ${release}/home/${liveuser}/.config/autostart/potabi-welcome.desktop
}