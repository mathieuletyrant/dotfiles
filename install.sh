# Symlink using Stow first, so ~/.Brewfile exists before brew bundle.
# No --adopt: the repo is the source of truth (--adopt would overwrite it
# with whatever happens to be on disk).
stow git
stow zsh
stow config --no-folding
stow brew
stow claude --no-folding
echo "=> Symlinks created!"

# Node via nvm before brew bundle: the Brewfile's `npm` entries need npm on PATH.
brew install nvm
export NVM_DIR="$HOME/.nvm" && mkdir -p "$NVM_DIR"
. "$(brew --prefix nvm)/nvm.sh"
nvm install --lts
echo "=> Node installed!"

# Install applications from the now-linked global Brewfile
brew bundle install --global
echo "=> Applications installed!"

# rtk comes from the Brewfile; writes ~/.claude/RTK.md + Claude Code hook.
# Safe to re-run, and keeps the stowed ~/.claude/CLAUDE.md symlink intact.
rtk init -g --auto-patch
echo "=> rtk initialized!"

echo "====="
echo "If you want to have basic MAC settings, run the following command:"
echo "sh macos.sh"
echo "====="

echo " => Done! Please restart your terminal."
