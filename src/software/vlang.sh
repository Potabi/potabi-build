install_vlang(){
    mkdir -pv ${release}/usr/local/generic/v
    git clone https://github.com/vlang/v ${release}/usr/local/generic/v/. --depth 1
    cd ${release}/usr/local/generic/v/
    make 
    chmod 775 ${release}/usr/local/generic/v/v 
    ln ${release}/usr/local/generic/v/v ${release}/bin/v
}