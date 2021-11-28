install_ayras(){
    # Yes, I know I fucked up on the release numbers when making these. 
    # Oh well. At least we know for a while that these have to be the 
    # packages I made because only I am stupid enough to let this happen

    cp ${sftdir}/pkg/ayras-coreutils-1.6.3.pkg ${release}/usr/local/tmp/ayras-coreutils-1.6.3.pkg
    cp ${sftdir}/pkg/lumina-core-1.6.3_1.pkg ${release}/usr/local/tmp/lumina-core-1.6.3_1.pkg

    chroot ${release} pkg install -y /usr/local/tmp/ayras-coreutils-1.6.3.pkg
    chroot ${release} pkg install -y /usr/local/tmp/lumina-core-1.6.3_1.pkg
}