# Bash options
shopt -s histappend
HISTCONTROL=ignoredups
HISTIGNORE="exit"
HISTSIZE="2000"
export IGNOREEOF=5 # press crlt-d 5 times to exit bash
stty -ixon # not to be disturbed by Ctrl-S ctrl-Q in terminals:

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Run SSH agent once
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")"
fi

# Colorize commands
# Load colors with lscolors-git from AUR
. /usr/share/LS_COLORS/dircolors.sh

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# 256 file enabled by default in st
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
	export TERM='xterm-256color'
else
	export TERM='xterm-color'
fi

STARTCOLOR='\e[0;34m';  # Start color Blue
ENDCOLOR='\e[0m'        # End color

TIMEDATE="[\d at \t]"          # date and time
HOSTINFO='\u@$(uname -n):\W'   # username hostname directory

# username and full path
#export PS1="$STARTCOLOR\u:\w$ENDCOLOR \$ "
# username and small path
export PS2="$STARTCOLOR\u:\W$ENDCOLOR \$ "
# timedate and hostinfo
export PS3="$STARTCOLOR$TIMEDATE\n$HOSTINFO$ENDCOLOR \$ "

# Aliases file
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

# Set up default PATH
export PATH=/home/$USER/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin

# Add scripts from dotfiles to PATH
export PATH=$PATH:~/dotfiles/scripts

# Add rubygems to PATH
export PATH=$PATH:~/.gem/ruby/2.7.0/bin

# Extra Programs

# Run 'nvm use' automatically every time there's a .nvmrc file in the directory.
# Also, revert to default version when entering a directory without .nvmrc
enter_directory() {
if [[ $PWD == $PREV_PWD ]]; then
    return
fi
PREV_PWD=$PWD
if [[ -f ".nvmrc" ]]; then
    nvm use
    NVM_DIRTY=true
elif [[ $NVM_DIRTY = true ]]; then
    nvm use default
    NVM_DIRTY=false
fi
}
export PROMPT_COMMAND=enter_directory
source /usr/share/nvm/init-nvm.sh

# Bash complition is installed via pacman as `bash-completion`
for file in /usr/share/bash-completion/completions/* ; do
    source "$file"
done

