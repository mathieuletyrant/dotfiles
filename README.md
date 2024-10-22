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

## 🧰 What's Included

- Custom macOS preferences
- Homebrew package list
- Some configurations (ZSH, Git, Wezterm, Starship)

## 📦 Additional Software

Some applications are not available through Homebrew and need to be installed manually:

- [Kerlig](https://www.kerlig.com) - Productivity tool

---

Last updated: October 21, 2024