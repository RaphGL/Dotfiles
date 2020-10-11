export ZSH="$HOME/.zsh-plugins/.oh-my-zsh"
ZSH_THEME="gentoo"

### Aliases ###
# fuzzy find directories
fuzzycd() {
	DIR=$(find $HOME -maxdepth 4 -type d | fzf --layout=reverse --height=20)
	cd $DIR
	zle reset-prompt
}
zle -N fuzzycd
bindkey '^P' fuzzycd

fuzzyhistory() {
    eval $(history | fzf --layout=reverse --height=20 --tiebreak=index --tac | awk '{for(a=2;a<=NF;++a) printf $a " ";print""}')
	zle reset-prompt
}
zle -N fuzzyhistory
bindkey '^R' fuzzyhistory

# Quick edit configs
alias nvimc="$EDITOR ~/.config/nvim/init.vim"
alias qtilec="$EDITOR ~/.config/qtile/config.py"
alias astartc="$EDITOR ~/.config/qtile/autostart.sh"
alias kb="$EDITOR ~/.config/sxhkd/sxhkdrc"

# Change defaults
alias grep="grep --color=auto"
alias diff="diff --color=always"
alias bat="bat --theme Dracula"
alias df="df -h"
alias la="ls -lah"
alias ll="ls -lh"
alias ls="ls --color=auto"
alias mv="mv -i"
alias cp="cp -i"
alias gcc99="gcc -std=c99"
alias v="nvim"

# Youtube-DL
alias yt="youtube-dl -f bestvideo+bestaudio"
alias yta="youtube-dl -f bestaudio"

# Git aliases
alias g="git"
alias gc="git commit"
alias gp="git push"
alias ga="git add"
alias gl="git log"
alias gs="git status"
alias gck="git checkout"

# Pacman and Yay
alias pacsyu="sudo pacman -Syu"
alias yaysua="yay -Sua --noconfirm"
alias pacunlock="sudo rm /var/lib/pacman/db.lck" # clean pacman lock
alias paccleanup="sudo pacman -Rns $(pacman -Qtdq)" # remove orphaned packages

export UPDATE_ZSH_DAYS=5
source $ZSH/oh-my-zsh.sh

### vi mode ###
bindkey -v
export KEYTIMEOUT=1

# Edit line in vim buffer ctrl-v
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line
# Enter vim buffer from normal mode
autoload -U edit-command-line && zle -N edit-command-line && bindkey -M vicmd "^v" edit-command-line

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char
# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# ci", ci', ci`, di", etc
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done


# ci{, ci(, ci<, di{, etc
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Syntax highlighting must be sourced in the end of the file
source $HOME/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
