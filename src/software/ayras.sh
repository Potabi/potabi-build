install_ayras(){
    # Yes, I know I fucked up on the release numbers when making these. 
    # Oh well. At least we know for a while that these have to be the 
    # packages I made because only I am stupid enough to let this happen.

    pkg -c ${release} install -y ${sftdir}/pkg/ayras-coreutils-1.6.3.pkg
    pkg -c ${release} install -y ${sftdir}/pkg/lumina-core-1.6.3_1.pkg
}