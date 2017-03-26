#! /bin/sh
 nix-shell -p entr --command "ls -d * | grep -v result | entr nix-build"
