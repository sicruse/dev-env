#!/usr/bin/env bash

[[ -x `command -v wget` ]] && CMD="wget --no-check-certificate -O -"
[[ -x `command -v curl` ]] >/dev/null 2>&1 && CMD="curl -#L"

if [ -z "$CMD" ]; then
  echo "No curl or wget available. Aborting."
else
  echo "Installing Development Environment"
  mkdir -p "$HOME/.dev-env" && \
  eval "$CMD https://github.com/sicruse/dev-env/tarball/master | tar -xzv -C ~/.dev-env --strip-components=1 --exclude='{.gitignore}'"
  . "$HOME/.dev-env/setup.sh"
fi
