<div align="center">

# 🛠️ Dotfiles

**My macOS setup, from a blank Mac to ready-to-work in one script.**
Shell, Git, terminal, apps and Claude Code, symlinked with GNU Stow and installed with Homebrew.

[![Test](https://github.com/mathieuletyrant/dotfiles/actions/workflows/test.yml/badge.svg)](https://github.com/mathieuletyrant/dotfiles/actions/workflows/test.yml)
![macOS](https://img.shields.io/badge/macOS-Apple_Silicon-000000?logo=apple&logoColor=white)
![zsh](https://img.shields.io/badge/shell-zsh-f0a35e?logo=gnubash&logoColor=white)
![Homebrew](https://img.shields.io/badge/Homebrew-Brewfile-fbb040?logo=homebrew&logoColor=black)
![Ghostty](https://img.shields.io/badge/terminal-Ghostty-3551f3)

</div>

## ✨ What's inside

**Shell**

- 🐚 **zsh**, no framework: native completion (case-insensitive), 50k shared history
- 🎨 **Oh My Posh** prompt (`clean-minimal` theme)
- 🧭 **zoxide** for `cd`, **fzf** for fuzzy search, **eza** for `ls`
- 💡 Autosuggestions and syntax highlighting
- 🔐 `op-export`: load a 1Password item into env vars

**Git**

- ✍️ Commits signed with an SSH key from **1Password**
- 🔍 **delta** as pager, rebase on pull, auto-stash, auto upstream
- ⚡ Short aliases: `gs`, `gd`, `gap`, `gpl`, `git fixup`, `git go`…

**Apps**

- 📦 **Brewfile**: 31 formulae, 27 casks, 2 App Store apps, 38 VS Code extensions, npm and uv tools
- 👻 **Ghostty** config: translucent window, bar cursor, big scrollback
- 🏠 App settings: HABar, Tinycast, gh, 1Password SSH agent

**Claude Code**

- 🤖 Global `CLAUDE.md`, settings, plugins and status line
- 🪶 **rtk** hook to compress Bash output

**macOS**

- ⚙️ `macos.sh`: Finder path/status bar, column view, fast key repeat, Dock tweaks

## 🚀 Setup a new Mac

```sh
# 1. Homebrew, Git, Stow
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git stow

# 2. Clone and install (symlinks, Node, every app in the Brewfile, rtk)
#    Sign in to the App Store first, or Xcode and Hyperduck get skipped
git clone https://github.com/mathieuletyrant/dotfiles.git ~/dotfiles
cd ~/dotfiles && ./install.sh

# 3. macOS defaults
sh ./macos.sh

# 4. Git signing key (open and sign in to 1Password first)
sh ./gitconfig.sh
```

Then restart the terminal.

> [!IMPORTANT]
> Run `install.sh` before any `git config --global`: Stow refuses to overwrite an existing `~/.gitconfig`.

> [!NOTE]
> VS Code settings and keybindings stay manual. Extensions come from the Brewfile.
>
> Not on Homebrew, install by hand before `macos.sh` (it adds them to login items):
> [WhatThePort](https://whattheport.dev) and OpalMini (built from [opal-c1-revive](https://github.com/mathieuletyrant/opal-c1-revive)).

## ⁉️ How to

| I want to… | Run |
|---|---|
| Sync the Brewfile with what's installed | `brew bundle dump --force --global` |
| Install what's missing from the Brewfile | `brew bundle --global` |
| Remove what's not in the Brewfile | `brew bundle cleanup --global --force` |
| Export a 1Password item as env vars | `op-export "Open router"` |
| Reload an autoloaded zsh function | `reload op-export` |

## 🗂️ Layout

Each top-level folder is a Stow package, mirrored into `~`.

```
brew/        .Brewfile
claude/      .claude/  CLAUDE.md, settings.json, statusline.sh
config/      .config/  ghostty, gh, git, 1Password, habar, tinycast
git/         .gitconfig  (+ ~/.gitconfig.local from gitconfig.sh)
zsh/         .zshrc, .zsh_autoload_functions/
oh-my-posh/  prompt themes (read in place, not stowed)
install.sh   stow + Node + brew bundle + rtk
macos.sh     macOS defaults
```

CI runs the full `install.sh` on a fresh macOS runner at every push.
