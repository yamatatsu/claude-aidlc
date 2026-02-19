# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working in this repository.

## 目的

このリポジトリは **AI-DLC (AI-Driven Development Life Cycle) のワークフローを Claude Code プラグインとして実装したもの** である。

## 前提

- Claude Code プラグインの定義ファイルを本リポジトリで管理する
- プラグイン設計においては AI-DLC の方法論を忠実に反映しつつ、Claude Code の機能に最適化する

## 開発ワークフロー

### ローカルテスト

```bash
# プラグインをローカルパスから直接ロードして Claude Code を起動
claude --plugin-dir ./

# デバッグモード（マニフェスト構文エラーやパス問題の確認）
claude --debug --plugin-dir ./
```

ビルドシステムは不要（宣言的プラグイン）。変更後は Claude Code を再起動して反映を確認する。

### バリデーション

```bash
# コンテンツ検証（フックが自動実行するものと同じ）
./scripts/validate-content.sh <file-path>

# AI-DLC プロジェクト状態検出
./scripts/detect-state.sh

# ステージ別アーティファクト存在チェック
./scripts/check-artifacts.sh <stage-name>
```

`validate-content.sh` は PostToolUse フック（`hooks/hooks.json`）で Write 操作後に自動実行される。Unicode 罫線文字の禁止、タブ文字の警告、Mermaid ブロックの閉じ忘れ検出を行う。

## プラグインアーキテクチャ

### コンポーネント構成

```
skills/（15スキル）─── SKILL.md が reference/ の詳細手順を参照
  ├── start, resume, status     ← エントリポイント（ワークフロー開始・再開・確認）
  ├── inception-*（6スキル）     ← Inception フェーズ（計画・設計）
  └── construction-*（6スキル）  ← Construction フェーズ（実装）

agents/aidlc-orchestrator.md  ← 読み取り専用のワークフローアドバイザー
hooks/hooks.json              ← Write 後のコンテンツ検証フック
reference/                    ← スキルから参照される詳細手順書（24ファイル）
  ├── common/（11）            ← 全フェーズ共通ルール
  ├── inception/（7）          ← Inception フェーズ手順
  └── construction/（6）       ← Construction フェーズ手順
templates/                    ← 状態管理・ドキュメントのテンプレート（4ファイル）
scripts/                      ← バリデーション・状態検出スクリプト（3ファイル）
```

### スキル実行フロー

1. `/aidlc:start` または `/aidlc:resume` でワークフロー開始
2. 各スキルが `aidlc-docs/aidlc-state.md`（単一の状態管理ファイル）を読み書き
3. Inception フェーズ: workspace-detection → (reverse-engineering) → requirements → (user-stories) → workflow-planning → (application-design) → (units-generation)
4. Construction フェーズ: 各 Unit に対して (functional-design) → (nfr-requirements) → (nfr-design) → (infrastructure-design) → code-generation、最後に build-and-test
5. 括弧付きステージは条件付き（workflow-planning で EXECUTE/SKIP を決定）

### スキル設計規約

- 全スキルは `disable-model-invocation: true`（手動呼び出しのみ）、`status` のみ例外
- `model: opus` が基本。`status` のみ `model: haiku` + `context: fork`（高速読み取り専用）
- スキル本体は手順の概要のみ記載し、詳細は `reference/` にリンク（500行以下制約）
- AI 主導の質問は `.md` ファイル経由（`[Answer]:` タグ形式）
- 二部構成スキル: Planning → 人間承認 → Generation の流れ
- 成果物はすべて `aidlc-docs/` ディレクトリに出力（コード生成のみワークスペースルート）

### マニフェスト（`.claude-plugin/plugin.json`）

プラグイン名は `aidlc`。スキルは `/aidlc:<skill-name>` で呼び出される。`${CLAUDE_PLUGIN_ROOT}` 変数がフックスクリプトのパス解決に使われる。

## AI-DLC の基本原則

スキル設計時にこれらの原則を維持すること:

