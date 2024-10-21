# Install Homebrew and packages
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"            

# Install applications
brew bundle install

# Symlink dotfiles
ln -sf ~/.dotfiles/home/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/home/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/home/.wezterm.lua ~/.wezterm.lua
ln -sf ~/.dotfiles/home/.config/starship.toml ~/.config/starship.toml

# Install NVM
# mkdir ~/.nvm
# nvm install --lt
# nvm ls
# nvm use default

echo "Done! Please restart your terminal."

