# Essential Configs
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
plugins=()

export LANG=en_US.UTF-8
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Autoload functions
fpath=($HOME/.zsh_autoload_functions $fpath)
autoload -Uz $HOME/.zsh_autoload_functions/*(:t)

# FZF
source <(fzf --zsh)

# EZA
alias ls="eza --icons=always"

# Oh My Posh
eval "$(oh-my-posh init zsh --config ~/jandedobbeleer.omp.json)"

# Zoxide
eval "$(zoxide init zsh)"
alias cd="z"

# Alias for git status
alias gs="git status --short"
alias gd="git diff"
alias ga="git add"
alias gap="git add -p"
alias gc="git commit"
alias gp="git push"
alias gpl="git pull --rebase"
alias gl="git log --oneline"
alias gco="git checkout"
alias gf="git fetch"
alias gbr="git branch"
alias gba="git branch --all"
alias gs="git switch"

# ZSH
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# bun completions
[ -s "/Users/mathieuletyrant/.bun/_bun" ] && source "/Users/mathieuletyrant/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

alias claude-mem='bun "$HOME/.claude/plugins/cache/thedotmack/claude-mem/10.6.2/scripts/worker-service.cjs"'

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi
