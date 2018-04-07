#!/usr/bin/env bash

echo "Setting up dotfiles for Mac..."

############ Set up ############
echo In order to install software we need you to provide your sudo password...
sudo -v # ask for sudo upfront

# Keep-alive: update existing `sudo` time stamp until `setup` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

############ Install XCode command line tools ############
if type xcode-select >&- && xpath=$( xcode-select --print-path 2> /dev/null ) && test -d "${xpath}" && test -x "${xpath}" ; then
   echo XCode command line tools already present...
else
  echo Installing XCode command line tools...
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
  PROD=$(softwareupdate -l |
    grep "\*.*Command Line" |
    head -n 1 | awk -F"*" '{print $2}' |
    sed -e 's/^ *//' |
    tr -d '\n')
  softwareupdate -i "$PROD" -v;
fi

############ Install Homebrew ############
if ! command -v brew >/dev/null; then
  echo Installing Homebrew...
  # supress the need to press 'return' when in the install script runs.
  yes '' | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo Homebrew already present...
fi

############ Install Ansible ############
if ! command -v ansible >/dev/null; then
   echo Installing Ansible...
   brew install ansible
else
   echo Ansible already present...
fi

############ Invoke Ansible ############
echo Refreshing Ansible Galaxy...
# ansible-galaxy install -f tvieira.powerline-fonts
# ansible-galaxy install -f sicruse.dockapps
ansible-galaxy install -f -r requirements.yml
echo Invoking Ansible...
ansible-playbook -i "localhost," -c local $HOME/.dotfiles/setup.yml --extra-vars "user_id=$(whoami)"

echo "Setup complete..."
