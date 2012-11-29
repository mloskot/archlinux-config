#!/bin/sh
#
# dotfiles-mloskot.sh - deploys dotfiles for non-root mloskot user
#
# Mateusz Loskot <mateusz@loskot.net>
#
# The dotfiles are used in Arch Linux setup on my workstation.
#
# Configuration
DOTFILES=${PWD}/home/mloskot
OVERWRITE=1
#
# Functions
#
usage()
{
    echo "archlinux-config deployment by Mateusz Loskot <mateusz@loskot.net>"
    echo ""
    echo "Usage:"
    echo "$0 TARGET" 
    echo "   TARGET     Name of target machine: dog or gaja"
    echo ""
    echo "Git repository at https://github.com/mloskot/archlinux-config"
}

function make_symlink()
{
    T=${1}
    L=${2}
    if [ ! -f "${T}" -a ! -d "${T}" ]; then
        echo "Target ${T} does not exist - skipping"
        return 1
    fi

    if [ -f "${L}" ]; then
        echo "Regular file ${L} already exists - overwriting"
        [ ${OVERWRITE} -eq 1 ] && rm ${L}
    elif [ -L "${L}" ]; then
        echo "Symlink ${L} already exists - overwriting"
        [ ${OVERWRITE} -eq 1 ] && rm ${L}
    fi

    ln -s ${T} ${L}
    echo "Symlink ${L} created"
    return $?
}

function deploy_file()
{
	T=${1}
    L=${2}
    if [ -z "${L}" ]; then
        L=${T} # target renaming or relative path
    fi

    LINK_TARGET=${DOTFILES}/${T}
    LINK_NAME=${HOME}/${L}
    echo "Deploying ${LINK_TARGET} to ${LINK_NAME}"

    LINK_DIR=`dirname ${LINK_NAME}`
    if [ ! -d ${LINK_DIR} ]; then
        echo "Creating directory ${LINK_DIR}"
        mkdir -p ${LINK_DIR}
    fi

    make_symlink ${LINK_TARGET} ${LINK_NAME}
    if [ $? -ne 0 ]; then
        echo "Something went wrong - giving up"
        exit 1
    fi

    echo
}

# Main script

if [ ! -d "${DOTFILES}" ]; then
	echo "Cannot find dotfiles location"
	exit 1
fi

while true; do
    case "$1" in 
        dog) TARGET=dog; break;;
        gaja) TARGET=gaja; break;;

        *) usage; exit 0;;
    esac
    shift
done

echo "Deploying '${TARGET}' dotfiles from ${DOTFILES} to ${HOME}"
echo
# ~/bin
deploy_file bin
# shell/bash
deploy_file .profile
deploy_file .bash_aliases
deploy_file .bash_profile
deploy_file .bashrc
# Vim
deploy_file .vim
deploy_file .vimrc
deploy_file .gvimrc
# Git
deploy_file .gitconfig
deploy_file .gitignore_global
# X
deploy_file .xinitrc.i3 .xinitrc
#deploy_file .Xresources
#deploy_file .Xresources .Xdefaults
# XDG
deploy_file .config/user-dirs.dirs
deploy_file .config/user-dirs.locale
# i3wm
deploy_file .config/i3.${TARGET} .config/i3
deploy_file .config/i3status
# GTK+ 2.x
deploy_file .gtkrc-2.0
# ~/.config
deploy_file .config/gtk-3.0
deploy_file .config/openbox
deploy_file .config/volumeicon
deploy_file .config/tint2
deploy_file .config/Terminal
# ~/.kdev4
deploy_file .kde4/share/config/krusaderrc
# Misc
deploy_file .conkyrc
deploy_file .mcabber
deploy_file .packer.conf
deploy_file .wallpapers
deploy_file signature.txt
