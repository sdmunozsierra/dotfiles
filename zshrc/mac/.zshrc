# Source antigen from brew install antigen
source /usr/local/Cellar/antigen/2.2.3/share/antigen/antigen.zsh

antigen use oh-my-zsh

# Themes
antigen apply

antigen bundle https://github.com/trapd00r/zsh-syntax-highlighting-filetypes.git
antigen bundle zsh-users/zsh-syntax-highlighting # last plugin to be loaded
antigen bundle lukechilds/zsh-nvm

HISTFILE=~/.bash_history
HISTSIZE=2000
SAVEHIST=1000
setopt appendhistory extendedglob
unsetopt EXTENDED_HISTORY
bindkey -v
bindkey '^R' history-incremental-search-backward

# Path to your oh-my-zsh installation.
export ZSH="/Users/golfer441/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ADD_NEWLINE="true"
SPACESHIP_CHAR_SYMBOL=" \uf0e7"
SPACESHIP_CHAR_PREFIX="\uf296"
#SPACESHIP_CHAR_SUFFIX=(“ “)
SPACESHIP_CHAR_COLOR_SUCCESS="yellow"
SPACESHIP_PROMPT_DEFAULT_PREFIX="$USER"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_USER_SHOW="true"

DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="false"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    colorize
    git
    docker
)
autoload -Uz compinit
compinit

source $ZSH/oh-my-zsh.sh
source ~/.bash_aliases

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#zsh-completions
source $(dirname $(gem which colorls))/tab_complete.sh
