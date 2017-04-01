#! /bin/sh
 nix-shell -p entr -p mupdf --command "ls -d * | grep -v result | entr nix-build"
