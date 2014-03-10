#
# ~/.zshrc - startup file for Zsh
#
# Part of https://github.com/mloskot/archlinux-config
# Mateusz Loskot <mateusz@loskot.net>
#
for zshf in `ls $HOME/.zsh`; do
    source "$HOME/.zsh/$zshf"
done
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -e

zmodload zsh/complist
autoload -Uz colors && colors

autoload -Uz compinit && compinit

# Navigation completion with arrow keys?
# zstyle ':completion:*' menu select
# zstyle ':completion::complete:*:git:*' ignored-patterns directories files

setopt completealiases # complete commandline switches


# http://chneukirchen.org/blog/archive/2007/03/switching-to-zsh.html
# I don’t want it to think // means anything special, though:
zstyle ':completion:*' squeeze-slashes true

# colors in completion
#eval "$(dircolors -b)"
eval $(dircolors)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''

emulate sh -c 'source ~/.aliases'
emulate sh -c 'source ~/.travis/travis.sh'

# NOTE: This PATH setting is repeated from ~/.zshenv due to Arch Linux behaviour:
# "Users should take note that /etc/profile sets the $PATH variable which 
# will overwrite any $PATH variable set in ~/.zshenv"
# https://wiki.archlinux.org/index.php/Zsh
#
typeset -U path
path=(~/bin ~/.cabal/bin $path)
if [[ -d ~/.gem/ruby/ ]] && ls ~/.gem/ruby/ >/dev/null 2>&1; then
    for dir in ~/.gem/ruby/*; do
        if [[ -d $dir/bin ]]; then
            path+=($dir/bin)
        fi
    done
fi
# TODO: http://zsh.sourceforge.net/Contrib/startup/users/debbiep/dot.zshenv
# Remove entries that don't exist on this system.  Just for sanity's
# sake more than anything.
# rationalize-path path


# added by travis gem
[ -f /home/mloskot/.travis/travis.sh ] && source /home/mloskot/.travis/travis.sh
