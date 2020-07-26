# /* Temporarly disable xresources */
# /*[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources*/

# SSH init
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)

# Removes error for xclip
pwd | xclip -r -selection secondary

# Start WM
exec i3
