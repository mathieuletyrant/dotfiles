# Symlink using Stow first, so ~/.zshrc and ~/.Brewfile exist before the
# Oh My Zsh and brew bundle steps.
# No --adopt: the repo is the source of truth (--adopt would overwrite it
# with whatever happens to be on disk).
stow git
stow zsh
stow oh-my-posh
stow config --no-folding
stow brew
echo "=> Symlinks created!"

# Install Oh My Zsh (unattended; keep our own .zshrc and don't spawn a subshell).
# Must run AFTER `stow zsh`: on a fresh machine with no ~/.zshrc, the installer
# writes its own template regardless of KEEP_ZSHRC, which would then make
# `stow zsh` conflict and silently skip our symlink. Stowing first means the
# symlink already exists, so KEEP_ZSHRC=yes preserves it.
RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "=> Oh My Zsh installed!"

# Install applications from the now-linked global Brewfile
brew bundle install --global
echo "=> Applications installed!"

echo "====="
echo "If you want to have basic MAC settings, run the following command:"
echo "sh macos.sh"
echo "====="

echo " => Done! Please restart your terminal."
