# Install Homebrew and packages
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install homebrew packages
brew install \
  git \                             # Distributed version control system
  nvm \                             # Node Version Manager
  fzf \                             # Fuzzy finder
  zsh-autosuggestions \             # Fish-like autosuggestions for zsh
  zsh-syntax-highlighting \         # Fish-like syntax highlighting for zsh
  starship \                        # The minimal, blazing-fast, and infinitely customizable prompt for any shell
  zoxide \                          # Zoxide is a faster way to navigate your filesystem
  tig \                             # Better git status
  eza \                             # Modernized ls command with icons and more   
  git-delta                         # A viewer for git and diff output                 

# Install aplications from Brewfile
brew bundle install

# Install NVM
mkdir ~/.nvm
nvm install --lts

# Symlink dotfiles
ln -s ~/.dotfiles/home/.zshrc ~/.zshrc
ln -s ~/.dotfiles/home/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/home/.wezterm.lua ~/.wezterm.lua
ln -s ~/.dotfiles/home/.config/starship.toml ~/.config/starship.toml

