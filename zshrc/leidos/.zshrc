# Source antigen
source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

# Themes
#antigen theme eendroroy/alien-minimal alien-minimal
antigen theme de-luca/Trinity
antigen apply

# Bundles
antigen bundle https://github.com/trapd00r/zsh-syntax-highlighting-filetypes.git
antigen bundle zsh-users/zsh-syntax-highlighting # last plugin to be loaded

HISTFILE=~/.bash_history
HISTSIZE=2000
SAVEHIST=1000
setopt appendhistory extendedglob
unsetopt EXTENDED_HISTORY
bindkey -v
bindkey '^R' history-incremental-search-backward
# The following lines were added by compinstall
zstyle :compinstall filename '/home/munozsies/.zshrc'
# oh-my-zsh Plugins
plugins=(
    colorize
    git
    docker
)
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Source aliases from bash
source ~/.bash_aliases

# Source ls colors
#source /usr/share/LS_COLORS/dircolors.sh

# Enable this for bash completions
# Or use (zsh-completions)
# bash completion
#autoload bashcompinit
#bashcompinit
# Source flutter bash completions
#source /usr/local/etc/bash_completion.d/flutter
