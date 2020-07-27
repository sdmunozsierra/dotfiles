#!/bin/bash
# This script will install profile specific dotfiles with stow.
# In case of not a profile a default configuration will be installed.

PROF="leidos"
DIR="$HOME/dotfiles"
cd "$DIR" || exit

PROFILE_PKGS="$(find . -mindepth 2 -maxdepth 2  ! -name '.*' -type d | sed "s|./||")"
DEFAULT_PKGS="$(find . -maxdepth 1  ! -name '.*' -type d | sed "s|./||")"

DEFAULT_PKGS=("${DEFAULT_PKGS[@]/scripts/}")  # Remove pkg from Default pkgs
DEFAULT_PKGS=("${DEFAULT_PKGS[@]/.git/}")  # Remove pkg from Default pkgs

echo "Setting $PROF profile specific packages:"
echo "$PROFILE_PKGS"
for PKG in ${PROFILE_PKGS[@]}; do
    if [[ $PKG == */$PROF ]] ; then
        PKG_NAME=${PKG%/*}
        echo "Stow $PROF profile: $PKG_NAME"
        cd $PKG_NAME
        # Stow and solve conflicts if any
        CONFLICTS=$(stow --no $PROF 2>&1 | awk '/\* existing target is/ {print $NF}')
        if [ -z "$CONFLICTS" ]; then
            stow --verbose $PROF -t ~
        else
            echo "Found the following conflicts:" 
            for filename in ${CONFLICTS[@]}; do
                echo $filename
                if [[ -f $HOME/$filename || -L $HOME/$filename ]]; then
                    echo "DELETE: $filename"
                    rm -f "$HOME/$filename"
                fi
            done
            stow --verbose $PROF -t ~
        fi
        DEFAULT_PKGS=("${DEFAULT_PKGS[@]/$PKG_NAME}")  # Remove pkg from Default pkgs
        cd $DIR  # Go back to root
    fi
done

echo "Setting default packages:"
echo "$DEFAULT_PKGS"
for PKG in ${DEFAULT_PKGS[@]}; do
    cd $DIR  # Go back to root
    echo "Stow default profile: $PKG"
    CONFLICTS=$(stow --no $PKG 2>&1 | awk '/\* existing target is/ {print $NF}')
    if [ -z "$CONFLICTS" ]; then
        stow --verbose $PKG
    else
        echo "Found the following conflicts:" 
        for filename in ${CONFLICTS[@]}; do
            echo $filename
            if [[ -f $HOME/$filename || -L $HOME/$filename ]]; then
                echo "DELETE: $filename"
                rm -f "$HOME/$filename"
            fi
        done
        stow --verbose $PKG
    fi
    cd $DIR  # Go back to root
done
