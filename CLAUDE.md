# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## リポジトリ概要

個人用のdotfilesリポジトリ。Neovim、WezTerm、Zshの設定を管理。

## セットアップとデプロイ

```bash
# 設定ファイルをホームディレクトリにシンボリックリンク
./setup.sh
```

setup.shは以下のファイルをシンボリックリンクでデプロイ:

- `.wezterm.lua` - WezTerm設定
- `.zshrc` - Zsh設定
- `.gitconfig` - Git設定
- `.config/starship.toml` - Starship prompt設定
- `.config/nvim` - Neovim設定ディレクトリ全体
- `.config/github-copilot` - GitHub Copilot設定

## Neovim設定アーキテクチャ

### エントリーポイント

`.config/nvim/init.lua`が以下を順に読み込み:

1. `config/opts.lua` - Vimオプション設定
2. `config/keys.lua` - キーマッピング設定
3. `config/lazy.lua` - Lazy.nvimプラグインマネージャー初期化

### プラグイン管理

- **パッケージマネージャー**: Lazy.nvim
- **プラグイン定義**: `lua/plugins/`ディレクトリ内の各Luaファイル
- **自動インストール**: Lazy.nvimが未インストールプラグインを自動的にクローン

### 主要プラグインと設定ファイル

#### LSP関連 (`plugins/lsp.lua`)

- Mason.nvim経由でLSPサーバーを管理
- 設定済みLSPサーバー: pyright, lua_ls, jsonls, yamlls, ts_ls, vue_ls
- Vue.js用にTypeScriptプラグインを設定
- LSPキーマップ:
  - `K`: ホバー情報、`ge`: 診断フロート表示
  - `gd`: 定義、`gD`: 宣言、`gi`: 実装、`gt`: 型定義、`gr`: 参照
  - `g]`/`g[`: 次/前の診断へジャンプ
  - `gn`: リネーム、`ga`: コードアクション

#### フォーマッター (`plugins/format.lua`)

- Conform.nvimを使用
- 保存時に自動フォーマット実行
- フォーマッター: prettier(JS/TS/Vue/JSON/HTML/CSS/MD)、ruff_format(Python)
- 手動フォーマット: `<leader>gf`

#### ファジーファインダー (`plugins/telescope.lua`)

- Telescope.nvimとfzf-nativeを使用
- Gitルートディレクトリを自動検出して検索
- キーマップ:
  - `<C-p>`: ファイル検索
  - `<leader>jg`: grep検索
  - `<leader>jb`: バッファ一覧
  - `<leader>jh`: ヘルプタグ検索

#### 補完 (`plugins/complement.lua`)

- nvim-cmpを使用
- LSP、スニペット(vsnip)、パス、バッファからの補完
- 補完操作: `<C-p>`/`<C-n>`(選択)、`<CR>`(確定)、`<C-Space>`(手動トリガー)

#### その他の主要プラグイン

- `plugins/oil.lua` - ファイラー
- `plugins/copilot.lua` - GitHub Copilot
- `plugins/claudecode.lua` - Claude Code統合
- `plugins/toggleterm.lua` - 統合ターミナル
- `plugins/treesitter.lua` - シンタックスハイライト
- `plugins/gitsigns.lua` - Git統合
- `plugins/color-scheme.lua` - カラースキーム(catppuccin-mocha)
- `plugins/bufferline.lua` - バッファタブ表示
- `plugins/lualine.lua` - ステータスライン
- `plugins/autopairs.lua` - 自動括弧補完
- `plugins/easymotion.lua` - 高速カーソル移動
- `plugins/indent-blankline.lua` - インデントガイド
- `plugins/nvim-colorizer.lua` - カラーコードプレビュー

### グローバル設定

#### キーマップ (`config/keys.lua`)

- Leader: `<Space>`
- LocalLeader: `,`
- ウィンドウ分割: `ss`(水平)、`sv`(垂直)
- ウィンドウ移動: `sh/sj/sk/sl`
- バッファ削除: `sd`

#### Vimオプション (`config/opts.lua`)

- インデント: スペース2つ
- エンコーディング: UTF-8
- クリップボード統合有効
- スワップファイル/バックアップ無効
- 24bitカラー(termguicolors)有効
- 分割: 右/下に開く
- スクロールオフセット: 上下左右8行/列
- updatetime: 250ms (CursorHold高速化)
- undoファイル永続化有効
- 置換リアルタイムプレビュー(inccommand)

## WezTerm設定

`.wezterm.lua`の主要機能:

- カラースキーム: catppuccin-mocha
- フォント: JetBrains Mono (13pt)
- 背景透明度: 0.90、blur効果あり
- Leader: `Ctrl+q`
- ペイン分割: `Leader+¥`(水平)、`Leader+-`(垂直)
- ペイン移動: `Leader+h/j/k/l`
- タブ操作: `Leader+c`(新規)、`Ctrl+j/k`(切り替え)

## Neovim設定の変更時の注意点

1. **プラグイン追加**: `lua/plugins/`に新しい`.lua`ファイルを作成。Lazy.nvimが自動検出
2. **LSP追加**: `plugins/lsp.lua`の`lsp_servers`配列に追加
3. **フォーマッター追加**: `plugins/format.lua`の`formatters_by_ft`に追加
4. **設定変更後**: Neovimを再起動するか`:Lazy sync`を実行

## 開発環境の前提

- macOS環境を想定
- Homebrewでzsh-autosuggestionsなどの依存関係をインストール済み
- fzf、ripgrep、exaなどのCLIツールが利用可能
