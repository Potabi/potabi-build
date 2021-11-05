install_doas(){
    chroot ${release} touch /usr/local/etc/doas.conf && echo "permit nopass keepenv :wheel" >> /usr/local/etc/doas.conf && echo "permit nopass keepenv root as root" >> /usr/local/etc/doas.conf
    ln ${release}/usr/local/bin/doas ${release}/usr/local/bin/sudo
    ln ${release}/usr/local/bin/doas ${release}/usr/local/bin/admin
    ln ${release}/usr/local/bin/doas ${release}/usr/local/bin/root
}