1. **重複排除** — 単一の情報源; ツール固有ファイルはコア方法論から生成
2. **方法論ファースト** — プラットフォーム非依存
3. **再現性** — 異なる AI モデルでも同様の成果が得られる明確なルール
4. **非依存** — 特定の IDE・エージェント・モデルに依存しない
5. **Human in the loop** — エージェントが提案し、人間が承認する

## AI-DLC 方法論定義（Method Definition）

> 詳細は [docs/ai-dlc-method-definition.md](docs/ai-dlc-method-definition.md) を参照。

AI-DLC は従来の SDLC/Agile を「リイマジン（reimagine）」した AI ネイティブ開発手法である。プラグイン設計ではこの方法論の構造を忠実に反映すること。

### 10 の設計原則

| # | 原則 | プラグイン設計への含意 |
|:--|:-----|:----------------------|
| 1 | **Reimagine rather than Retrofit** | 既存手法の置き換えではなく、AI 前提で再設計 |
| 2 | **Reverse the Conversation Direction** | **AI が会話を主導**し、人間は承認者。スキルは AI 主導のワークフローを実装する |
| 3 | **Integration of Design Techniques** | DDD/BDD/TDD を方法論のコアに統合。スキルは設計技法を内包する |
| 4 | **Align with AI Capability** | AI の現状を考慮した Allotment パラダイム（AI 自律＋人間監督） |
| 5 | **Cater to Building Complex Systems** | 複数チーム・高アーキテクチャ複雑度を対象とする |
| 6 | **Retain What Enhances Human Symbiosis** | ユーザーストーリー、リスクレジスター等の人間協調成果物は保持 |
| 7 | **Facilitate Transition Through Familiarity** | 既存用語を意図的にリネーム（Sprint → Bolt 等）して学習コスト低減 |
| 8 | **Streamline Responsibilities** | AI による役割統合。細分化された専門職 → 少数のクロスファンクショナル役割 |
| 9 | **Minimise Stages, Maximise Flow** | フェーズ数を最小化しつつ、各段階に人間バリデーションを配置 |
| 10 | **No Hard-Wired Workflows** | 固定ワークフローを処方しない。AI が意図に基づき計画を生成する |

### コアアーティファクト

| アーティファクト | 説明 | 粒度 |
|:-----------------|:-----|:-----|
| **Intent** | 達成すべき高レベルの目的（新機能、改善、最適化等） | 最大 |
| **Unit** | 独立した価値を提供する自己完結型ワークパッケージ（Scrum の Epic / DDD の Subdomain に相当）。疎結合で並行開発可能 | 中 |
| **Bolt** | 最小イテレーション単位（Scrum の Sprint に相当）。時間〜日単位の高速サイクル。Unit の実装を段階的に進める | 最小 |

### 3 つのフェーズ

```
Intent ─→ [Inception] ─→ Units ─→ [Construction] ─→ Deployment Units ─→ [Operations]
              │                        │                                      │
         Mob Elaboration          Mob Programming                      AI 監視・提案
                                  Mob Testing                          人間承認・実行
```

#### 1. Inception Phase（計画・設計）
- **リチュアル**: Mob Elaboration — 全ステークホルダーが1部屋で AI と協調
- **AI の役割**: Intent を User Stories / NFR / Risk / Unit に分解し提案
- **人間の役割**: レビュー・承認・修正
- **成果物**: PRFAQ、User Stories、NFR 定義、Risk 記述、Unit 分割、Bolt 提案

#### 2. Construction Phase（実装）
- **リチュアル**: Mob Programming、Mob Testing
- **AI の役割**:
  - Domain Design — DDD 原則でビジネスロジックをモデリング
  - Logical Design — NFR を反映した論理設計（ADR 生成含む）
  - Code Generation — 実行可能コード生成
  - Test Generation — 機能・セキュリティ・パフォーマンステスト自動生成
- **人間の役割**: 各段階でのレビュー・承認・トレードオフ判断
- **成果物**: Domain Model、Logical Design、ADR、実行コード、テストスイート、Deployment Units

#### 3. Operations Phase（運用）
- **AI の役割**: テレメトリ分析、異常検知、SLA 違反予測、ランブック連携による修復提案
- **人間の役割**: 緩和策の承認・監視

