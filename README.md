# dotfiles
Dotfiles managed with Stow

## Profiles
TODO implement
Justin
Ed
Work (We should nickname this one the most madafucking reliable guy in History ... Mike from Jane the virgin..)

## Programs
stow bash_aliases
stow bash_profile
stow bashrc
stow vim

## Profile Specific Programs
# stow i3  # Before Test before removing
# TODO TEST
stow gitconfig/lap -t ~   # ~.gitconfig
stow i3/lap -t ~          # ~.config/i3/config

### Justin i3
#### ~.config/i3/config
cd i3/justin && stow .config -t ~/.config  

## Executables

### Installation
sudo stow scripts -t /usr/local/bin

### Removal
stow -D scripts/ -t /usr/local/bin
