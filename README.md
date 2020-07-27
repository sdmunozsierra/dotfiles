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
### Ed
stow gitconfig/lap -t ~   # ~.gitconfig
stow i3/lap -t ~          # ~.config/i3/config
### Justin
cd zshrc && stow justin -t ~    # ~.zshrc
cd i3/justin && stow .config -t ~/.config  
### Off
stow gitconfig/off -t ~   # ~.gitconfig
cd zshrc && stow off -t ~ # ~.zshrc

## Executables

### Installation
sudo stow scripts -t /usr/local/bin

### Removal
stow -D scripts/ -t /usr/local/bin
