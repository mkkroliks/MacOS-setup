#!/bin/bash

# Check if Homebrew is already installed
function checkHomebrew {

    brewResult=$(brew -v)

    if [ -z "$brewResult" ]; then
        echo
        "Homebrew is missing. Installation..."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo "Homebrew found"
    fi
}

checkHomebrew

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
