install_doas(){
    mkdir -pv ${release}/usr/local/etc
    touch ${release}/usr/local/etc/doas.conf
    echo "permit nopass keepenv :wheel" >> ${release}/usr/local/etc/doas.conf
    echo "permit nopass keepenv root as root" >> ${release}/usr/local/etc/doas.conf
    ln ${release}/usr/local/bin/doas ${release}/usr/local/bin/sudo
    ln ${release}/usr/local/bin/doas ${release}/usr/local/bin/admin
    ln ${release}/usr/local/bin/doas ${release}/usr/local/bin/root
}