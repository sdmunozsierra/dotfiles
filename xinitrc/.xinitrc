[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

exec i3
# exec xbindkeys
## ./.config/autostart/dmenu_recent_aliases.sh
#
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
