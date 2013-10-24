#
# ~/.profile - executed by the command interpreter for login shells
#
# Part of https://github.com/mloskot/archlinux-config
# Mateusz Loskot <mateusz@loskot.net>
# 
# This file is not read by bash(1), if ~/.bash_profile or
# ~/.bash_login exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
echo "Sourcing ${HOME}/.profile..."

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# setting TERM based on COLORTERM
case $COLORTERM in
    xfce4-terminal) export TERM=xterm-color ;;         # this is XFCE Terminal
    gnome-terminal) export TERM=xterm-color ;;   # this is gnome-terminal
    wterm-xpm) export TERM=xterm ;;              # this is wterm
    Eterm) export TERM=Eterm ;;                  # this is Eterm
    1) export TERM=xterm-color ;;                # this is lxterminal, konsole, yakuake, uxterm, Mac OSX terminal, putty ...
esac

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
