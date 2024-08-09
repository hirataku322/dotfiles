# initialize
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"
. ~/ghq/github.com/rupa/z/z.sh

# history
export HISTFILE=${HOME}/.zsh_history 
export HISTSIZE=1000 
export SAVEHIST=1000 
setopt hist_ignore_dups 
setopt EXTENDED_HISTORY 
setopt extended_history 

# basic
alias mkdir="mkdir -p"
alias cp='cp -r'
alias cd='cd -P'
alias ls='exa -1a --sort type'
alias wc='wc -l'
alias history='history -id'

alias v="nvim"
alias zs="nvim ~/.zshrc && source ~/.zshrc"

alias q="q -tH"
alias w3m="w3m -dump -cols 9999"

# git
alias gp="git push origin"
alias gpl="git pull origin"
alias ghb="gh browse"
alias ghqr='cd $(ghq list -p | fzf)'
alias gh='ghqr'
alias lg='lazygit'

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# manを色付け
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# completions
fpath+=~/.zfunc
autoload -Uz compinit && compinit

# auto suggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^k' autosuggest-accept

eval "$(op completion zsh)"; compdef _op op

# poetry completions
fpath+=~/.zfunc
autoload -Uz compinit && compinit

# docker
docker_select() {
  docker ps --format 'table {{ .ID }}\t{{ .Image }}\t{{ .Command }}\t{{ .Ports }}' | fzf --header-lines=1 --select-1 | awk '{print $1}'
}

dst() {
  docker stop $@ $(docker_select)
}

drm() {
  docker rm $@ $(docker_select)
}

alias dps='docker ps'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
