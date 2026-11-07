###############################################################################
# Finder
###############################################################################

# Close any open System Settings panes, to prevent them from overriding
# settings we’re about to change
echo "Quitting System Settings..."
osascript -e 'tell application "System Settings" to quit'

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

#  Finder show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use column view in all Finder windows by default
# Four-letter codes for all view modes: `icnv`, `clmv`, `Flwv`, `Nlsv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Disable 'natural' scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

killall Finder &> /dev/null

###############################################################################
# Dock
###############################################################################

# Disable recent apps in Dock
defaults write com.apple.dock show-recents -bool false

# Dock at the bottom
defaults write com.apple.dock orientation bottom

# Disable autohide
defaults write com.apple.dock autohide -bool false

# Speed transition
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.1

killall Dock &> /dev/null

###############################################################################
# Keyboard
###############################################################################

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

###############################################################################
# Other
###############################################################################

# Enable Spotify as default music player
defaults write digital.twisted.noTunes replacement /Applications/Spotify.app

echo "Done! Please restart your computer."

