export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# FZF
source <(fzf --zsh)

# EZA
alias ls="eza --icons=always"

# Oh My Posh
eval "$(oh-my-posh init zsh --config ~/jandedobbeleer.omp.json)"

# Zoxide
eval "$(zoxide init zsh)"
alias cd="z"

# ZSH
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh