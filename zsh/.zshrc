export ZSH="$HOME/.zsh-plugins/.oh-my-zsh"
ZSH_THEME="gentoo"

### Aliases ###
alias astartc="$EDITOR ~/.config/qtile/autostart.sh"
alias diff="diff --color=always"
alias g="git"
alias gc="git commit"
alias gcc99="gcc -std=c99"
alias grep="grep --color=auto"
alias gs="git status"
alias kb="$EDITOR ~/.config/sxhkd/sxhkdrc"
alias la="ls -lah"
alias ll="ls -lh"
alias ls="ls --color=auto"
alias mv="mv -i"
alias nvimc="$EDITOR ~/.config/nvim/init.vim"
alias qtilec="$EDITOR ~/.config/qtile/config.py"
alias rm="rm -i"
alias v="nvim"
alias yt="youtube-dl"
alias yta="youtube-dl -f bestaudio"
export UPDATE_ZSH_DAYS=5
source $ZSH/oh-my-zsh.sh

### vi mode ###
bindkey -v
export KEYTIMEOUT=1

# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

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

# fuzzy find directories
fuzzycd() {
	DIR=$(find $HOME -maxdepth 4 -type d | fzf)
	cd $DIR
}
alias fcd="fuzzycd"

# Syntax highlighting must be sourced in the end of the file
source $HOME/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
