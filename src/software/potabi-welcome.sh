install_potabi-welcome(){
    chroot ${release} cp /usr/share/skel/Desktop/potabi-welcome.Desktop /home/${liveuser}/.config/autostart/potabi-welcome.desktop
}