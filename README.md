# dotfiles
Dotfiles managed with Stow

## Profiles
Justin
Ed
Leidos

## Run Script
To install all the programs for a specific profile do:

```
$ cd scripts/
$ ./stow-it.sh justin
```

## Programs
stow bash_aliases
stow bash_profile
stow bashrc
stow docker
stow fontconfig
stow gitconfig
stow ideavimrc
stow mps-youtube
stow picom
stow redshift
stow vim
stow xinitrc
stow xresources

## Profile Specific Programs
### Ed
stow gitconfig/lap -t ~   # ~.gitconfig
stow i3/lap -t ~          # ~.config/i3/config
### Justin
cd zshrc && stow justin -t ~    # ~.zshrc
cd i3/justin && stow .config -t ~/.config  
### Leidos
stow gitconfig/leidos -t ~   # ~.gitconfig
cd zshrc && stow leidos -t ~ # ~.zshrc

## Executables

### Installation
sudo stow scripts -t /usr/local/bin

### Removal
stow -D scripts/ -t /usr/local/bin
