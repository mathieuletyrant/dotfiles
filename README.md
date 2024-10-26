# Dotfiles 🛠️

![Test Workflow](https://github.com/mathieuletyrant/dotfiles/actions/workflows/test.yml/badge.svg)

Configuration files for macOS, optimized for productivity and ease of use.

## 🚀 Quick Start

1. Install Homebrew:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install Git and Stow:
```bash
brew install git stow
```

3. Clone and set up:
```bash
git clone https://github.com/mathieuletyrant/dotfiles.git ~/dotfiles
cd ~/dotfiles
sh ./install.sh
```

4. Setup MacOS default settings
```bash
sh ./macos.sh
```

4. Import Raycast configuration:

5. Create gitconfig.local `touch ~/.gitconfig.local` with inside:
```
[user]
	signingkey = <KEY>

[gpg]
	format = ssh

[gpg "ssh"]
	program = /Applications/1Password.app/Contents/MacOS/op-ssh-sign

[commit]
	gpgsign = true
```

## 🧰 What's Included

- Customized macOS settings
- Homebrew package list
- Configuration files for ZSH, Git, WezTerm, and Oh My Posh

## 📦 Additional Software

Some applications are not available through Homebrew and need to be installed manually:

- [Kerlig](https://www.kerlig.com) - Productivity tool