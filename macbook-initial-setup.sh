#!/bin/bash

# install homebrew apps repositories manager
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# List of non-AppStore apps
nonAppStoreApps=(
#Developer
    postman # Most popular HTTP requests tool
    visual-studio-code # Modern code editor with community-driven plugins
    charles # Web debugging proxy
    iterm2 # Alternative terminal
    sketch # UI/UX design tool
    sourcetree # GUI for git and gitflow
    sherlock # App to edit iOS Views on the fly
    isimulator # App to manage iOS Simulators
#Video
    iina # Best looking macOS video watching app
    vlc # Most popular cross-platform video watching app
#Subtitles
    flixtools # Subtitles downloader
#Developer
    reveal # App to edit iOS Views on the fly
#Other
    spotify # Most popular music streaming service
)

# install non-AppStore apps
brew cask install ${nonAppStoreApps[@]}

# Install AppStore CLI installer
brew install mas

# list of AppStore apps
appStoreApps=(
    441258766 # Magnet (Organises apps views on a screen)
    458887729 # Translate Tab (Google Translator wrapper app)
#    497799835 # Xcode (Apple IDE)
#    1333542190 # 1Password 7 (Password Manager)
#    803453959 # Slack (Communicator)
#    409201541 # Pages (Apple's documents editor)
#    409203825 # Numbers (Apple's spreadsheets editor)
#    409183694 # Keynote (Apple's presentations editor)
    425424353 # The Unarchiver (Archives extractor)
    1330801220 # quicktype (JSON to Code generator)
    865500966 # Feedly (RSS Reader)
)

# Install AppStore apps
mas install ${appStoreApps[@]}

#Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Remove ALL icons (except Finder) from dock
echo "Removing all icons (except Finder) from the dock…"
defaults write com.apple.dock persistent-apps -array

# List of dock icons
dockIcons=(
    /System/Applications/Mail.app
    /Applications/Slack.app
    /Applications/Spotify.app
    /Applications/Sourcetree.app
    /Applications/Visual\ Studio\ Code.app
    /Applications/Xcode-11.1.app
    /System/Applications/Reminders.app
    /System/Applications/Notes.app
    /Applications/Feedly.app
)
#
# Adding icons
for icon in "${dockIcons[@]}"
do
    echo "Adding $icon to the dock…"
    defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$icon</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
done

echo "Setting up dock size…"
defaults write com.apple.dock tilesize -int 45

echo "Deosn't show recently used apps in a Dock"
defaults write com.apple.dock show-recents -bool FALSE

echo "Minimize app windows to app icons"
defaults write com.apple.dock minimize-to-application -bool TRUE

echo "Sets bottom right hot corner which action in showing Desktop"
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0

echo "Restarting dock…"
killall Dock

## Xcode won't ask for password with every build
DevToolsSecurity -enable

## Install terminal colors for Bash (choose between light and dark theme)
#echo -e "export CLICOLOR=1\n#light theme\nexport LSCOLORS=ExFxBxDxCxegedabagacad\n#dark theme\n#export LSCOLORS=GxFxCxDxBxegedabagaced" >> ~/.bash_profile
#
## Install terminal colors for zsh (light theme)
## Use this generator to translate BSD colors and Linux colors: https://geoff.greer.fm/lscolors/
#echo -e 'export LSCOLORS="ExFxBxDxCxegedabagacad"' >> ~/.zshrc
#echo -e 'export LS_COLORS="di=1;34:ln=1;35:so=1;31:pi=1;33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"' >> ~/.zshrc
#echo -e "zstyle ':completion:*:default' list-colors \${(s.:.)LS_COLORS}" >> ~/.zshrc
#
## Replaces default theme with jreese theme (works great with light theme)
#sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="jreese"/g' ~/.zshrc
#
## Uncomment en_US.UTF-8 locale for console, making them undependable from macOS locale settings
#sed -i -e 's/# export LANG=en_US.UTF-8/export LANG=en_US.UTF-8/g' ~/.zshrc
#
#
## Copy SF Mono font (available only in Xcode and Terminal.app) to the system
#cp -R /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/. /Library/Fonts/
#
## Use bbedit as a git editor
#git config --global core.editor "bbedit -w"
#
## install CocoaPods dependency manager for iOS apps
#sudo gem install cocoapods
#
## install CocoaPods Keys plugin
#sudo gem install cocoapods-keys
#
#
## Create symlinks between home folder and iCloud folders
## Without this navigating in Finder between iCloud folders (like Desktop)
## and Home Folders (like Downloads) only with keyboard is nearly impossible
#
##WARNING This command uses "~" sign, so don't just copy paste it using ZSH. Use bash for this one!
#ln -s ~/ ~/Library/Mobile\ Documents/com~apple~CloudDocs/$(whoami)\ home\ symlink
#ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents ~/Documents\ symlink
#ln -s ~/Desktop ~/Desktop\ symlink
#
## If you want to make a Developer folder synchronise.
## So far only compiling LateX doesn't work in this folder because of "~" sign in the path.
#
## mkdir ~/Library/Mobile\ Documents/com~apple~CloudDocs/Developer #if not there yet
#ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/Developer ~/Developer\ symlink
#
## Make pinentry-mac your default pientry choice
#echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
#
##Export GPG keys (from the other mac!)
##Get the keys IDs
#gpg --list-keys
#gpg --list-secret-keys
##Export keys
#gpg --export-secret-keys --armor <key> > ./file-sec.gpg
#gpg --export --armor <key> > ./file.gpg
#
## Import GPG keys.
## WARNING: You need to replace the <Path to pub key> and <Path to prv key> with the actual paths.
#gpg --import <Path to pub key>
#gpg --allow-secret-key-import --import <Path to prv key>
#
## Make SourceTree see our GPG binary file (it searches for gpg2). This should automatically choose the current version
#ln -s /usr/local/Cellar/gnupg/`ls /usr/local/Cellar/gnupg/`/bin/gpg /usr/local/Cellar/gnupg/`ls /usr/local/Cellar/gnupg/`/bin/gpg3
#
## Configure git
#
## On a specific repository...
#git config user.email "myname@domain.com"
#git config user.name "My Name"
#git config user.signingkey <KeyIdVALUE>
#git config commit.gpgsign true
#
## … or globally
#git config --global commit.gpgsign true
#git config --global user.signingkey <KeyIdVALUE>
#
### CRUCIAL TO CHECK IF YOUR MAC HAD PREVIOUS OWNERS (OR IS NOT YOURS)
## To check if your Mac is enrolled to Mobile Device Management try renewing it
#sudo profiles renew -type enrollment
## And then validate
#sudo profiles validate -type enrollment
## By default you should not be enrolled. If you are, external organisation can manage your macOS!
#
## Update installed apps and clear caches
#brew update
#brew upgrade
#brew cask upgrade
#brew cleanup
#rm -rf ~/Library/Caches/Homebrew
#
## As we installed homebrew before xcode, we need to switch to Xcode Command Line Tools
#sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
