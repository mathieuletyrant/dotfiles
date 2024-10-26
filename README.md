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

5. Generate your local Git configuration:
```bash
sh ./gitconfig.sh
```
The script will ask for your SSH signing key and create `~/.gitconfig.local`.

6. Import Raycast configuration:

## 🧰 What's Included

- Customized macOS settings
- Homebrew package list
- Configuration files for ZSH, Git, WezTerm, and Oh My Posh

## 📦 Additional Software

Some applications are not available through Homebrew and need to be installed manually:

- [Kerlig](https://www.kerlig.com) - Productivity tool