### 開発パターン

| パターン | 特徴 |
|:---------|:-----|
| **Green-field** | 新規構築。Inception → Construction → Operations の全フェーズを実行 |
| **Brown-field** | 既存システムへの変更。Construction で AI が既存コードを高レベルモデル（静的・動的）にリバースエンジニアリングし、人間が検証後に Green-field と同様に進行 |

### ワークフローの再帰的分解

AI-DLC のワークフローは階層的・再帰的に動作する:

1. AI が Level 1 Plan（全体計画）を提案 → 人間が承認
2. Level 1 の各ステップを Level 2 に分解 → 人間が承認
3. 以降 Level N まで再帰的に分解・承認を繰り返す
4. 全アーティファクトはリンクされ、前後方向にトレーサビリティを維持

### プラグイン設計への重要な対応関係

| AI-DLC 概念 | プラグインでの実現手段 |
|:------------|:-----------------------|
| Mob Elaboration | Inception スキル（AI 主導の対話的要件分解） |
| Mob Programming | Construction スキル（段階的な設計→コード生成） |
| Mob Testing | テスト生成・実行スキル |
| Human validation | 各スキル内での承認ポイント（`disable-model-invocation: true`） |
| Artifact traceability | `aidlc-docs/` ディレクトリでの成果物管理 |
| Recursive decomposition | Plan モード + 階層的タスク分解 |
| AI-initiated conversation | スキルが AI 主導で質問・提案するワークフロー |

## Commit Conventions

