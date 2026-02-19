# AI-DLC Plugin for Claude Code

[English](README.md)

AI-DLC (AI-Driven Development Life Cycle) を [Claude Code](https://claude.ai/code) のプラグインとして実装したものです。適応的なソフトウェア開発ワークフローを、スキル・エージェント・フックとしてパッケージ化しています。

## インストール

### ローカル開発（推奨）

```bash
git clone https://github.com/yamatatsu/claude-aidlc.git
claude --plugin-dir ./claude-aidlc
```

## 使い方

### ワークフローの開始

プラグイン有効化後、チャットで以下を実行します:

```
/aidlc:start
```

AI-DLC がワークスペースを分析し、状態ファイルを初期化して次のステップを案内します。

### 基本的な流れ

1. `/aidlc:start` でプロジェクトを開始
2. 各ステージで AI が質問ファイル（`.md`）を生成 → ユーザーが回答を記入
3. AI が成果物を生成 → ユーザーがレビュー・承認
4. 承認後、次のステージへ進む

セッション中断後は `/aidlc:resume` で再開、`/aidlc:status` でいつでも進捗を確認できます。

## スキル一覧

### エントリポイント

| コマンド        | 説明                                                    |
| :-------------- | :------------------------------------------------------ |
| `/aidlc:start`  | 新規ワークフロー開始（ワークスペース検出 + 状態初期化） |
| `/aidlc:resume` | 前回のセッションから再開                                |
| `/aidlc:status` | 現在の進捗を表示（読み取り専用）                        |

### Inception フェーズ（計画・設計）

| コマンド                               | 実行条件        | 説明                                           |
| :------------------------------------- | :-------------- | :--------------------------------------------- |
| `/aidlc:inception-reverse-engineering` | Brownfield のみ | 既存コードベースの分析                         |
| `/aidlc:inception-requirements`        | 常に実行        | 要件分析と質問生成                             |
| `/aidlc:inception-user-stories`        | 条件付き        | ユーザーストーリー作成                         |
| `/aidlc:inception-workflow-planning`   | 常に実行        | 実行計画の策定（ステージの EXECUTE/SKIP 決定） |
| `/aidlc:inception-application-design`  | 条件付き        | アプリケーション設計                           |
| `/aidlc:inception-units-generation`    | 条件付き        | ユニット分割                                   |

### Construction フェーズ（実装）

| コマンド                                           | 引数       | 説明                               |
| :------------------------------------------------- | :--------- | :--------------------------------- |
| `/aidlc:construction-functional-design [unit]`     | ユニット名 | ビジネスロジック設計               |
| `/aidlc:construction-nfr-requirements [unit]`      | ユニット名 | NFR 要件評価 + 技術スタック選定    |
| `/aidlc:construction-nfr-design [unit]`            | ユニット名 | NFR パターン設計                   |
| `/aidlc:construction-infrastructure-design [unit]` | ユニット名 | インフラストラクチャ設計           |
| `/aidlc:construction-code-generation [unit]`       | ユニット名 | コード生成（計画 → 実装の2パート） |
| `/aidlc:construction-build-and-test`               | なし       | 全ユニット横断のビルド・テスト     |

## エージェント

| エージェント         | 説明                                                                                 |
| :------------------- | :----------------------------------------------------------------------------------- |
| `aidlc-orchestrator` | ワークフローアドバイザー。現在の状態を読み取り、次のアクションを提案（読み取り専用） |

## プロジェクト構成

```
.claude-plugin/
  plugin.json              # プラグインマニフェスト

skills/                    # 15 スキル
  start/SKILL.md
  resume/SKILL.md
  status/SKILL.md
  inception-*/SKILL.md     # 6 Inception スキル
  construction-*/SKILL.md  # 6 Construction スキル

agents/
  aidlc-orchestrator.md    # ワークフローアドバイザー

hooks/
  hooks.json               # コンテンツ検証フック

reference/                 # 詳細リファレンス（24 ファイル）
  common/                  # 共通ルール（11 ファイル）
  inception/               # Inception 詳細手順（7 ファイル）
  construction/            # Construction 詳細手順（6 ファイル）

templates/                 # 状態・監査ログ等のテンプレート
scripts/                   # ユーティリティスクリプト
```

## 生成される成果物

ワークフロー実行時、ユーザーのプロジェクトルートに `aidlc-docs/` ディレクトリが作成されます:

```
aidlc-docs/
  aidlc-state.md           # プロジェクト状態（唯一の真実の源）
  audit.md                 # 全インタラクションの監査ログ
  inception/               # Inception フェーズの成果物
    plans/
    requirements/
    user-stories/
    ...
  construction/            # Construction フェーズの成果物
    plans/
    [unit-name]/
    build-and-test/
```

## 設計原則

- **Human in the loop** -- AI が提案し、人間が承認する。全ステージに承認ゲート
- **適応的ワークフロー** -- プロジェクトの複雑度に応じてステージを自動選択（EXECUTE/SKIP）
- **AI 主導の対話** -- AI が質問を `.md` ファイルに書き出し、ユーザーが回答を記入
- **単一の真実の源** -- `aidlc-state.md` で全フェーズの進捗を一元管理
- **再現性** -- 明確なルールにより、異なるセッション・モデルでも一貫した結果

## Acknowledgements

本プロジェクトは AWS による [AI-DLC (AI-Driven Development Life Cycle)](https://aws.amazon.com/blogs/devops/ai-driven-development-life-cycle/) に基づいています。オリジナルのルールセットは [awslabs/aidlc-workflows](https://github.com/awslabs/aidlc-workflows) で MIT-0 ライセンスのもと公開されています。

## License

MIT-0. See [LICENSE](LICENSE).
