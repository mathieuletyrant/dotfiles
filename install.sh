# Install Oh My Zsh (unattended; keep our own .zshrc and don't spawn a subshell)
RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "=> Oh My Zsh installed!"

# Symlink using Stow first, so ~/.Brewfile exists before the bundle step.
# No --adopt: the repo is the source of truth (--adopt would overwrite it
# with whatever happens to be on disk).
stow git
stow zsh
stow oh-my-posh
stow config --no-folding
stow brew
echo "=> Symlinks created!"

# Install applications from the now-linked global Brewfile
brew bundle install --global
echo "=> Applications installed!"

echo "====="
echo "If you want to have basic MAC settings, run the following command:"
echo "sh macos.sh"
echo "====="

echo " => Done! Please restart your terminal."
