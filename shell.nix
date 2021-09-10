let pkgs = import <nixpkgs> {}; in
pkgs.mkShell {
    buildInputs = [
        pkgs.cargo 
        pkgs.rustfmt
        pkgs.vim # xxd
        pkgs.qemu
        pkgs.file
        pkgs.entr
        pkgs.binwalk
        pkgs.foreman
        pkgs.slirp4netns
        pkgs.nftables
    ];
}
