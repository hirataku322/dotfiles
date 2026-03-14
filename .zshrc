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
alias ll='ls -la'
alias wc='wc -l'
alias history='history -id'
alias v="nvim"
alias oc="opencode"
alias zs="source ~/.zshrc"
alias zp="source ~/.zprofile"

# git
alias ghb="gh browse"
alias ghqr='z $(ghq list -p | fzf)'
alias lg='lazygit'

# work trunk
alias wl="wt list"
alias wr="wt remove"
alias ws="wt switch"

git_create_repo() {
  repo_path=$(ghq create $1)
  gh repo create --public -s $repo_path
}
alias gcr=git_create_repo

man_with_color() {
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
alias man=man_with_color

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
bindkey '^f' autosuggest-execute
bindkey '^]' autosuggest-accept

# zk note management
export ZK_NOTEBOOK_DIR="$HOME/ghq/github.com/hirataku322/note"

# 新規ノート作成: zn "タイトル"
function zn() {
  local title="$(date +%Y-%m-%d)-$1"
  zk new --title "$title" "$ZK_NOTEBOOK_DIR"
}

# ノート検索: zf "キーワード"
function zf() {
  zk edit --interactive --match "$*" "$ZK_NOTEBOOK_DIR"
}

# タグ一覧
function zt() {
  zk tag list "$ZK_NOTEBOOK_DIR"
}

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi
