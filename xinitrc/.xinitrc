# /* Temporarly disable xresources */
# /*[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources*/

# SSH init
# Move this somewhere else TODO
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# Removes error for xclip
pwd | xclip -r -selection secondary

# Start WM
exec i3
