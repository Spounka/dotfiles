if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases;
fi

if [[ -z $DISPLAY ]] && ! [[ -e /tmp/.X11-unix/X0 ]] && (( EUID )); then
#    exec startx
fi

setfont /usr/share/fonts/ter-powerline-v24b.psf.gz
setleds -D +num

export ANDROID_HOME="/home/spounka/Android"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Restart your shell for the changes to take effect.

# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:

eval "$(pyenv virtualenv-init -)"

# set a new bash variable to 0

editor=/usr/bin/nvim

export EDITOR=$editor
export VISUAL=$editor
export SYSTEMD_EDITOR=$editor


# Added by Toolbox App
export PATH="$PATH:/home/spounka/.local/share/JetBrains/Toolbox/scripts"


