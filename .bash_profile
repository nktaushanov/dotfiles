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

# Colors
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]λ\[\e[m\] \[\e[1;37m\]'
export TERM=xterm-256color

# Editor
export EDITOR='vim'

# Git completion
if [ -f ~/.git-completion.bash  ]; then
  . ~/.git-completion.bash
fi

# NVM
export NVM_DIR="/Users/nikola/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm


# Default to gnu utils and man pages
GNUBIN_PATH=/usr/local/opt/coreutils/libexec/gnubin
if [ -d $GNUBIN_PATH ]; then
  PATH="$GNUBIN_PATH:$PATH"
fi

GNUMAN_PATH=/usr/local/opt/coreutils/libexec/gnuman
if [ -d $GNUMAN_PATH ]; then
  MANPATH="$GNUMAN_PATH:$MANPATH"
fi

# Aliases
source ~/.bash_aliases

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Load mchine local profile
source ~/.local_conf/.bash_profile
