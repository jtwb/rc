#!/bin/bash

REPO_DIR=$(cd -P $(dirname $0) && pwd)

VERBOSE=false

BACKUPS="$HOME/.rc-backups"

DOTFILES="bashrc gitconfig vimrc bcrc screenrc bash_aliases"
BACKUP_TARGETS="$DOTFILES rc"

OKP=true

function init_backups {

    mkdir -p $BACKUPS
}

function do_backup {

    echo "Backing up existing rc files to $BACKUPS :"

    for file in $BACKUP_TARGETS
    do
       if [ -d $HOME/$file ]
       then
           echo "Backing up directory $file"
           mv $HOME/$file $BACKUPS
       else if [ -e "$HOME/.$file" ] || [ -L "$HOME/.$file" ]
           then
               echo "Backing up file .$file"
               mv "$HOME/.$file" $BACKUPS
           fi
       fi
    done

    if $VERBOSE
    then
        ls -lA $BACKUPS
        ls -lA $HOME
    fi
}

function do_install_symlinks {

    ln -s $REPO_DIR $HOME/rc

    for dotfile in $DOTFILES
    do
        ln -s $REPO_DIR/$dotfile $HOME/.$dotfile
        if [ $? -eq 0 ]
        then echo "Symlinked $dotfile"
        else
            OKP=false
        fi
    done
}

function test_installation {
    $OKP
}

function all_clear {
    echo "Done."
}

function restore_backups {

    echo "Restoring rc files from $BACKUPS :"

    for file in $(ls -A $BACKUPS)
    do
       mv $BACKUPS/$file $HOME
       if [ $? -eq 0 ]
       then echo "Restored $file"
       else echo "Didn't restore $file"
       fi
    done

    if $VERBOSE
    then
        ls -lA $BACKUPS
    fi
}



  # 
    #
# # #

while getopts "v" option
do
    case $option in
        v ) VERBOSE=true
    esac
done

init_backups
do_backup
do_install_symlinks

if test_installation
    then all_clear
    else restore_backups
fi

