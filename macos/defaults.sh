#!/usr/bin/env bash

###################################
# Setup Defaults in macbook
###################################

# Autohide the dock
defaults write com.apple.dock "autohide" -bool "true"

# Remove all default app icons from dock
defaults write com.apple.dock persistent-apps -array

# Stop macos from rearranging desktops 
defaults write com.apple.dock "mru-spaces" -bool "false"

killall Dock

# Show battery percentage in menu bar
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist BatteryShowPercentage -bool true

# Show bluetooth in menu bar
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 18
# Below does not work in macos sonoma
# defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" && killall SystemUIServe

# Show sound icon
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Sound -int 18


defaults write NSGlobalDomain AppleLanguages -array "en" "de"

# Enable git commit signing
git config --global gpg.format ssh
git config --global user.name "Rishiraj Purohit"
git config --global --add --bool push.autoSetupRemote true

open -a "Google Chrome" --args --make-default-browser

corepack enable
yarn set version stable
