# Allow disabling of entire environment suite
#[ -n "$INHERIT_ENV" ] && echo "Disabling ~/.zshenv" && return 0
#[[ -o interactive ]] && echo "Sourcing ~/.zshenv"

# NOTE: Disabled PATH settings due to Arch behaviour, see comment in ~/.zshrc
#typeset -U path
#path=(~/bin ~/.cabal/bin $path)
#if [[ -d ~/.gem/ruby/ ]] && ls ~/.gem/ruby/ >/dev/null 2>&1; then
#    for dir in ~/.gem/ruby/*; do
#        if [[ -d $dir/bin ]]; then
#            path+=($dir/bin)
#        fi
#    done
#fi
#typeset -U path
# TODO: http://zsh.sourceforge.net/Contrib/startup/users/debbiep/dot.zshenv
# Remove entries that don't exist on this system.  Just for sanity's
# sake more than anything.
# rationalize-path path

# Set TERM based on COLORTERM
case $COLORTERM in
    xfce4-terminal) export TERM=xterm-color ;;         # this is XFCE Terminal
    gnome-terminal) export TERM=xterm-color ;;   # this is gnome-terminal
    wterm-xpm) export TERM=xterm ;;              # this is wterm
    Eterm) export TERM=Eterm ;;                  # this is Eterm
    1) export TERM=xterm-color ;;                # this is lxterminal, konsole, yakuake, uxterm, Mac OSX terminal, putty ...
esac

# Editor
if which vim &> /dev/null; then
    if [[ -z $DISPLAY ]] then
        export EDITOR="vim"
    else
        export EDITOR="gvim --nofork"
    fi
    export VIMRELEASE="$(print ${${$(vim --version)[5]}:gs/.//})"
elif which vi &> /dev/null; then
    export EDITOR="vi"
fi
export VISUAL=$EDITOR

export SVN_EDITOR="$EDITOR"

if echo hello|grep --color=auto l >/dev/null 2>&1; then
  export GREP_OPTIONS='--color=auto'
fi

# Browser
export WWW_HOME=http://google.com
if [[ -z $DISPLAY ]] then
    export BROWSER=elinks
else
    export BROWSER=firefox
fi
