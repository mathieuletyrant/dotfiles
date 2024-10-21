# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"            

# Install applications
brew bundle install

# Symlink dotfiles
stow zsh
stow git
stow wezterm
stow zsh

echo "Done! Please restart your terminal."

