# /* Temporarly disable xresources */
# /*[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources*/

# Move this somewhere else TODO
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# SSH init
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Keyring daemon
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)

# Pass (Cleta)
pass init A5478E62D9E7F9A0

# Removes error for xclip
pwd | xclip -r -selection secondary

# Start WM
exec i3
