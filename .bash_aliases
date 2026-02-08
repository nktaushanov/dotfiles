# ls
alias ls="ls --color"
alias ll="ls --color -al --group-directories-first"
alias kc="kubectl"
alias vim="nvim"

# Load machine local profile
if [ -f ~/.local_conf/.bash_aliases ]; then
  source ~/.local_conf/.bash_aliases
fi
