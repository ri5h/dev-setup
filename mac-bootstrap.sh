
# Autohide the dock
defaults write com.apple.dock "autohide" -bool "true" && killall Dock

# Show bluetooth in menu bar

# Below does not work in macos sonoma
# defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" && killall SystemUIServer


killall SystemUIServer

