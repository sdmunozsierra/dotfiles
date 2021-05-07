# dotfiles

Dotfiles managed with Stow

## Profiles

Justin
Ed
Leidos
Raspi64

## Run Script

To install all the programs for a specific profile do:

```
cd scripts/
./stow-it.sh justin
```

## Unique Program Settings

### Vim

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
stow gitconfig/lap -t ~   # ~.gitconfig
stow i3/lap -t ~          # ~.config/i3/config
```

### Justin

```
cd zshrc && stow justin -t ~    # ~.zshrc
cd i3/justin && stow .config -t ~/.config
```

### Leidos

```
stow gitconfig/leidos -t ~   # ~.gitconfig
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
