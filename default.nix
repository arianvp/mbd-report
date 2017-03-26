{ pkgs ? import <nixpkgs> {}}:


let
  texpkgs = pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-small latexmk;
  };
in
  pkgs.stdenv.mkDerivation {
    name = "mbd";
    src = pkgs.lib.cleanSource ./.;
    buildInputs = [ 
      texpkgs
    ];
  }

