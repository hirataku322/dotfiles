# initialize
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# starship (cache init script)
if [[ ! -f ~/.zsh_starship_init ]] || [[ ~/.config/starship.toml -nt ~/.zsh_starship_init ]]; then
  starship init zsh > ~/.zsh_starship_init
fi
source ~/.zsh_starship_init

# zoxide
eval "$(zoxide init zsh)"

# history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

# basic
alias mkdir="mkdir -p"
alias cp='cp -r'
alias cd='z'
alias ls='exa -1a --sort type'
alias ll='ls -la'
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
alias ghqr='z $(ghq list -p | fzf)'
alias lg='lazygit'

git_create_repo() {
  repo_path=$(ghq create $1)
  gh repo create --public -s $repo_path
}
alias gcr=git_create_repo

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

# compinit with cache (rebuild once per day)
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# auto suggestions (hardcode brew prefix to avoid slow $(brew --prefix))
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^k' autosuggest-accept
