#!/bin/sh
# macOS defaults. Safe to re-run.

# Close System Settings so it doesn't override what we write
osascript -e 'tell application "System Settings" to quit'

###############################################################################
# Appearance
###############################################################################

# Light/dark mode follows the time of day
defaults write NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically -bool true

# Liquid Glass tint (macOS 26+)
defaults write NSGlobalDomain NSGlassTintAmount -float 0.5

###############################################################################
# Finder
###############################################################################

# Screenshots: PNG, no shadow, in ~/Pictures/Screenshots
mkdir -p "$HOME/Pictures/Screenshots"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture location -string "$HOME/Pictures/Screenshots"
killall SystemUIServer > /dev/null 2>&1

# Folders first, search the current folder
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# No .DS_Store on network and USB drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Path bar and status bar
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# No warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# List view by default (icnv, clmv, Flwv, Nlsv)
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

killall Finder > /dev/null 2>&1

###############################################################################
# Dock
###############################################################################

defaults write com.apple.dock orientation -string "bottom"
defaults write com.apple.dock tilesize -float 48
defaults write com.apple.dock show-recents -bool false

# Autohide, instantly
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.1

# No hot corner bottom-right (macOS defaults it to Quick Note)
defaults write com.apple.dock wvous-br-corner -int 1
defaults write com.apple.dock wvous-br-modifier -int 0

# Dock apps, in order
dock_app() {
  printf '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>%s</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>' "$1"
}
defaults write com.apple.dock persistent-apps -array \
  "$(dock_app /Applications/Ardia.app)" \
  "$(dock_app /System/Applications/Calendar.app)" \
  "$(dock_app /System/Applications/Messages.app)" \
  "$(dock_app /System/Applications/Mail.app)" \
  "$(dock_app /Applications/Ghostty.app)" \
  "$(dock_app /Applications/Slack.app)"

killall Dock > /dev/null 2>&1

###############################################################################
# Desktop & windows
###############################################################################

# Clicking the wallpaper doesn't reveal the desktop
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# No margins between tiled windows
defaults write com.apple.WindowManager EnableTiledWindowMargins -bool false

###############################################################################
# Menu bar
###############################################################################

# Shown: Wi-Fi, battery (with %), Control Center, clock
for item in WiFi Battery BentoBox-0 Clock; do
  defaults write com.apple.controlcenter "NSStatusItem VisibleCC $item" -bool true
done
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true

# Hidden (8 = don't show in menu bar)
for item in Display FocusModes NowPlaying ScreenMirroring Spotlight Timer; do
  defaults -currentHost write com.apple.controlcenter "$item" -int 8
done
defaults write com.apple.TextInputMenu visible -bool false

# Clock: day of week, date only when space allows
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true
defaults write com.apple.menuextra.clock ShowDate -int 0

# Hide Siri
defaults write com.apple.Siri StatusMenuVisible -bool false

killall ControlCenter SystemUIServer > /dev/null 2>&1

###############################################################################
# Keyboard, trackpad, mouse
###############################################################################

# Fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# No auto-capitalization, no period on double space
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Trackpad at max speed
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 3

# Disable 'natural' scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

###############################################################################
# Apps
###############################################################################

# noTunes opens Spotify instead of Music
defaults write digital.twisted.noTunes replacement /Applications/Spotify.app

# Open at login (skips apps not installed or already listed)
for app in Tinycast noTunes HABar Hex DockDoor Hyperduck WhatThePort OpalMini; do
  app_path="/Applications/$app.app"
  [ -d "$app_path" ] || continue
  osascript -e "tell application \"System Events\" to if not (exists login item \"$app\") then make login item at end with properties {path:\"$app_path\", hidden:true}" > /dev/null
done

###############################################################################
# Touch ID for sudo (sudo_local survives macOS updates)
###############################################################################

if ! grep -q '^auth.*pam_tid.so' /etc/pam.d/sudo_local 2>/dev/null; then
  sed 's/^#auth/auth/' /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local > /dev/null \
    && echo "=> Touch ID enabled for sudo"
fi

echo "Done! Log out and back in for keyboard and trackpad changes."
