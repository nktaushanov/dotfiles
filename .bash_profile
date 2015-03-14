get_current_file_dir() {
  SOURCE="${BASH_SOURCE[0]}"
  # resolve $SOURCE until the file is no longer a symlink
  while [ -h "$SOURCE" ]; do
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    # if $SOURCE was a relative symlink, we need to resolve it relative to the
    # path where the symlink file was located
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
  done
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
}
get_current_file_dir

source $DIR/tools/helpers.sh

# Homebrew
export PATH="/usr/local/bin:$PATH"

# Colors
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]λ\[\e[m\] \[\e[1;37m\]'
export TERM=xterm-256color

# Editor
export EDITOR='vim'

# Git completion
if [ -f ~/.git-completion.bash  ]; then
  . ~/.git-completion.bash
fi

# Aliases
source ~/.bash_aliases

# Docker
if command_exits docker-machine; then
  eval "$(docker-machine env default)"
fi

