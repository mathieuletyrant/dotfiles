# Completion (case-insensitive)
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# History
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt share_history hist_ignore_all_dups hist_reduce_blanks

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
eval "$(oh-my-posh init zsh --config ~/dotfiles/oh-my-posh/clean-minimal.omp.json)"

# Alias for git
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
alias gsw="git switch"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

# claude-mem worker, latest installed plugin version
claude-mem() {
  local dirs=($HOME/.claude/plugins/cache/thedotmack/claude-mem/*(N/nOn))
  bun "$dirs[1]/scripts/worker-service.cjs" "$@"
}

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi

# ZSH (syntax-highlighting must be sourced near the end)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Zoxide (must be initialized at the very end)
eval "$(zoxide init zsh)"
alias cd="z"
