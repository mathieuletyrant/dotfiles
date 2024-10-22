# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Oh My Zsh installed!"

# Install applications
brew bundle install
echo "Applications installed!"

# Symlink using Stow
stow git --adopt
stow wezterm --adopt
stow starship --adopt
stow zsh --adopt
echo "Symlinks created!"

echo "Done! Please restart your terminal."

