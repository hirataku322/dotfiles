# history
export HISTFILE=${HOME}/.zsh_history 
export HISTSIZE=10000 # メモリに保存される履歴の件数
export SAVEHIST=100000 # 履歴ファイルに保存される履歴の件数
setopt hist_ignore_dups # 重複を記録しない
setopt EXTENDED_HISTORY # 開始と終了を記録
setopt extended_history #share_historyでもOK
alias history='history -id'

# basic
alias mkdir="mkdir -p"
alias cp='cp -r'
alias ls='exa -F1 --sort=type'
alias ll='ls -la --no-filesize --no-user --no-permissions --time-style long-iso'

# git
alias gp="git push origin"
alias gpl="git pull origin"
alias gc="git commit -m"
alias ga="git add ."
alias gac="git add -A && git commit"
alias gacm="git add -A && git commit -ammend"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gs="git status"
alias gm="git merge"
alias gb="git branch"

# neovim
alias vim="nvim"
alias zshrc="vim ~/.zshrc && source ~/.zshrc"

# others
alias ghqr='cd $(ghq list -p | fzf)'
alias lz='lazygit'
alias q="q -t"
alias keygen='ssh-keygen -t rsa -b 4096 -C $1'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fd() {
  # fd - cd to selected directory
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# eval
eval "$(starship init zsh)"
. ~/ghq/github.com/rupa/z/z.sh

# man colorful
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
