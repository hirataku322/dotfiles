# initialize
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"
. ~/ghq/github.com/rupa/z/z.sh

# history
export HISTFILE=${HOME}/.zsh_history # 保存先
export HISTSIZE=10000 # メモリに保存される履歴の件数
export SAVEHIST=100000 # 履歴ファイルに保存される履歴の件数
setopt hist_ignore_dups # 重複を記録しない
setopt EXTENDED_HISTORY # 開始と終了を記録
setopt extended_history #share_historyでもOK

# basic
alias mkdir="mkdir -p"
alias cp='cp -r'
alias cd='cd -P'
alias ls='exa -F1  --sort=type'
alias ll='ls -la --no-user --no-permissions --time-style long-iso'
alias wc='wc -l'
alias head='head -n 10'
alias history='history -id'
alias ex="exit"

alias v="nvim"
alias zs="nvim ~/.zshrc && source ~/.zshrc"

alias q="q -tH"
alias w3m="w3m -dump -cols 9999"
alias to_tsv="awk '{ OFS=\"\t\" ; \$1=\$1 ; print \$0 }' $1"
alias bl="brew list"
alias r="radian"

# git
alias gp="git push origin"
alias gpl="git pull origin"
alias ghb="gh browse"
alias ghqr='cd $(ghq list -p | fzf)'
alias lg='lazygit'

# make remote repository and clone it
ghcr() {
 gh repo create $@
 ghq get git@github.com:hirataku322/$1.git
}

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

# completionsを有効にする
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
