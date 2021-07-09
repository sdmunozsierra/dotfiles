# Load the oh-my-zsh's library.
source /usr/share/zsh/share/antigen.zsh
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle ls
antigen bundle docker
antigen bundle docker-compose

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship
antigen theme romkatv/powerlevel10k
ZSH_THEME="spaceship"

# Tell Antigen that you're done.
antigen apply

# source bash aliases (can't live without them)
source ~/.bash_aliases
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# This will share the history with bash
HISTFILE=~/.bash_history
HISTSIZE=10000
SAVEHIST=10000
unsetopt extended_history
setopt share_history
bindkey -v
bindkey '^R' history-incremental-search-backward
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename $HOME/.zshrc

autoload -Uz compinit
compinit
# End of lines added by compinstall

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fpath=($fpath "/home/munozsies/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
