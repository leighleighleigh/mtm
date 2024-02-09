{ pkgs ? import <nixpkgs> {} }:
let
  mtm = pkgs.callPackage ./default.nix { };
in
pkgs.mkShell rec {
  buildInputs = [ mtm ];

  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;

  shellHook = ''
    export PS1="''${debian_chroot:+($debian_chroot)}\[\033[01;39m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ "
    export PS1="(mtm)$PS1"
  '';
}

