# Dotfiles

## Setup

Clone the repository to your $HOME

```bash
git clone git@github.com:Spounka/dotfiles.git
$HOME/dotfiles --recrusive --depth 1
```

## Dependencies

- [zsh](https://github.com/ohmyzsh/ohmyzsh)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-completions](https://github.com/zsh-users/zsh-completions)
- [z](https://github.com/agkozak/zsh-z)
- [fzf](https://github.com/junegunn/fzf)
- [fd](https://github.com/sharkdp/fd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)

## Installation

- ***Ensure gnu stow is installed with*** `sudo pacman -S stow`

```bash
cd dotfiles
stow --dotfiles --adopt .
```

## Configuration

This repository contains multiple configuration files for various utilities

### Alacritty

The alacritty configuration lays in `dot-config/alacritty/alacritty.toml`

- It requires:
  - Inconsolata DZ Nerd Font (which can be found in the AUR as `otf-inconsolata-dz`)
  - FiraCode Nerd Font
- It uses a Tokyonight storm theme
- You can spawn a new instance within the same directory using `Ctrl-Shift+Return`
- Increase and decrease font size with "Ctrl++" and "Ctrl+-" respectively
- Reset font size with `Ctrl+=`

### Doom Emacs

My personal doom emacs configuration

- Install doom emacs from [this link](https://github.com/doomemacs/doomemacs?tab=readme-ov-file#install)
It contains various sections and definitions for:
  - Programming languages
  - LSP definitions
  - Keybindings
It uses org mode and literate programming so the `config.org` should be self descriptive

### Dunst

A simple notification client/daemon
No longer in use do to XFCE set-up, however it's quite useful if you're going for a barebones i3 configuration

### i3

Simple i3 configuration for my XFCE setup
contains multiple keybindings and rules
Uses:

- alacritty as a terminal
- chromium as a browser
- inconsolata nerd font
- KeepassXC for password management
- nm-applet and various other utilities
can all be installed throught
`sudo pacman -S i3 i3status i3lock rofi dmenu xss-lock --needed`

### Neovim

Please refere to my [neovim github]( https://github.com/spounka/neovim.git )

### Picom

a transparency daemon / utility for eye candy

### Ranger

a terminal based file manager

### Rofi

a simple utility to replace dmenu, launches apps and commands through a neat sidepanel
