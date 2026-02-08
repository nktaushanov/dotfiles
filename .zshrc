source ~/.local_conf/.zshrc
source ~/.bash_profile

export LANG="en_US.UTF-8"

export PATH="/opt/homebrew/bin:$PATH"

bindkey -e
bindkey "^[[3~" delete-char
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

export PS1="%{%F{39}%}%n %{%F{226}%}%~ %{%F{39}%}λ %{%F{255}%}"


export PATH="/usr/local/sbin:$PATH"
eval "$(mise activate zsh)"
