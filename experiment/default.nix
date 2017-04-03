with import <nixpkgs> {};
let
  fim =
    pkgs.pythonPackages.buildPythonPackage rec {
      name = "fim-${version}";
      version = "6.2.7";

      src = pkgs.fetchurl {
        url =  "https://files.pythonhosted.org/packages/cd/a8/66fbb303236eb7e4caa63096814aa2675073f20aee95104920636af84a7e/fim-6.27.tar.gz";
        sha256 = "80a2c6a17e1859c120cde74625f038587730885457721678af13b66116919648";
      };

      doCheck = false;

    };
in
  pkgs.pythonPackages.buildPythonPackage {
    name = "mbd-0.0.1";
    src = lib.cleanSource ./.;
    propagatedBuildInputs = [ fim pkgs.pythonPackages.numpy ];
    
  }
