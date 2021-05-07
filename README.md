# dotfiles

Dotfiles managed with Stow.
Offer a Raspi64 perfile that is compatible with Raspberry Pi 64 Bit Arch Linux Arm architecture.

## Overview

Profiles are settings for specific devices or group of devices.

### TLRD;

```
Raspi64 -vim -i3
``

## Profiles

Raspi64
Justin
Ed
Work

## Program Installer
EssentialPrograms
FullPrograms

### Single Program Installer
VimInstaller
KubernetesInstaller
DockerInstaller
i3WindowManagerInstaller
GnomeInstaller


## Run Script

To install all the programs for a specific profile do:

```

cd scripts/ && ./stow-it.sh Raspi64

```

## Unique Program Settings

### Vim

#### NEW

Follow the interactive installer.

```

cd scripts/ && ./installer.sh -vim -3

```

#### MANUAL OLD WAY

```

pushd vim
stow . -t ~
popd
pushd scripts

echo "Installing Vim plugins"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
sh ./install.py --all

```

## Profile Specific Settings

### Ed

```

stow gitconfig/lap -t ~ # ~.gitconfig
stow i3/lap -t ~ # ~.config/i3/config

```

### Justin

```

cd zshrc && stow justin -t ~ # ~.zshrc
cd i3/justin && stow .config -t ~/.config

```

### Leidos

```

stow gitconfig/leidos -t ~ # ~.gitconfig
cd zshrc && stow leidos -t ~ # ~.zshrc

```

## Program Settings

stow bash_aliases
stow bash_profile
stow bashrc
stow docker
stow fontconfig
stow gitconfig
stow i3
stow i3blocks
stow ideavimrc
stow mps-youtube
stow picom
stow redshift
stow ssh
stow vim
stow xinitrc
stow xresources
stow zshrc

## Executables

### Installation

```

sudo stow scripts -t /usr/local/bin

```

### Removal

```

stow -D scripts/ -t /usr/local/bin

```

```
