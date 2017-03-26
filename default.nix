{ pkgs ? import <nixpkgs> {}}:


let
  texpkgs = pkgs.texlive.combine {
    inherit (pkgs.texlive)
      scheme-small
      latexmk
      algorithmicx
      minted
      ifplatform
      xstring
      lineno
      framed;
  };
in
  pkgs.stdenv.mkDerivation {
    name = "mbd";
    src = pkgs.lib.cleanSource ./.;
    buildInputs = [ 
      texpkgs
      pkgs.which # used to find  pygments by minted
      pkgs.pythonPackages.pygments
    ];
  }

