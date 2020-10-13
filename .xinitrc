export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

fcitx &

exec stdbuf -oL ~/git/repositories/kbgwm/kbgwm >> kbgwm.log
