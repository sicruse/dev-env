Si Cruse's dotfiles
===================

My dotfiles configuration for Mac OSX provides a one-stop shop for preparing a new Mac for productive development use.

Installation
------------

**PLEASE READ:** the following command will download a script which requires sudo (root) privileges to run. You should always understand the intention of any script which does this.

```bash
curl https://raw.githubusercontent.com/sicruse/dotfiles/master/remote-setup.sh | sh
```

Customization
-------------

If you would like to improve my approach or customize for your own personal app preferences please fork my repo & clone to your  ~/.dotfiles folder. The key Files you should look at to drive your customization are in the vars folder.

```
* vars.yml 					- contains your git identity
* ruby_gems.yml 			- contains the list of ruby gems to install
* dock-apps.yml 			- contains the list of apps to install and dock
* dock-folders.yml 			- contains the list of folders to dock
```

Key Foundational Components
---------------------------

The following tools are IMHO foundational to developing with the Mac. Git & git-flow for software configuration management, iTerm for ease of use, oh-my-zsh & powerline shell for a beautiful experience and ruby ... because well ... ruby.

* [Git](https://git-scm.com/) & [Git-flow](http://danielkummer.github.io/git-flow-cheatsheet/)
* [iTerm](https://www.iterm2.com/)
* [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh)
* [Powerline shell](https://github.com/banga/powerline-shell)
* [Ruby](https://www.ruby-lang.org/en/)

Key Apps
--------

Category | App | Description
---|---|---
**Web Browsing** | google-chrome | A fast, free web browser. One browser for your computer, phone and tablet
| |
**Utilities** | coconutbattery | With coconutBattery you are always aware of your current battery health. It shows you live information about the battery in your Mac and iOS device
| dropbox | Cloud file storage
| tunnelblick                | Free software for OpenVPN on OS X and macOS
| colorpicker-skalacolor     | An extraordinary color picker for designers and developers
| duet                       | Turn your iPad into an extra display.
| reflector                  | Wireless mirroring and streaming receiver that works great with Google Cast, AirPlay and AirParrot
| |
**Collaboration** | hipchat | Great teams use HipChat. Group chat, video chat, and screen sharing
| |
**Productivity** | microsoft-office | From desktop to web and the devices in between, Office delivers the tools you need to get work done.
| adobe-creative-cloud       | Designer. Photographer. Filmmaker. Dreamer. No matter who you are, Creative Cloud gives you the world’s best creative apps so you can make just about anything you want, wherever inspiration takes you.
| nozbe                      | Busy people and effective teams get tasks and projects done thanks to Nozbe system and apps
| evernote                   | Cloud document storage
| skitch                     | Get your point across with fewer words using annotation, shapes and sketches, so that your ideas become reality faster.
| citrix-receiver            | Citrix Receiver is the easy-to-install client software that provides access to your XenDesktop and XenApp installations.
| |
**Editors / IDEs** | sublime-text | Sublime Text is a sophisticated text editor for code, markup and prose.
| android-studio             | Android Studio provides the fastest tools for building apps on every type of Android device.
| unity                      | The number one game development platform. Unity gives you everything you need to realize your creative vision fast, and move ahead.
| blender                    | Open Source 3D creation. Free to use for any purpose, forever.
| |
**Version Control** | sourcetree | Harness the power of Git and Hg in a beautifully simple application
| p4merge                    | P4Merge lets you visualize the differences between file versions. Color coding makes it easy to resolve conflicts that result from parallel or concurrent development.
| |
**Database** | mysqlworkbench | MySQL Workbench is a unified visual tool for database architects, developers, and DBAs. MySQL Workbench provides data modeling, SQL development, and comprehensive administration tools for server configuration, user administration, backup, and much more.
| robomongo                  | Native and cross-platform MongoDB manager
| |
**Virtualization** | parallels-desktop | The fastest, easiest, and most powerful solution for running Windows applications on a Mac—without rebooting.
| virtualbox                 | VirtualBox is a general-purpose full virtualizer for x86 hardware, targeted at server, desktop and embedded use.
| vagrant                    | Create and configure lightweight, reproducible, and portable development environments.
| docker                     | Docker is the world’s leading software containerization platform
| kitematic                  | Run containers through a simple, yet powerful graphical user interface.
| |
**Ripping** | ripit | The simple DVD ripper for Macs.
| subler                     | Subler is an Mac OS X app created to mux and tag mp4 files
| |
**Gaming** | steam | Steam provides the user with nd automatic updating of games

Dependencies
------------

These tools are installed as needed by **setup.sh** in prelude to invoking Ansible playbook

* XCode command-line tools - for package compilation
* Homebrew - for package & app installation
* Ansible - for determenistic component installation
* [sicruse.dockapps](https://galaxy.ansible.com/sicruse/dockapps/) - for app installation & dock management

**Note:** see the documentation for **sicruse.dockapps** for more detail upon how to configure your own preferred apps.

Assumptions
-----------

The configuration assumes that you have manually installed XCode & Apple Remote Desktop. If you have not installed them you will notice a couple of '?' sysmbols on the dock.

License
-------

MIT

Author Information
------------------

If you have any questions or comments feel free to reach me via [email](mailto:si@sicruse.com?subject=dotfiles Feedback)