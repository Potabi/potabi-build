install_vlang(){
    chroot ${release} cd /usr/local/generic/v && make && chmod 775 ./v && ./v symlink && cd /
}