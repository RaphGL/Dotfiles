PATH=$PATH:$HOME/dotfiles/.scripts/
# Defaults
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox"
export READER="zathura"
export TERMINAL="kitty"
export TERM="xterm-256color"
export VIDEO="mpv"
export COLORTERM="truecolor"
export OPENER="xdg-open"
export PAGER="less"

# Japanese input
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -d -x

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
