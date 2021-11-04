install_vlang(){
    mkdir -pv ${release}/usr/local/generic/v
    git clone https://github.com/vlang/v ${release}/usr/local/generic/v/. --depth 1
    chroot ${release} cd /usr/local/generic/v && make && chmod 775 ./v && ./v symlink && cd /
}