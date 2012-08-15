#!/bin/sh

# Don't hide ~/Library in the Finder
chflags nohidden ~/Library

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

