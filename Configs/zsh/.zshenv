# Defaults
export EDITOR="helix"
export VISUAL="helix"
export BROWSER="firefox"
export READER="zathura"
export TERMINAL="kitty"
export TERM="xterm-256color"
export VIDEO="mpv"
export COLORTERM="truecolor"
export OPENER="xdg-open"
export PAGER="less"
 export QT_QPA_PLATFORMTHEME="qt5ct"

# Japanese input
export XMODIFIERS=fcitx
export QT_IM_MODULE=fcitx

### Man page syntax highlighting ###
# Start blinking
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
# Start bold
export LESS_TERMCAP_md=$(tput bold; tput setaf 2) # green
# Start stand out
export LESS_TERMCAP_so=$(tput bold; tput setaf 1) # yellow
# End standout
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# Start underline
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 4) # red
# End bold, blinking, standout, underline
export LESS_TERMCAP_me=$(tput sgr0)
