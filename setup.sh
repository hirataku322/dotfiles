#!/bin/bash
set -euo pipefail

SOURCE_DIR=$(git rev-parse --show-toplevel)

# ~/.configディレクトリを作成（存在しない場合）
mkdir -p ~/.config

# シンボリックリンクを作成するファイル/ディレクトリのリスト
# 形式: "ソースパス:リンク先パス"
SYMLINKS=(
  ".wezterm.lua:~/.wezterm.lua"
  ".zshrc:~/.zshrc"
  ".gitconfig:~/.gitconfig"
  ".config/starship.toml:~/.config/starship.toml"
  ".config/nvim:~/.config/nvim"
  ".config/github-copilot:~/.config/github-copilot"
)

for item in "${SYMLINKS[@]}"; do
  src="${SOURCE_DIR}/${item%%:*}"
  dest="${item##*:}"
  dest="${dest/#\~/$HOME}"

  if ln -Fs "$src" "$dest" 2>/dev/null; then
    echo "✓ $dest -> $src"
  else
    echo "✗ $dest のリンク作成に失敗"
  fi
done

echo ""
echo "セットアップ完了"
