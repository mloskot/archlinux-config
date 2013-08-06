#!/bin/zsh
#
# ~/.zsh/prompt.zsh - command line prompt theme configuration
#
# Part of https://github.com/mloskot/archlinux-config
# Mateusz Loskot <mateusz@loskot.net>
#
autoload -Uz promptinit && promptinit
prompt adam2

function precmd() {
    git_branch=`git symbolic-ref HEAD 2> /dev/null | cut -b 12-`
    if [ $git_branch ]; then
RPROMPT='%F{red}(repo: git, branch: $git_branch)'
    elif [ -d .hg ]; then
RPROMPT='%F{red}(repo: hg)'
    else
RPROMPT=''
    fi;
}

function title() {
# escape '%' chars in $1, make nonprintables visible
    a=${(V)1//\%/\%\%}

   # Truncate command, and join lines.
    a=$(print -Pn "%40>...>$a" | tr -d "\n")

    case $TERM in
        screen)
            print -Pn "\ek$a:$3\e\\" # screen title (in ^A")
        ;;
        xterm*|rxvt|ansi)
            print -Pn "\e]1;$2 | $a:$3\a" # plain xterm title
            print -Pn "\e]2;$2 | $a:$3\a" # tab title
        ;;
    esac
}

function preexec() {
    title "$1" "$USER@%m" "%35<...<%~"
}
