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

############ Install dialog ############
if ! command -v dialog >/dev/null; then
   echo Installing dialog...
   brew install dialog
else
   echo Dialog already present...
fi

############ Present Options ############
height=22
width=50
cmd=(dialog --separate-output --checklist "Select options:" $height $width 16)
options=(zsh "zsh and oh-my-zsh" on    # any option can be set to default to "on"
         ruby "ruby" on
         node "node" on
         react-native "react native" on
         powerline "powerline fonts" on
         dotfiles "dotfiles" on
         homebrew "homebrew" on
         mas "mas" on
         dockapps "OSX Dock" on
         )
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

############ Invoke Ansible ############
echo Refreshing Ansible Galaxy...
ansible-galaxy install -r $HOME/.dev-env/requirements.yml

echo Invoking Ansible...
ansible-playbook -i "localhost," -c local $HOME/.dev-env/setup.yml  --tags "${choices//$'\n'/,}"

echo "Setup complete..."
