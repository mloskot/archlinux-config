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

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

WWW_HOME=http://www.archlinux.org
export WWW_HOME
