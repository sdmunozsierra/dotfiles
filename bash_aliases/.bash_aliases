# File that stores user defined aliases.

## Useful Shortcuts
# Redo last command with sudo
alias please='sudo $(history -p !!)'
alias ee="exit"
alias rmdir="rm -rf"

# Reload commands
alias reloadprof="source ~/.bash_profile"
alias reloadrc="source ~/.bashrc"
alias reloada="source ~/.bash_aliases"
alias reloadx="xrdb ~/.Xresources"

# ls commands
alias la="ls -A"
alias ll="ls -alF"
alias l="ls -CF"
alias lss=LSS;
function LSS(){
    ls -alGgh | awk '{print $3, " | " $7}' | column -t
}

#cd Commands 
alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias cd.....="cd ../../../.."
alias cd......="cd ../../../../.."
alias cdd="cd $HOME/Data/"
alias cdg="cd $HOME/Data/Git/"
alias cds="cd $HOME/Data/Git/Springbank/mapviewer-backend/"
alias cdmbs="cd $HOME/Data/Git/EEP/backendservices"
alias cdms="cd $HOME/Data/Git/EEP/tool-scrapers"
alias cdmb="cd $HOME/Data/Git/EEP/markit-backend"
alias cdme="cd $HOME/Data/Git/EEP/markit-environment"
alias cddf="cd $HOME/dotfiles/"

# pushd popd Commands
alias dirs="dirs -v"

# du Commands
alias foldersize="sudo du -sh ."

# change working directory (requires xclip)
alias cpwd="pwd | xclip -r -selection secondary && echo 'pwd copied'"
alias cdwd="cd $(xclip -o -selection secondary)"

# Grep commands
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#escrotum (screenshot) commands
#alias scrot="escrotum $HOME/Data/Screenshots/%Y-%b-%d_%T.png"
alias scrot="i3-scrot"
alias scrots="i3-scrot -s"
alias scrotw="i3-scrot -w"

# Keyboard change
alias asdf="sudo loadkeys colemak"
alias arst="sudo loadkeys us"

# Power Control
alias hibern="sudo systemctl hibernate"
alias suspend="sudo systemctl suspend"

## Specific Commands
#aws
# Installed from curl at: https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-prereq
# Pacman package was giving trouble. Delete this when resolved.
alias aws="/usr/local/bin/aws"

#zsh commands
alias z="zsh"

#bro commands
alias broski='function _(){ bro $1 | grep -B1 $1; }; _'

#color theme
alias displayColors="$HOME/Data/ArchScripts/display_colors.sh"

# add color "red, white, magenta, green, yellow, black"
alias matrix="cmatrix -bu 7 -C " 

#Youtube player
alias youtube="mpsyt"

## Get system information
alias meminfo='free -m -l -t'
alias cpuinfo='lscpu'
alias storageinfo='df -H'

# Cowsay
function randomsay() {
    cows=(`cowsay -l | grep -v '/'`)
    cow=${cows[$RANDOM % ${#cows[@]} ]}
    cowsay -f $cow `fortune` | lolcat
}

## Multimedia
bitrate (){
    echo `basename "$1"`: `file "$1" | sed 's/.*, \(.*\)kbps.*/\1/' | tr -d " " ` kbps
}


## Order alphabetically each line
function alpha_reorder(){
    awk ' {split( $0, a, " " ); asort( a ); for( i = 1; i <= length(a); i++ ) printf( "%s ", a[i] ); printf( "\n" ); }' $1 > $2
}

## Untar
function untar {
    if [ -z "$1" ]; then
        # display usage if no parameters given
        echo "Usage: extract ."
    else
        if [ -f $1 ] ; then
            NAME=${1%.*}
            mkdir $NAME && cd $NAME
            case $1 in
                *.tar.bz2) tar xvjf ../$1 ;;
                *.tar.gz) tar xvzf ../$1 ;;
                *.tar.xz) tar xvJf ../$1 ;;
                *.lzma) unlzma ../$1 ;;
                *.bz2) bunzip2 ../$1 ;;
                *.rar) unrar x -ad ../$1 ;;
                *.gz) gunzip ../$1 ;;
                *.tar) tar xvf ../$1 ;;
                *.tbz2) tar xvjf ../$1 ;;
                *.tgz) tar xvzf ../$1 ;;
                *.zip) unzip ../$1 ;;
                *.Z) uncompress ../$1 ;;
                *.7z) 7z x ../$1 ;;
                *.xz) unxz ../$1 ;;
                *.exe) cabextract ../$1 ;;
                *) echo "extract: '$1' - unknown archive method" ;;
            esac
        else
            echo "$1 - file does not exist"
        fi
    fi
}

#Backup all config files to github repo
gitBackup(){
    cd $HOME
    rsync -av --exclude-from='exclude-list.txt' $HOME/ $HOME/Data/Git/dotfiles/config
    echo "Backup finished"
    cd $HOME/Data/Git/dotfiles/
    echo "Remember to Git add commit and push"
}

gitBackupTest(){
    cd $HOME
    rsync -av --exclude-from='exclude-list.txt' $HOME/ /tmp/test
    cd /tmp
    rm -Rf test
    cd $HOME
    echo "Deleted temporary folder in /tmp/"
}

gitRestoreFile(){
    # From git repo
    cp $1 $HOME
}

debugSt(){
    sudo rm -r deleteme
    sudo cp -r wolfst deleteme/
    cd deleteme	
    sudo make clean install
    cd ..
}

#Create file chmod and vim
touchVim(){
    touch $1
    sudo chmod +777 $1
    vim $1
}

#Create file chmod and vim
makeScript(){
    touch $1
    sudo chmod +x $1
    vim $1
}

# Chainlink
alias chainlink='/home/munozsies/go/bin/chainlink'
