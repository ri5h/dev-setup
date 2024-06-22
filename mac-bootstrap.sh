# Autohide the dock
defaults write com.apple.dock "autohide" -bool "true" && killall Dock

# Show battery percentage in menu bar
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist BatteryShowPercentage -bool true

# Show bluetooth in menu bar
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 18
# Below does not work in macos sonoma
# defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" && killall SystemUIServe

# Show sound icon
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Sound -int 18
