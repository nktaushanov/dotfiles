# ls
alias ls="ls --color"
alias ll="ls --color -al --group-directories-first"
alias kc="kubectl"

# Load mchine local profile
if [ -f ~/.local_conf/.bash_aliases ]; then
  source ~/.local_conf/.bash_aliases
fi

alias mvim="$DIR/tools/megavim.sh"
