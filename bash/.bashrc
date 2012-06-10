#
# ~/.bashrc
#
echo "Sourcing ${HOME}/.bashrc..."

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set Android environment
if [ -f "$HOME/.androidrc" ]; then
    . "$HOME/.androidrc"
fi

# set Oracle environment
if [ -f "$HOME/.oraclerc" ]; then
    . "$HOME/.oraclerc"
fi

export GREP_OPTIONS="--colour"
export CVS_RSH=ssh

alias ls='ls --color=auto'
