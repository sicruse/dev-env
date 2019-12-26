Si Cruse's Development Environment
==================================

My development environment configuration for Mac OSX (and now Ubuntu Linux!) provides a one-stop shop for preparing a productive development environment.

Installation
------------

**PLEASE READ:** the following command will download a script which requires sudo (root) privileges to run. You should always understand the intention of any script which does this.

```bash
curl https://raw.githubusercontent.com/sicruse/dev-env/master/remote-setup.sh | sh
```

Customization
-------------

If you would like to improve my approach or customize for your own personal app preferences please fork my repo & clone to your  ~/.dev-env folder. The key Files you should look at to drive your customization are in the vars folder.

```
* dotfiles.yml 			- cites the dotfiles repository to use for base configuration
* homebrew.yml 			- contains the list of apps to install using Homebrew
* masapps.yml 			- contains the list of apps to install using the Mac App Store
* rubygems.yml 			- contains the list of ruby gems to install
* dockapps.yml 			- contains the list of apps & folders to add to the MacOSX dock
```

Dependencies
------------

These tools are installed as needed by **setup.sh** in prelude to invoking Ansible playbook

* XCode command-line tools - for package compilation
* Homebrew - for initial Homebrew package installation
* Ansible - for deterministic component installation
* Choice - for presentation of install options
* [geerlingguy.dotfiles](https://galaxy.ansible.com/geerlingguy/dotfiles/) - for dotfile configuration management
* [geerlingguy.homebrew](https://galaxy.ansible.com/geerlingguy/homebrew/) - for Homebrew package management
* [geerlingguy.mas](https://galaxy.ansible.com/geerlingguy/mas/) - for Mac App store management
* [sicruse.dockapps](https://galaxy.ansible.com/sicruse/dockapps/) - for Mac OS dock management
* [sicruse.powerline-fonts](https://galaxy.ansible.com/sicruse/powerline-fonts/) - to install fonts required for powerlevel9k

License
-------

MIT

Author Information
------------------

If you have any questions or comments feel free to reach me via [email](mailto:si@sicruse.com?subject=Development%20Environment%20Feedback)
