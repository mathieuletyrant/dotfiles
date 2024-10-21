# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"            

# Install applications
brew bundle install

pwd

# Symlink using Stow
stow git --adopt
stow wezterm --adopt
stow starship --adopt
stow zsh --adopt

echo "Done! Please restart your terminal."

