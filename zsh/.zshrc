# Essential Configs
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
plugins=()

export LANG=en_US.UTF-8
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