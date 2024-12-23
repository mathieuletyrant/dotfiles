# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "=> Oh My Zsh installed!"

# Install applications
brew bundle install --global
echo "=> Applications installed!"

# Symlink using Stow
stow git --adopt
# stow wezterm --adopt
stow zsh --adopt
stow oh-my-posh --adopt
stow config --adopt
stow warp --adopt
stow brew --adopt
echo "=> Symlinks created!"

echo "====="
echo "If you want to have basic MAC settings, run the following command:"
echo "sh macos.sh"
echo "====="

echo " => Done! Please restart your terminal."
