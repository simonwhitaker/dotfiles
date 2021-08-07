#!/bin/sh

# Don't hide ~/Library in the Finder
chflags nohidden ~/Library

# Disable press-and-hold for keys in favor of key repeat.
#defaults write -g ApplePressAndHoldEnabled -bool false

# Don't add drop shadows to screenshots
# defaults write com.apple.screencapture disable-shadow -bool true

# Hot Corners
# Bottom left: Put display to sleep
defaults write com.apple.dock wvous-bl-corner -int 10
# Bottom right: Desktop
defaults write com.apple.dock wvous-br-corner -int 4
# Top left: Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
# Top right: Notification Centre
defaults write com.apple.dock wvous-tr-corner -int 12

# Restart the dock to pick up hot corner changes
pkill Dock