Uses [Conventional Commits](https://www.conventionalcommits.org/): `feat:`, `fix:`, `doc:`, `perf:`, `refactor:`, `style:`, `test:`, `ci:`, `chore:`.

---

## Claude Code 技術リファレンス

プラグイン設計に必要な Claude Code の全機能を以下にまとめる。公式ドキュメント（https://code.claude.com/docs/）に基づく。

### 1. Skills（カスタムスラッシュコマンド）

スキルは Claude Code の中核的な拡張機能。SKILL.md ファイルで定義し、`/skill-name` で呼び出す。

#### ディレクトリ構成

```
<skill-name>/
├── SKILL.md           # 必須: YAML frontmatter + Markdown 指示
├── template.md        # 任意: Claude が埋めるテンプレート
├── examples/          # 任意: 出力例
└── scripts/           # 任意: ユーティリティスクリプト
```

#### 配置場所とスコープ

| スコープ | パス | 適用範囲 |
|:---------|:-----|:---------|
| Enterprise | Managed settings | 組織全体 |
| Personal | `~/.claude/skills/<name>/SKILL.md` | 全プロジェクト |
| Project | `.claude/skills/<name>/SKILL.md` | プロジェクト内 |
| Plugin | `<plugin>/skills/<name>/SKILL.md` | Plugin 有効時 |

優先順位: Enterprise > Personal > Project

#### SKILL.md frontmatter オプション

```yaml
---
name: my-skill                     # スラッシュコマンド名（小文字、数字、ハイフン。最大64文字）
description: スキルの説明           # Claude が自動呼び出しの判断に使用
argument-hint: [filename]           # 引数ヒント（オートコンプリート用）
disable-model-invocation: true      # true: 手動呼び出しのみ（副作用ありの操作に推奨）
user-invocable: false               # false: `/` メニュー非表示（バックグラウンド知識用）
allowed-tools: Read, Grep, Bash(bun run *)  # スキル実行中に許可するツール
model: opus                         # 使用モデル指定
context: fork                       # fork: 隔離されたサブエージェントで実行
agent: Explore                      # context: fork 時のエージェント種別
hooks:                               # スキルライフサイクル用フック
  PreToolUse:
    - matcher: "Bash"
      hooks:
        - type: command
          command: "./scripts/check.sh"
---
```

#### 変数置換

| 変数 | 説明 |
|:-----|:-----|
| `$ARGUMENTS` | 全引数 |
| `$ARGUMENTS[N]` / `$N` | N番目の引数（0始まり） |
| `${CLAUDE_SESSION_ID}` | セッションID |
| `` !`command` `` | シェルコマンド実行結果を注入 |

#### コンテキストタイプ

- **Reference Content**: ガイドラインや規約（自動的にコンテキストに含まれる）
- **Task Content**: ステップバイステップ手順（`disable-model-invocation: true` 推奨）

#### サブエージェント実行

`context: fork` でスキルを隔離実行可能。利用可能エージェント:
- `Explore` — 読み取り専用のコードベース探索
- `Plan` — 計画・分析ツール
- `general-purpose` — 全ツールアクセス（デフォルト）
- カスタムエージェント名（`.claude/agents/` から）

#### ベストプラクティス

- SKILL.md は500行以下に。詳細は別ファイル参照で `[reference.md](reference.md)` のようにリンク
- 副作用のあるスキルには `disable-model-invocation: true`
- バックグラウンド知識には `user-invocable: false`
- 引数は早期にバリデーション
- `ultrathink` をスキル内に記述すると拡張思考モード有効化

### 2. Hooks

フック: Claude Code のライフサイクルの特定ポイントで自動実行されるシェルコマンドまたは LLM プロンプト。

#### フックイベント一覧（14種）

**起動・セッション管理:**
- `SessionStart` — セッション開始/再開時
- `PreCompact` — コンテキスト圧縮前（matcher: `manual` / `auto`）
- `SessionEnd` — セッション終了時

**メインエージェントループ:**
- `UserPromptSubmit` — プロンプト送信時（処理前）
- `PreToolUse` — ツール実行前（ブロック可能）
- `PermissionRequest` — 権限ダイアログ表示時
- `PostToolUse` — ツール成功後
- `PostToolUseFailure` — ツール失敗後
- `Notification` — 通知送信時

**サブエージェント・チーム:**
- `SubagentStart` / `SubagentStop` — サブエージェント開始/終了
- `TeammateIdle` — チームメンバーアイドル時
- `TaskCompleted` — タスク完了時

**停止:**
- `Stop` — Claude 応答完了時

#### フックハンドラの3種類

1. **Command** (`type: "command"`): シェルコマンド実行。JSON stdin 入力、exit code で制御
2. **Prompt** (`type: "prompt"`): LLM（Haiku）による単一ターン判定。`{"ok": true/false, "reason": "..."}`
3. **Agent** (`type: "agent"`): ツール使用可能なサブエージェント。最大50ターン

#### Exit Code の意味

| Exit Code | 意味 | 動作 |
|:----------|:-----|:-----|
| 0 | 成功 | 処理続行。stdout の JSON 出力を処理 |
| 2 | ブロックエラー | アクションをブロック。stderr をフィードバック |
| その他 | 非ブロックエラー | 処理続行。stderr は verbose モードのみ表示 |

#### 設定場所

| 場所 | スコープ |
|:-----|:---------|
| `~/.claude/settings.json` | 全プロジェクト |
| `.claude/settings.json` | プロジェクト |
| `.claude/settings.local.json` | プロジェクト（gitignore） |
| Skill/Agent frontmatter | コンポーネント内 |
| Managed settings | 組織全体 |

#### 非同期フック

`"async": true` でバックグラウンド実行。Claude をブロックせずにテスト実行等が可能。結果は `systemMessage` フィールドで次ターンに配信。

### 3. MCP（Model Context Protocol）サーバー

外部データソース・ツール連携の標準プロトコル。

#### トランスポート

- **stdio**: ローカルプロセス
- **http**: リモートサーバー（OAuth 2.0 対応）

#### スコープ

| スコープ | 保存先 | 共有 |
|:---------|:-------|:-----|
| Local | `~/.claude.json` | 不可 |
| Project | `.mcp.json`（リポジトリルート） | 可（バージョン管理） |
| User | `~/.claude.json` | 不可（全プロジェクト） |

#### 主要コマンド

```bash
claude mcp add --transport http <name> <url>     # サーバー追加
claude mcp add --scope project <name> <url>       # プロジェクトスコープで追加
claude mcp list                                    # 一覧表示
claude mcp get <name>                              # 詳細表示
claude mcp serve                                   # Claude Code を MCP サーバーとして起動
/mcp                                               # インタラクティブ管理・OAuth 認証
```

#### MCP Tool Search

MCP ツール定義がコンテキストの10%超の場合、自動でオンデマンドロードに切替。`ENABLE_TOOL_SEARCH=auto:<N>` で閾値変更可。

#### 環境変数展開

`.mcp.json` で `${VAR}` / `${VAR:-default}` 構文をサポート（command, args, env, url, headers で使用可）。

### 4. Memory（CLAUDE.md）システム

#### メモリタイプと配置

| タイプ | 場所 | 用途 | 共有 |
|:-------|:-----|:-----|:-----|
| Managed policy | システムディレクトリ | 組織全体の指示 | 全ユーザー |
| Project memory | `./CLAUDE.md` or `./.claude/CLAUDE.md` | チーム共有 | VCS経由 |
| Project rules | `./.claude/rules/*.md` | モジュラールール | VCS経由 |
| User memory | `~/.claude/CLAUDE.md` | 個人設定 | 全プロジェクト |
| Project local | `./CLAUDE.local.md` | 個人プロジェクト固有 | 自分のみ |
| Auto memory | `~/.claude/projects/<project>/memory/` | 自動学習 | 自分のみ |

#### モジュラールール（`.claude/rules/`）

```
.claude/rules/
├── frontend/
│   ├── react.md
│   └── styles.md
├── backend/
│   ├── api.md
│   └── database.md
└── general.md
```

パス条件付きルール（YAML frontmatter）:
```yaml
---
paths:
  - "src/api/**/*.ts"
---
```

#### インポート構文

CLAUDE.md 内で `@path/to/file` で外部ファイルをインポート可能。最大深度5。

### 5. Settings（設定）

#### 設定ファイル階層（優先度順）

1. **Managed policy** — `managed-settings.json`（システムディレクトリ）またはサーバー管理設定
2. **Enterprise** — 管理者設定
3. **User** — `~/.claude/settings.json`
4. **Project** — `.claude/settings.json`
5. **Project local** — `.claude/settings.local.json`

#### 主要設定項目

- `permissions.allow` / `permissions.deny` — ツール許可/拒否リスト
- `permissions.defaultMode` — デフォルトモード（`default`, `plan`, `acceptEdits`, `bypassPermissions`）
- `model` — デフォルトモデル
- `effortLevel` — Opus 4.6 の適応的推論レベル（`low`, `medium`, `high`）
- `hooks` — フック設定
- `env` — 環境変数
- `sandbox` — サンドボックス設定（`enabled`, `autoAllowBashIfSandboxed`, `network.allowedDomains` 等）
- `attribution.commit` / `attribution.pr` — Git コミット/PR の帰属表記
- `availableModels` — 使用可能モデルの制限リスト

### 6. サブエージェント

タスクを専門エージェントに委譲するシステム。

#### 組み込みエージェントタイプ

- **Bash** — コマンド実行
- **Explore** — コードベース探索（読み取り専用）
- **Plan** — 計画・分析
- **general-purpose** — 汎用（全ツール利用可）

#### カスタムエージェント

`.claude/agents/<name>.md` で定義。SKILL.md と同様の frontmatter。`/agents` コマンドで管理。

#### Agent Teams（実験的機能）

複数の Claude Code インスタンスが協調作業。`CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1` で有効化。

### 7. CLI リファレンス

#### 主要フラグ

```bash
claude                             # インタラクティブ REPL 起動
claude -p "prompt"                 # 非インタラクティブ（ヘッドレス）モード
claude --model opus                # モデル指定
claude --permission-mode plan      # Plan モードで起動
claude --continue                  # 直近の会話を継続
claude --resume [name]             # 名前付きセッション再開
claude --from-pr 123              # PR リンクセッション再開
claude --add-dir ../other-repo     # 追加ディレクトリ
claude --output-format json        # 出力形式（text/json/stream-json）
claude --max-turns 5               # 最大ターン数
claude --mcp-config path           # MCP 設定ファイル
claude --allowed-tools "Read,Grep" # 許可ツール
claude --debug                     # デバッグモード
claude --remote "task"             # リモート（Web）実行
claude --teleport [session-id]     # リモートセッション取得
claude --fork-session              # セッションフォーク
```

#### 組み込みコマンド（主要）

| コマンド | 説明 |
|:---------|:-----|
| `/clear` | 会話履歴クリア |
| `/compact [instructions]` | コンテキスト圧縮（カスタム指示付き） |
| `/config` | 設定 UI |
| `/context` | コンテキスト使用量の可視化 |
| `/cost` | トークン使用統計 |
| `/init` | CLAUDE.md 初期化 |
| `/memory` | メモリファイル編集 |
| `/model` | モデル選択/変更 |
| `/permissions` | 権限設定表示/更新 |
| `/plan` | Plan モード開始 |
| `/resume [session]` | セッション再開 |
| `/rename <name>` | セッション名変更 |
| `/rewind` | 会話/コード巻き戻し |
| `/tasks` | バックグラウンドタスク管理 |
| `/teleport` | リモートセッション取得 |
| `/desktop` | Desktop アプリへハンドオフ |
| `/vim` | Vim エディタモード切替 |
| `/hooks` | フック管理 |
| `/mcp` | MCP サーバー管理 |
| `/agents` | エージェント管理 |
| `/stats` | 使用統計・ストリーク |

### 8. キーボードショートカット

#### ターミナル操作

| ショートカット | 動作 |
|:---------------|:-----|
| `Ctrl+C` | 入力/生成キャンセル |
| `Ctrl+D` | セッション終了 |
| `Ctrl+G` | テキストエディタでプロンプト編集 |
| `Ctrl+L` | 画面クリア |
| `Ctrl+O` | verbose 出力トグル |
| `Ctrl+R` | コマンド履歴逆検索 |
| `Ctrl+B` | タスクバックグラウンド化 |
| `Ctrl+T` | タスクリストトグル |
| `Shift+Tab` / `Alt+M` | 権限モード切替 |
| `Option+P` / `Alt+P` | モデル切替 |
| `Option+T` / `Alt+T` | 拡張思考トグル |
| `Esc+Esc` | 巻き戻し/要約 |
| `\` + `Enter` | 改行（全ターミナル） |
| `Option+Enter` | 改行（macOS） |
| `Shift+Enter` | 改行（iTerm2, WezTerm, Ghostty, Kitty） |

#### VS Code ショートカット

| ショートカット | 動作 |
|:---------------|:-----|
| `Cmd+Esc` / `Ctrl+Esc` | エディタ/Claude 間フォーカス切替 |
| `Cmd+Shift+Esc` / `Ctrl+Shift+Esc` | 新しい会話タブ |
| `Cmd+N` / `Ctrl+N` | 新規会話 |
| `Option+K` / `Alt+K` | @mention 挿入 |

### 9. モデル設定

#### モデルエイリアス

| エイリアス | 動作 |
|:-----------|:-----|
| `default` | アカウントタイプに依存（Max/Team → Opus, Pro → Sonnet） |
| `sonnet` | 最新 Sonnet（日常コーディング向け） |
| `opus` | 最新 Opus（複雑な推論向け） |
| `haiku` | 高速・効率モデル（単純タスク向け） |
| `sonnet[1m]` | Sonnet + 100万トークンコンテキスト |
| `opusplan` | Plan モードで Opus、実行で Sonnet に自動切替 |

#### 適応的推論（Opus 4.6）

`effortLevel` 設定で推論の深さを制御: `low`, `medium`, `high`（デフォルト）。`/model` で左右矢印キーで調整可。

#### 環境変数

| 変数 | 説明 |
|:-----|:-----|
| `ANTHROPIC_MODEL` | デフォルトモデル |
| `ANTHROPIC_DEFAULT_OPUS_MODEL` | opus エイリアスのモデル名 |
| `ANTHROPIC_DEFAULT_SONNET_MODEL` | sonnet エイリアスのモデル名 |
| `ANTHROPIC_DEFAULT_HAIKU_MODEL` | haiku エイリアスのモデル名 |
| `CLAUDE_CODE_SUBAGENT_MODEL` | サブエージェント用モデル |
| `CLAUDE_CODE_EFFORT_LEVEL` | 適応的推論レベル |
| `MAX_THINKING_TOKENS` | 拡張思考トークン上限（0で無効化） |

### 10. サンドボックス

OS レベルのファイルシステム・ネットワーク隔離。

- **macOS**: Seatbelt フレームワーク
- **Linux/WSL2**: bubblewrap + socat
- `/sandbox` コマンドで有効化
- **Auto-allow モード**: サンドボックス内コマンドは自動承認
- `sandbox.network.allowedDomains` でネットワークアクセス制御
- `sandbox.excludedCommands` でサンドボックス除外コマンド指定

### 11. Plugins（本プロジェクトの主要成果物）

プラグインは Claude Code を拡張する自己完結型ディレクトリ。スキル、エージェント、フック、MCP サーバー、LSP 設定をパッケージ化して配布できる。

#### プラグインディレクトリ構成

最小構成:
```
my-plugin/
├── .claude-plugin/
│   └── plugin.json        # 必須: マニフェスト
└── skills/
    └── hello/
        └── SKILL.md
```

完全構成:
```
my-plugin/
├── .claude-plugin/
│   └── plugin.json        # マニフェスト
├── skills/                # スキル（SKILL.md 形式）
│   └── <name>/
│       └── SKILL.md
├── commands/              # コマンド（単一 .md 形式）
│   └── <name>.md
├── agents/                # カスタムエージェント
│   └── <name>.md
├── hooks/                 # フック設定
│   └── hooks.json
├── .mcp.json              # MCP サーバー定義
├── .lsp.json              # LSP サーバー設定
├── scripts/               # ユーティリティスクリプト
├── LICENSE
└── CHANGELOG.md
```

**重要**: `.claude-plugin/` 内には `plugin.json` のみ配置。コンポーネントはプラグインルート直下に配置する。

#### マニフェスト（`.claude-plugin/plugin.json`）

```json
{
  "name": "plugin-name",                    // 必須: kebab-case、最大64文字
  "version": "1.2.0",                       // セマンティックバージョニング
  "description": "Brief plugin description",
  "author": {
    "name": "Author Name",
    "email": "author@example.com",
    "url": "https://github.com/author"
  },
  "homepage": "https://docs.example.com/plugin",
  "repository": "https://github.com/author/plugin",
  "license": "MIT",
  "keywords": ["keyword1", "keyword2"],
  "commands": ["./commands/"],
  "agents": "./agents/",
  "skills": "./skills/",
  "hooks": "./hooks/hooks.json",
  "mcpServers": "./.mcp.json",
  "lspServers": "./.lsp.json",
  "outputStyles": "./styles/"
}
```

マニフェスト内で `${CLAUDE_PLUGIN_ROOT}` 変数を使用可能。インストール後に絶対パスへ自動展開される。

#### スキル名の違い

| 配置場所 | 呼び出し方 |
|:---------|:-----------|
| `.claude/skills/hello/SKILL.md` | `/hello` |
| `my-plugin/skills/hello/SKILL.md` | `/my-plugin:hello` |

#### プラグインのインストール・管理

```bash
# CLI
claude plugin install <plugin> --scope user|project|local
claude plugin uninstall <plugin>
claude plugin enable <plugin>
claude plugin disable <plugin>
claude plugin update <plugin>

# インタラクティブ
/plugin                            # プラグイン管理 UI
/plugin install plugin-name
```

スコープ:

| スコープ | 設定ファイル | 対象 |
|:---------|:-------------|:-----|
| `user` | `~/.claude/settings.json` | 全プロジェクト（デフォルト） |
| `project` | `.claude/settings.json` | 当該プロジェクトのみ（VCS管理） |
| `local` | `.claude/settings.local.json` | 当該プロジェクトのみ（gitignore） |

設定ファイルでの有効化:
```json
{
  "enabledPlugins": {
    "plugin-name@marketplace-name": true
  },
  "extraKnownMarketplaces": {
    "marketplace-name": {
      "source": {
        "source": "github",
        "repo": "your-org/claude-plugins"
      }
    }
  }
}
```

#### ローカル開発・テスト

```bash
claude --plugin-dir ./my-plugin    # ローカルパスから直接ロード
```

キャッシュ: インストール後 `~/.claude/plugins/cache` にコピーされる。コード変更後はバージョンを更新すること。

#### マーケットプレース配布

`.claude-plugin/marketplace.json` でカタログ化:
```json
{
  "name": "my-plugins",
  "owner": { "name": "Your Name" },
  "plugins": [
    {
      "name": "review-plugin",
      "source": "./plugins/review-plugin",
      "description": "Adds a /review skill for quick code reviews"
    }
  ]
}
```

ソース種類: 相対パス、GitHub（`"source": "github", "repo": "owner/repo"`）、Git URL、npm、pip

#### プラグイン vs スタンドアロンスキル

| 項目 | スタンドアロン | プラグイン |
|:-----|:---------------|:-----------|
| 共有手段 | ファイルコピー | マーケットプレース経由 |
| バージョン管理 | 手動 | 自動（セマンティック） |
| 配布性 | 低 | 高 |
| 更新 | なし | `/plugin update` |
| スコープ管理 | 不可 | user/project/local |
| 含められるもの | スキルのみ | スキル+エージェント+フック+MCP+LSP |

#### ベストプラクティス

- SKILL.md は500行以下。詳細は別ファイルにリンク
- ファイル参照には `${CLAUDE_PLUGIN_ROOT}` を使用
- パスは相対パス（`./` で開始）。プラグイン外の参照は不可
- フックスクリプトは `chmod +x` + シェバン行
- 副作用ありスキルには `disable-model-invocation: true`
- デバッグ: `claude --debug` でマニフェスト構文エラーやパス問題を確認

### 12. IDE 統合

#### VS Code

- 拡張機能でインライン diff、@-mention、Plan レビュー、会話履歴
- Spark アイコン（エディタツールバー）/ ステータスバーからアクセス
- `initialPermissionMode` で起動時モード設定
- ドラッグ&ドロップでファイル添付（Shift 押しながら）

#### JetBrains

- IntelliJ IDEA, PyCharm, WebStorm 等対応
- `Cmd+Esc` / `Ctrl+Esc` でクイック起動
- IDE の diff ビューアで変更表示
- 選択テキスト・診断情報を自動共有

#### Desktop アプリ

- ローカル / リモート / SSH セッション
- Git worktree による自動セッション分離
- Permission モード: Ask, Code, Plan, Act
- Diff ビュー付き PR レビュー
- Connectors（Google Calendar, Slack, GitHub, Linear, Notion）

#### Web（claude.ai/code）

- Anthropic クラウド上で非同期実行
- GitHub 連携で PR 作成
- ターミナルから `& task` または `claude --remote "task"` で送信
- `/teleport` でローカルに取得

### 13. GitHub Actions / CI/CD

```bash
claude /install-github-app         # GitHub App インストール
```

- **トリガー**: PR コメント、Issue コメント、PR レビュー、Push
- `@claude` メンションまたは `/claude` コマンドで起動
- `claude_args` で CLI 引数渡し（`--max-turns`, `--model` 等）
- CLAUDE.md でコーディング規約・レビュー基準を設定可能

### 14. コスト管理

- 平均コスト: 開発者1人あたり約$6/日
- `/cost` でトークン使用統計（API ユーザー向け）
- `/stats` で使用パターン確認（サブスクリプションユーザー向け）
- **コスト削減策**: `/compact` でコンテキスト圧縮、適切なモデル選択、MCP サーバー整理、スキルへの指示移動、サブエージェントへの委譲
- `SLASH_COMMAND_TOOL_CHAR_BUDGET` でスキル説明のコンテキスト予算調整
