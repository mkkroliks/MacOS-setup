#!/bin/bash


## Check if Homebrew is already installed
#function checkOhMyZSH {
#
#    result=$(brew -v)
#
#    if [ -z "$brewResult" ]; then
#        echo
#        "Homebrew is missing. Installation..."
#        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#    else
#        echo "Homebrew found"
#    fi
#}
#
## Install oh-my-zsh
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install power-font type fonts so Agnoster(oh-my-zsh theme) will be properly formatted.
git clone https://github.com/powerline/fonts.git
./fonts/install.sh
rm -fr fonts

### Install terminal colors for Bash (choose between light and dark theme)
#echo -e "export CLICOLOR=1\n#light theme\nexport LSCOLORS=ExFxBxDxCxegedabagacad\n#dark theme\n#export LSCOLORS=GxFxCxDxBxegedabagaced" >> ~/.bash_profile

# Install terminal colors for zsh (light theme)
# Use this generator to translate BSD colors and Linux colors: https://geoff.greer.fm/lscolors/
#echo -e 'export LSCOLORS="ExFxBxDxCxegedabagacad"' >> ~/.zshrc
#echo -e 'export LS_COLORS="di=1;34:ln=1;35:so=1;31:pi=1;33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"' >> ~/.zshrc
#echo -e "zstyle ':completion:*:default' list-colors \${(s.:.)LS_COLORS}" >> ~/.zshrc

# Replaces default theme with agnoster theme
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

## Uncomment en_US.UTF-8 locale for console, making them undependable from macOS locale settings
#sed -i -e 's/# export LANG=en_US.UTF-8/export LANG=en_US.UTF-8/g' ~/.zshrc


## Copy SF Mono font (available only in Xcode and Terminal.app) to the system
#cp -R /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/. /Library/Fonts/
