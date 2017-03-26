# PAC Learning Thesis


## Build instructions

### Any other OS

Install your favorite TeX distribution. make sure `latexmk` is included.
Now type `make`.  Perhaps you don't have all the packages from CTAN. Install random ones untill the thing builds.

### NixOS

Type in `nix-build`. It will install a minimal `TeX` environment and
it will pull all the required packages and install them as well. The
report ends up in `result/`



