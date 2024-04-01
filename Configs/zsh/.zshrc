### Aliases ###
# fuzzy find directories
fuzzycd() {
	DIR=$(find $HOME -maxdepth 4 -type d | fzf --layout=reverse --height=20)
	cd $DIR
	zle reset-prompt
}
zle -N fuzzycd
bindkey '^P' fuzzycd

# Quick edit configs
alias nvimc="$EDITOR ~/.config/nvim/"
alias qtilec="$EDITOR ~/.config/qtile/config.py"
alias astartc="$EDITOR ~/.config/qtile/autostart.sh"
alias kbinds="$EDITOR ~/.config/sxhkd/sxhkdrc"
if command -v helix &> /dev/null
then 
    alias hx="helix"
fi

# Change defaults
alias grep="grep --color=auto"
alias diff="diff --color=always"
if command -v bat &> /dev/null
then
    alias cat="bat --theme Dracula"
fi
alias df="df -h"
alias la="ls -lah"
alias ll="ls -lh"
alias ls="ls --color=auto"
alias mv="mv -i"
alias cp="cp -i"
alias v="nvim"

# Enables history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Youtube-DL
alias yt="yt-dlp -f bestvideo+bestaudio"
alias yta="yt-dlp -f bestaudio"

# Git aliases
alias g="git"
alias gc="git commit"
alias gp="git push"
alias ga="git add"
alias gl="git log"
alias gs="git status"
alias gd="git diff"
alias gck="git checkout"

# removing necessity to use cd to change directories
setopt autocd autopushd

### Autocompletion configuration ###
# Load completion system
autoload -Uz compinit && compinit

# case insensitive path-completion 
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 

# partial completion suggestions
zstyle ":completion:*" list-suffixes zstyle ':completion:*' expand prefix suffix 

# Show menu to select from completion
zstyle ':completion:*' menu select

### vim mode ###
bindkey -v
bindkey -v '^?' backward-delete-char
export KEYTIMEOUT=1

# Edit line in vim buffer ctrl-v
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line
# Enter vim buffer from normal mode
autoload -U edit-command-line && zle -N edit-command-line && bindkey -M vicmd "^v" edit-command-line


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

PROMPT="%F{green}%n%f%F{green}@%f%F{green}%m%f %F{blue}%~%f %# "

export PATH="$HOME/.poetry/bin:$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH:$HOME/.cargo/bin"
# tells the odin lsp where to find the library collections
export ODIN_ROOT="/usr/lib/odin"

# Syntax highlighting must be sourced in the end of the file
source $HOME/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
