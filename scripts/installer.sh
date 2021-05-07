#!/bin/bash

DOTFILES_FILE_LOCATION="~/dotfiles"
VIM_FOLDER_LOCATION="vim/"

echo ${DOTFILES_FILE_LOCATION}
echo ${VIM_FOLDER_LOCATION}
echo ${DOTFILES_FILE_LOCATION}"/"${VIM_FOLDER_LOCATION}

#  Colors to use for output
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Check if user is root or sudo
if ! [ $( id -u ) = 0 ]; then
    echo "Please run this script as sudo or root" 1>&2
    exit 1
fi

# Set vars
installVim=""
installMySQL=""

# Get arguments
while [ "$1" != "" ]; do
    case $1 in 
        # Install Vim selection
        -vim | --installVim )
            installVim=true
            ;;
        -mysql | --installMySQL )
            installMySQL=true
            ;;
    esac
    shift
done

if [[ -z ${installVim} ]]; then

    echo -e -n "${CYAN}Vim: Would you like to install VIM? (y/N): ${NC}"
    read PROMPT
    if [[ ${PROMPT} =~ ^[Yy]$ ]]; then
        # Install vim using yay
        yay -S vim
    fi

    echo -e -n "${CYAN}Vim Settings: Would you like to clone Vim settings? (y/N): ${NC}"
    read PROMPT
    if [[ ${PROMPT} =~ ^[Yy]$ ]]; then

        # Git Clone if not already
        echo "Clonning settings if not already."
        if [[ ${DOTFILES_FILE_LOCATION}"/"${VIM_FOLDER_LOCATION} ]]; then 
            stow ${DOTFILES_FILE_LOCATION}"/"${VIM_FOLDER_LOCATION} -t ~ 
        else
            GIT_REPOSITORY="https://github.com/sdmunozsierra/dotfiles.git"
            git clone $GIT_REPOSITORY ${DOTFILES_FILE_LOCATION}"/"${VIM_FOLDER_LOCATION}
            pushd ${DOTFILES_FILE_LOCATION}"/"${VIM_FOLDER_LOCATION}
            stow . -t ~
            popd
        fi

    fi        

    echo -e -n "${CYAN}Vim Plugins: Would you like to clone and install Vim Plugins? (y/N): ${NC}"
    read PROMPT
    if [[ ${PROMPT} =~ ^[Yy]$ ]]; then

        # Git clone if not already
        echo "Clonning plugins."
        GIT_REPOSITORY="https://github.com/VundleVim/Vundle.vim.git"
        git clone $GIT_REPOSITORY ~/.vim/bundle/Vundle.vim
        vim +PluginInstall +qall
        cd ~/.vim/bundle/YouCompleteMe

    fi

    # This  piece of code could be a plugin like instruction/command
    # echo -e -n "${CYAN}Vim: Would you like to install VIM? (y/N): ${NC}"
    # read PROMPT
    # if [[ ${PROMPT} =~ ^[Yy]$ ]]; then
    #     # Check if vim is installed if not install with yay
    #     CHECK=$(whereis vim)
    # fi

fi
    
# Different version of Ubuntu/Linux Mint and Debian have different package names...
source /etc/os-release
if [[ "${NAME}" == *"Arch Linux"* ]] || [[ "${NAME}" == *"Arch Linux Arm"* ]]; then
    echo "$NAME"
    if [ "${installMySQL}" = true ]; then
        yay -S mysql 
    elif [ -x "$( command -v mysql )" ]; then
        echo "Not installing mysql"
    else
        yay -S mysql
        break
    fi
else
    echo "Unsupported distribution - Debian, Kali, Raspbian, Linux Mint or Ubuntu only"
    exit 1
fi

    

    