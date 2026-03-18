---
name: new-branch
description: GitLabのissueリンクからブランチを作成するスキル。「ブランチ作って」「ブランチ切って」「new branch」「branch作成」など、ブランチ作成に関するリクエストで使用する。issueリンクが含まれていなくても、ブランチ作成の意図があれば発動し、issueリンクを確認する。
---

# GitLab Issue → ブランチ作成

GitLabのissueリンクを受け取り、issue情報に基づいて適切な命名のブランチを作成する。

## フロー

1. **issueリンクの取得**
   - ユーザーのメッセージにGitLabのissue URL（例: `https://gitlab.com/group/project/-/issues/123`）が含まれていればそれを使う
   - なければユーザーに聞く

2. **issue情報の取得**
   - `glab` CLIを使ってissueのタイトルと番号を取得する
   - URLからプロジェクトとissue番号を抽出し、`glab api` で情報を取る
   ```bash
   glab api "projects/:id/issues/{issue_number}"
   ```
   - リポジトリ内で実行している場合は `glab issue view {number}` も使える

3. **ブランチ命名規則の確認**
   - 当該リポジトリのCLAUDE.mdにブランチの命名規則が記載されていれば、それに従う
   - CLAUDE.mdに規則がなければ、デフォルト規則を使う:
     - プレフィックス: `feature/`
     - フォーマット: `feature/{issue番号}-{issueタイトルの要約}`

4. **ブランチ名の生成**
   - タイトルの要約ルール:
     - 英語のkebab-caseに変換する（日本語タイトルの場合は内容を英訳して要約）
     - 簡潔に（2〜4単語程度）
     - 例: issue #42 「ユーザー認証にOAuth2を追加」→ `feature/42-add-oauth2-auth`

5. **ブランチ名をユーザーに確認**
   - 生成したブランチ名を提示して確認を取る
   - ユーザーが修正したい場合は調整する
   - **確認なしにブランチを作成してはいけない**

6. **ベースブランチの特定とブランチ作成**
   - デフォルトブランチを自動判定する（`main` または `dev` など）
   ```bash
   git remote show origin | grep 'HEAD branch'
   ```
   - リモートの最新を取得してからブランチを作成する
   ```bash
   git fetch origin
   git checkout -b {branch_name} origin/{default_branch}
   ```

## ブランチ名の例

| issue# | タイトル | ブランチ名 |
|--------|---------|-----------|
| 42 | ユーザー認証にOAuth2を追加 | `feature/42-add-oauth2-auth` |
| 108 | ログイン画面のバリデーションエラー | `feature/108-fix-login-validation` |
| 55 | READMEの更新 | `feature/55-update-readme` |
| 201 | API応答速度の改善 | `feature/201-improve-api-response-speed` |
