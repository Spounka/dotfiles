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
> [!IMPORTANT]
> The alacritty terminal is no longer updated in favour of using Kitty
> due to font rendering issues.


The alacritty configuration lays in `dot-config/alacritty/alacritty.toml`

- It requires:
  - Inconsolata DZ Nerd Font (which can be found in the AUR as `otf-inconsolata-dz`)
  - FiraCode Nerd Font
- It uses a Tokyonight storm theme
- You can spawn a new instance within the same directory using `Ctrl-Shift+Return`
- Increase and decrease font size with "Ctrl++" and "Ctrl+-" respectively
- Reset font size with `Ctrl+=`

### Doom Emacs
> [!IMPORTANT]
> No longer in use in favour of a vanilla emacs configuration

My personal doom emacs configuration

- Install doom emacs from [this link](https://github.com/doomemacs/doomemacs?tab=readme-ov-file#install)

It contains various sections and definitions for:
  - Programming languages
  - LSP definitions
  - Keybindings

It uses org mode and literate programming so the `config.org` should be self descriptive

### Emacs
My personal emacs configuration, lays in `dot-emacs.d/` folder,
`init.el` is the startup file that bootstraps everything

it relies on:
- [Straight.el](https://github.com/radian-software/straight.el) as a package manager
- Uses emacs built-in treesitter
- Uses LSP
- Configured languages are:
  - C
  - C++
  - Python
  - Go
  - Java
  - JavaScript
  - TypeScript
  - Latex
- Uses Evil bindings, evil collection, evil-surround, evil-snipe, evil-numbersa
- Leader key is set to: `SPC`
- Uses Vertico and vertico-posframe 
- Uses doom-monokai theme
- Other installed plugins are:
  - Projectile
  - Treemacs, lsp-treemacs, treemacs-evil, treemacs-projectile
  - Company, flycheck, lsp-ui, dap-mode
  - markdown-mode. [link](https://jblevins.org/projects/markdown-mode/)
  - ainsi-color for compilation mode
  - magit
  - doom-modeline, all-the-icons
  - hl-todo
  - which-key, because I don't want to memorise Emacs bindings yet

### Dunst
> [!IMPORTANT]
> Abandonned in favour of using an i3 over XFCE setup

A simple notification client/daemon

### i3

Simple i3 configuration for my XFCE setup
contains multiple keybindings and rules
Uses:

- kitty as a terminal
- brave as a browser
- Inconsolata Nerd Font
- KeepassXC for password management
- nm-applet and various other utilities
can all be installed throught
`sudo pacman -S i3 i3status i3lock rofi dmenu xss-lock --needed`

### Kitty
Kitty configuration lays in `dot-config/kitty/` with a custom theme and custom mappings
It requires:
- Inconsolata Nerd Font
- Iosevka Nerd Font
- Uses the monokai theme
- You can spawn a new instance within the same directory using `Ctrl-Shift+Return`
- Increase and decrease font size with "Ctrl++" and "Ctrl+-" respectively
- Reset font size with `Ctrl+=`


### Neovim

Please refere to my [neovim github]( https://github.com/spounka/neovim.git )

### Picom

a transparency daemon / utility for eye candy

### Ranger

a terminal based file manager

### Rofi

a simple utility to replace dmenu, launches apps and commands through a neat sidepanel
