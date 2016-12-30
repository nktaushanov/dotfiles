# docker
if [ -x "$(command -v docker-machine)" ]; then
  alias start_docker="docker-machine start default"
  alias docker_env="eval $(docker-machine env)"
fi

# ls
alias ls="ls --color"
alias ll="ls --color -al --group-directories-first"

# Load mchine local profile
if [ -f ~/.local_conf/.bash_aliases ]; then
  source ~/.local_conf/.bash_aliases
fi

