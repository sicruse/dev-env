#!/usr/bin/env bash

############ What flavor machine is this? ############
unameOut="$(uname -s)"
case "${unameOut}" in
  Linux*)     machine=Linux;;
  Darwin*)    machine=Mac;;
  CYGWIN*)    machine=Cygwin;;
  MINGW*)     machine=MinGw;;
  *)          machine="UNKNOWN:${unameOut}"
esac

case "${machine}" in
  Linux)      ./setup-linux.sh;;
  Mac)        ./setup-mac.sh;;
  *)
    echo "No dotfile support for $machine..."
    exit 1
    ;;
esac
