#!/bin/bash
# This script will install profile specific dotfiles with stow.
# You must specify a profile. Use default for avoiding profile specific packages.
# Use: $ ./stow-it.sh justin

# TODO add default or --none flag to install only default packages

# Validate Input
VALID_PROFILES=("justin" "edward" "leidos" "raspi64")
if [[ ! " ${VALID_PROFILES[@]} " =~ " $1 " ]]; then
    echo "Invalid profile $1"
    echo "Please use any of the following profiles: ${VALID_PROFILES[@]}"
    exit
fi

# Set DIR as home folder destination
PROF=$1
DIR="$HOME/dotfiles"
cd "$DIR" || exit

# Find packages per profile
PROFILE_PKGS="$(find . -mindepth 2 -maxdepth 2  ! -name '.*' -type d | sed "s|./||")"
PROFILE_PKGS=("${PROFILE_PKGS[@]/.git/}")     # Remove git from Profile pkgs

# Find packages not in profiles
DEFAULT_PKGS="$(find . -maxdepth 1  ! -name '.*' -type d | sed "s|./||")"
DEFAULT_PKGS=("${DEFAULT_PKGS[@]/scripts/}")  # Remove scripts from Default pkgs
DEFAULT_PKGS=("${DEFAULT_PKGS[@]/.git/}")     # Remove git from Default pkgs

package_cleaner(){
    local profile_name=$1
    local profile_pkgs=$2
    local default_pkgs=$3

    # Remove packages that do not correspond to the user profile
    for prof_pkg in ${profile_pkgs[@]}; do
        if [[ ! $prof_pkg == */$profile_name ]]; then
            profile_pkgs=("${profile_pkgs[@]/$prof_pkg}")
        # Remove default packages that corresponded to a profile
        else
            for def_pkg in ${default_pkgs[@]}; do
                if [[ "$def_pkg" == "${prof_pkg%%/*}" ]]; then
                    default_pkgs=("${default_pkgs[@]/$def_pkg}")
                    break
                fi
            done
        fi
    done
    CLEANED_PKGS=(${profile_pkgs[@]} ${default_pkgs[@]})
    echo "Stowing the following packages: ${CLEANED_PKGS[@]}"
}

stow_package(){
    local conflicts
    # Check for conflicts
    if [[ "$IS_PROFILE" = true ]]; then
        cd $PKG_NAME
        conflicts=$(stow --no $PROF 2>&1 | awk '/\* existing target is/ {print $NF}')
    else
        conflicts=$(stow --no $PKG 2>&1 | awk '/\* existing target is/ {print $NF}')
    fi

    # Remove the local version 
    if [[ $conflicts ]]; then
        echo "Found the following conflicts:" 
        for filename in ${conflicts[@]}; do
            echo $filename
            if [[ -f $HOME/$filename || -L $HOME/$filename ]]; then
                echo "DELETE: $filename"
                rm -f "$HOME/$filename"
            fi
        done
    fi

    # Stow the git version
    if [[ "$IS_PROFILE" = true ]]; then
        echo "Stow $PROF profile: $PKG_NAME"
        stow --verbose $PROF -t ~  # For profile
    else
        echo "Stow default: $PKG"
        stow --verbose $PKG        # For default
    fi
}

stow_installer() {
    for PKG in ${CLEANED_PKGS[@]}; do
        # Install using a user profile
        if [[ $PKG == */$PROF ]]; then
            IS_PROFILE=true
            PKG_NAME=${PKG%/*}
            stow_package
        # Install using a defalt package
        else
            IS_PROFILE=false
            stow_package
        fi
        cd $DIR
    done
}


# Install according to a profile
package_cleaner $PROF "${PROFILE_PKGS[@]}" "${DEFAULT_PKGS[@]}"
stow_installer
