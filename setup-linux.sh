#!/usr/bin/env bash

echo "Setting up dotfiles for Linux..."

############ Set up ############
echo In order to install software we need you to provide your sudo password...
sudo -v # ask for sudo upfront

# Keep-alive: update existing `sudo` time stamp until `setup` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

############ Install Ansible ############
if ! command -v ansible >/dev/null; then
   echo Installing Ansible...
   sudo apt-add-repository ppa:ansible/ansible -y
   sudo apt-get update
   sudo apt-get install ansible -y
else
   echo Ansible already present...
fi

############ Invoke Ansible ############
#echo Refreshing Ansible Galaxy...
ansible-galaxy install -f -r requirements.yml
ansible-playbook -i "localhost," -c local $HOME/.dotfiles/setup.yml --extra-vars "user_id=$(whoami)"

echo "Setup complete..."
