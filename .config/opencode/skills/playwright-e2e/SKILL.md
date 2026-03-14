---
name: playwright-e2e
description: Playwrightを使ってブラウザ操作・E2Eテスト・画面検証を行うスキル。「ブラウザで確認して」「画面を開いて確認して」「E2Eテストして」「動作確認して」「UIを検証して」などのリクエストで使用する。
---

# Playwright E2E スキル

`playwright` MCP サーバーを使ってブラウザを自動操作し、画面の動作確認・E2Eテストを行う。

## このスキルを使うタイミング

- ブラウザで実際に動作確認したいとき
- UIの表示・インタラクションを検証したいとき
- ログイン・フォーム送信・画面遷移などのフローをテストしたいとき
- スクリーンショットで現在の画面状態を確認したいとき
- ネットワークリクエスト・コンソールエラーを確認したいとき

## 基本的な操作フロー

### 1. ページを開く

```
browser_navigate({ url: "http://localhost:3000" })
```

### 2. 画面の状態を把握する（スナップショット優先）

```
browser_snapshot()          # アクセシビリティツリーで構造を把握（推奨）
browser_take_screenshot()   # 視覚的な確認が必要なとき
```

**重要**: `browser_snapshot` はアクセシビリティツリーを返す。要素への操作は snapshot で得た `ref` を使う。スクリーンショットは視覚確認専用で、要素操作には使えない。

### 3. 要素を操作する

```
# クリック
browser_click({ ref: "<ref値>", element: "送信ボタン" })

# テキスト入力
browser_type({ ref: "<ref値>", element: "メールアドレス入力欄", text: "user@example.com" })

# フォームをまとめて入力
browser_fill_form({ fields: [
  { ref: "<ref値>", value: "入力値" },
  { ref: "<ref値2>", value: "入力値2" }
] })

# セレクトボックス
browser_select_option({ ref: "<ref値>", element: "ドロップダウン", values: ["option1"] })
```

### 4. 遷移・待機

```
browser_wait_for({ text: "ログイン成功" })      # テキストが出るまで待つ
browser_wait_for({ textGone: "ローディング" })  # テキストが消えるまで待つ
browser_wait_for({ time: 2 })                   # 秒数待つ（最終手段）
```

### 5. ログを確認する

```
browser_console_messages({ level: "error" })   # コンソールエラー確認
browser_network_requests()                     # APIリクエスト確認
```

## よくあるテストパターン

### ログインフロー

```
1. browser_navigate({ url: "<アプリURL>/login" })
2. browser_snapshot() → ログインフォームの ref を取得
3. browser_type({ ref, text: "ユーザー名" })
4. browser_type({ ref, text: "パスワード" })
5. browser_click({ ref: "ログインボタンのref" })
6. browser_wait_for({ text: "ダッシュボード" })  # ログイン成功を確認
7. browser_snapshot() または browser_take_screenshot()
```

### ページ表示確認

```
1. browser_navigate({ url: "対象URL" })
2. browser_wait_for({ time: 1 })
3. browser_snapshot() → 要素の存在を確認
4. browser_take_screenshot() → 視覚的に確認
5. browser_console_messages({ level: "error" }) → エラーがないか確認
```

### フォーム送信

```
1. browser_navigate({ url: "フォームページURL" })
2. browser_snapshot() → 各フィールドの ref を取得
3. browser_fill_form({ fields: [...] })
4. browser_click({ ref: "送信ボタンref" })
5. browser_wait_for({ text: "送信完了" })
6. browser_network_requests() → APIが正しく呼ばれたか確認
```

## ツールリファレンス

| ツール名 | 用途 |
|---------|------|
| `browser_navigate` | URLへ遷移 |
| `browser_snapshot` | アクセシビリティツリー取得（要素操作の前に使う） |
| `browser_take_screenshot` | スクリーンショット（視覚確認のみ） |
| `browser_click` | 要素をクリック |
| `browser_type` | テキスト入力 |
| `browser_fill_form` | 複数フィールドをまとめて入力 |
| `browser_select_option` | セレクトボックスで選択 |
| `browser_press_key` | キーボード操作（Enter, Escape など） |
| `browser_wait_for` | テキスト出現/消滅/時間待ち |
| `browser_console_messages` | コンソールログ取得 |
| `browser_network_requests` | ネットワークリクエスト一覧 |
| `browser_evaluate` | JavaScriptを実行 |
| `browser_tabs` | タブ管理（新規作成・切り替え・閉じる） |
| `browser_navigate_back` | ブラウザ戻る |
| `browser_close` | ブラウザを閉じる |

## テスト結果の報告フォーマット

```
## E2Eテスト結果

### テスト対象
- URL: <対象URL>
- テスト内容: <何をテストしたか>

### 結果
- ステータス: ✅ 成功 / ❌ 失敗

### 確認項目
- [ ] 画面が正しく表示される
- [ ] 操作が期待通りに動作する
- [ ] コンソールエラーがない
- [ ] APIレスポンスが正常（2xx）

### 問題があった場合
- エラー内容: <コンソールエラー・ネットワークエラーの詳細>
- スクリーンショット: <問題が起きている画面>
- 推奨対応: <修正の方向性>
```

## 注意事項

- `browser_snapshot` で得た `ref` は動的な値なので、スナップショット取得後すぐに使う
- JavaScriptフレームワーク（Vue/React等）のコンポーネントへの入力は `browser_type` で対応できない場合がある。その場合は `browser_evaluate` でイベントを直接ディスパッチする
- ページ遷移後は必ず `browser_wait_for` で描画完了を待ってから次の操作を行う
- ブラウザは自動で起動される（事前準備不要）
