# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle ls

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme romkatv/powerlevel10k

#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator background_jobs history)

# Tell Antigen that you're done.
antigen apply

# source bash aliases (can't live without them)
source ~/.bash_aliases
# source Powerlevel10k
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
