# Dotfiles

## Setup
Clone the repository to your $HOME

```bash
git clone git@github.com:Spounka/dotfiles.git $HOME/dotfiles
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
- ***Ensure gnu stow is installed with*** `sudo dnf install stow`

```bash
cd dotfiles
stow .
```
