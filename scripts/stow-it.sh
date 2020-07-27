#!/bin/bash
# This script will install profile specific dotfiles with stow.
# In case of not a profile a default configuration will be installed.

PROF="leidos"
DIR="$HOME/dotfiles"
cd "$DIR" || exit

PROFILE_PKGS="$(find . -mindepth 2 -maxdepth 2  ! -name '.*' -type d | sed "s|./||")"
DEFAULT_PKGS="$(find . -maxdepth 1  ! -name '.*' -type d | sed "s|./||")"

echo "Setting $PROF profile specific packages."
for PKG in ${PROFILE_PKGS[@]}; do
    if [[ $PKG == */$PROF ]] ; then
        echo "Package matches profile: $PKG"
        PKG_NAME=${PKG%/*}
        echo "Package name: $PKG_NAME"
        cd $PKG_NAME
        echo "$PWD"
        # Stow and solve conflicts if any
        CONFLICTS=$(stow --no --verbose $PROF 2>&1 | awk '/\* existing target is/ {print $NF}')
        if [ -z "$CONFLICTS" ]; then
            stow --verbose $PROF -t ~
        else
            echo "Found the following conflicts:" 
            for filename in ${CONFLICTS[@]}; do
                echo $filename
                if [[ -f $HOME/$filename || -L $HOME/$filename ]]; then
                    echo "DRY DELETE: $filename"
                    #rm -f "$HOME/$filename"
                fi
            done
            stow --no --verbose $PROF -t ~
        fi
        DEFAULT_PKGS=("${DEFAULT_PKGS[@]/$PKG_NAME}")  # Remove pkg from Default pkgs
        cd $DIR  # Go back to root
    fi
done

echo "Setting default packages."
for PKG in ${DEFAULT_PKGS[@]}; do
    CONFLICTS=$(stow --no --verbose $PKG 2>&1 | awk '/\* existing target is/ {print $NF}')
    if [ -z "$CONFLICTS" ]; then
        stow --no --verbose $PKG -t ~
    else
        echo "Found the following conflicts:" 
        for filename in ${CONFLICTS[@]}; do
            echo $filename
            if [[ -f $HOME/$filename || -L $HOME/$filename ]]; then
                echo "DRY DELETE: $filename"
                #rm -f "$HOME/$filename"
            fi
        done
    fi
    cd $DIR  # Go back to root
done
