# Add scripts in tools and then add an alias for them like this:
# alias greps="$DIR/tools/greps.sh"

if command_exits docker-machine; then
  alias start_docker="docker-machine start default"
  alias docker_env="eval $(docker-machine env)"
fi

if [ "$(uname)" == "Darwin" ]; then
  if command_exits gls; then
    alias ls="gls --color"
    alias ll="gls --color -al --group-directories-first"
  fi

  if command_exits gdate; then
    alias date=gdate
  fi
fi

