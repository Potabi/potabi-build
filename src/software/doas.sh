install_doas(){
    chroot ${release} touch /usr/local/etc/doas.conf && echo "permit nopass keepenv :wheel" >> /usr/local/etc/doas.conf && echo "permit nopass keepenv root as root" >> /usr/local/etc/doas.conf
}