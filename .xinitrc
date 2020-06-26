export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

feh --bg-fill .local/share/wallpaper.jpg
dwmblocks &
dunst &
fcitx &

exec dwm
