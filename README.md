# dotfiles
Dotfiles managed with Stow

## Profiles

## Programs
stow bash_aliases
stow bash_profile
stow bashrc
stow gitconfig/lap -t ~
stow i3
stow vim

## Executables

### Installation
sudo stow scripts -t /usr/local/bin

### Removal
stow -D scripts/ -t /usr/local/bin
