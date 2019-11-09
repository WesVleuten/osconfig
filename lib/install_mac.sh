# Install xcode requirements
xcode-select --install

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install homebrew vim to enable clipboard
brew install vim
mv /usr/bin/vim /usr/bin/vimold

# Set defaults in plist
# Update check frequency
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
# Set screenshot type to jpg and location to iCloud Drive
defaults write com.apple.screencapture type jpg
defaults write com.apple.screencapture location /Users/wesvandervleuten/Library/Mobile\ Documents/com\~apple\~CloudDocs/Screenshots
# Disable desktop icons
defaults write com.apple.finder CreateDesktop -bool false
# Restart finder to show changes
killall Finder

