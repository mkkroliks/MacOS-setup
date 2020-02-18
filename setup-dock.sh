#!/bin/bash

# Remove ALL icons (except Finder) from dock
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

echo "Restarting dock…"
killall Dock
