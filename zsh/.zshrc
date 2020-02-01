export ZSH="$HOME/.zsh-plugins/.oh-my-zsh"
export KEYTIMEOUT=1

alias v="nvim"
alias nvimc="$EDITOR ~/.config/nvim/init.vim"
alias qtilec="$EDITOR ~/.config/qtile/config.py"
alias gcc99="gcc -std=c99"

ZSH_THEME="gentoo"
export UPDATE_ZSH_DAYS=5
plugins=(
  git
  vi-mode
  colored-man-pages
)
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
