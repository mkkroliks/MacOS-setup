#!/bin/bash

# Uninstall power-font type fonts.
git clone https://github.com/powerline/fonts.git
fonts/uninstall.sh
#rm -fr fonts

# Removes bash_profile Terminal config file
rm ~/.bash_profile

# Uninstall oh-my-zsh
uninstall_oh_my_zsh
