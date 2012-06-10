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

# Functions

function make_symlink()
{
    T=${1}
    L=${2}
    if [ ! -f "${T}" ]; then
        echo "Target ${T} does not exist - skipping"
        return 1
    fi

    if [ -L "${L}" ]; then
        if [ ${OVERWRITE} -eq 1 ]; then
            echo "Symlink ${L} already exists - overwriting"
            rm ${L}
        else
            echo "Symlink ${L} already exists - skipping"
            return 0
        fi
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
        L=${T} # relative path
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

echo "Deploying dotfiles from ${DOTFILES} to ${HOME}"
echo
# Bash
deploy_file .profile
deploy_file .bash_aliases
deploy_file .bashrc
# Vim
deploy_file .vim
deploy_file .vimrc
deploy_file .gvimrc
# Git
deploy_file .gitconfig
# mcabber
deploy_file .mcabber/mcabberrc
