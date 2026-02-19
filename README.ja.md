# AI-DLC Plugin for Claude Code

[English](README.md)

AI-DLC (AI-Driven Development Life Cycle) を [Claude Code](https://claude.ai/code) のプラグインとして実装したものです。適応的なソフトウェア開発ワークフローを、スキル・エージェント・フックとしてパッケージ化しています。

## インストール

### マーケットプレイスからインストール（推奨）

Claude Code の REPL 内で以下を実行します:

```
# 1. マーケットプレイスを登録
/plugin marketplace add yamatatsu/claude-aidlc

# 2. プラグインをインストール
/plugin install aidlc@yamatatsu-aidlc
```

### ローカル開発

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

### コマンド詳細

#### `/aidlc:start` — 新規ワークフロー開始

ワークスペースを分析し、プロジェクトの種類（greenfield / brownfield）を自動判定して AI-DLC の状態管理を初期化する。

- **ワークスペース検出**: 既存コード・ビルドファイルの有無からプロジェクト種類を判定
- **初期化**: `aidlc-docs/` ディレクトリ、`aidlc-state.md`（状態管理）、`audit.md`（監査ログ）を作成
- **次のステップ案内**: brownfield なら reverse-engineering、greenfield なら requirements へ誘導

既に `aidlc-state.md` が存在する場合は `/aidlc:resume` を案内して終了する。

#### `/aidlc:resume` — セッション再開

中断したワークフローを最後の完了ステージから再開する。

- **スマートコンテキスト読み込み**: 現在のステージに応じて必要な成果物のみをロードし、トークン消費を抑制
- **状態サマリー表示**: プロジェクト種類、現在のフェーズ/ステージ、最後の完了マイルストーンを表示
- **次のアクション提示**: 続行またはこれまでの成果物レビューの選択肢を提示

#### `/aidlc:status` — 進捗確認

現在のプロジェクト進捗を読み取り専用で表示する。ファイルの変更は一切行わない。

- 高速実行（Haiku モデル、隔離された Explore エージェントで動作）
- Inception / Construction 各フェーズのチェックリスト形式で進捗を表示
- 生成済み成果物の一覧を表示

---

#### `/aidlc:inception-reverse-engineering` — 既存コードベース分析

brownfield プロジェクトで既存コードベースを包括的に分析し、技術ドキュメントを生成する。

- **対象**: brownfield のみ（greenfield の場合はスキップ）
- **分析内容**: パッケージ構成、アーキテクチャ、API、コンポーネント、技術スタック、依存関係、コード品質
- **生成される成果物**（9ファイル）: `business-overview.md`, `architecture.md`, `code-structure.md`, `api-documentation.md`, `component-inventory.md`, `technology-stack.md`, `dependencies.md`, `code-quality-assessment.md`, `reverse-engineering-timestamp.md`
- ユーザー承認後、requirements ステージへ進む

#### `/aidlc:inception-requirements` — 要件分析

ユーザーの Intent（目的）を機能要件・非機能要件に分解する。プロジェクト複雑度に応じて質問の深さを自動調整する。

- **3フェーズ実行**:
  1. **分析**: コンテキスト読み込み、適応的深度の決定（minimal / standard / comprehensive）
  2. **質問**: 8カテゴリ以上の質問を `.md` ファイルに生成 → ユーザーが `[Answer]:` タグに回答を記入
  3. **ドキュメント生成**: 回答を統合して `requirements.md` を生成
- **生成される成果物**: `requirement-verification-questions.md`, `requirements.md`
- 矛盾する回答を検出した場合はフォローアップ質問で解消

#### `/aidlc:inception-user-stories` — ユーザーストーリー作成

要件をユーザー視点のストーリーとペルソナに変換する。二部構成（計画 → 承認 → 生成）。

- **事前評価**: ユーザーストーリーが価値を持つか判定（リファクタリングやバグ修正のみの場合はスキップを提案し、判定理由を `user-stories-assessment.md` に記録）
- **Part 1（計画）**: ストーリー生成計画を作成し、ユーザーの明示的な承認を取得
- **Part 2（生成）**: 承認された計画に従いストーリーとペルソナを生成。INVEST 基準（Independent, Negotiable, Valuable, Estimable, Small, Testable）に準拠
- **生成される成果物**: `user-stories-assessment.md`, `story-generation-plan.md`, `stories.md`, `personas.md`

#### `/aidlc:inception-workflow-planning` — 実行計画策定

スコープ・影響度・リスクを分析し、後続ステージの EXECUTE / SKIP を決定する。常に実行される。

- **分析内容**: 変換スコープ、変更影響分析、リスク評価、コンポーネント間関係（brownfield の場合）
- **条件付きステージの評価対象**: application-design, units-generation, functional-design, nfr-requirements, nfr-design, infrastructure-design
- **Mermaid フローチャート**: 実行計画をビジュアルに表現
- **生成される成果物**: `execution-plan.md`（ステージごとの EXECUTE/SKIP 理由付き）、更新された `aidlc-state.md`
- ユーザーは任意のステージの EXECUTE/SKIP 判定をオーバーライド可能

#### `/aidlc:inception-application-design` — アプリケーション設計

高レベルのコンポーネント構成とサービスレイヤーを設計する。技術非依存。

- **前提条件**: execution-plan で EXECUTE と判定されていること
- **設計範囲**: コンポーネントの識別と責務定義、サービスレイヤー設計、依存関係マッピング（詳細なビジネスロジックは functional-design に委譲）
- **質問**: 設計判断やコンポーネント境界についての質問を `.md` ファイルで提示
- **生成される成果物**: `components.md`, `component-methods.md`, `services.md`, `component-dependency.md`

#### `/aidlc:inception-units-generation` — ユニット分割

システムを独立して開発可能なユニット（作業単位）に分割する。二部構成（計画 → 承認 → 生成）。

- **前提条件**: application-design 完了かつ EXECUTE 判定
- **ユニットの定義**: ストーリーの論理的グループ。マイクロサービスではサービス単位、モノリスでは論理モジュール単位
- **Part 1（計画）**: 分割計画と質問を作成し、ユーザー承認を取得
- **Part 2（生成）**: 承認された計画に従いユニット定義を生成。全ストーリーがいずれかのユニットに割り当てられていることを検証
- **生成される成果物**: `unit-of-work.md`, `unit-of-work-dependency.md`, `unit-of-work-story-map.md`、greenfield の場合はコード構成戦略も出力

---

#### `/aidlc:construction-functional-design [unit]` — ビジネスロジック設計

指定ユニットのビジネスロジック・ドメインモデル・ビジネスルールを詳細設計する。技術非依存。

- **引数**: ユニット名（必須）
- **ユニットごとに実行**: 各ユニットに対して繰り返し呼び出す
- **質問カテゴリ**: ビジネスロジック、ドメインモデル、ビジネスルール、データフロー、統合、エラー処理、フロントエンド
- **生成される成果物**: `business-logic-model.md`, `business-rules.md`, `domain-entities.md`, `frontend-components.md`（該当する場合）
- 曖昧な点がある場合は必ず質問でフォローアップ

#### `/aidlc:construction-nfr-requirements [unit]` — NFR 要件評価

指定ユニットの非機能要件を評価し、技術スタックを選定する。

- **引数**: ユニット名（必須）
- **評価カテゴリ**（8項目）: スケーラビリティ、パフォーマンス、可用性、セキュリティ、信頼性、保守性、ユーザビリティ、技術スタック
- **生成される成果物**: `nfr-requirements.md`, `tech-stack-decisions.md`（選定理由付き）
- 曖昧な表現（「標準的」「一般的」「場合による」）を検出した場合は具体化を求める質問を生成

#### `/aidlc:construction-nfr-design [unit]` — NFR パターン設計

NFR 要件をデザインパターンと論理コンポーネントに落とし込む。

- **引数**: ユニット名（必須）
- **設計対象**: レジリエンス、スケーラビリティ、パフォーマンス、セキュリティのパターン選定
- **論理コンポーネント**: キュー、キャッシュ、ロードバランサー等の抽象コンポーネントを定義（具体的なインフラへのマッピングは infrastructure-design で実施）
- **生成される成果物**: `nfr-design-patterns.md`, `logical-components.md`

#### `/aidlc:construction-infrastructure-design [unit]` — インフラストラクチャ設計

論理コンポーネントを実際のインフラサービスにマッピングする。

- **引数**: ユニット名（必須）
- **設計対象**: コンピュート、ストレージ、メッセージング、ネットワーキング、モニタリング
- **生成される成果物**: `infrastructure-design.md`, `deployment-architecture.md`, `shared-infrastructure.md`（ユニット横断リソースがある場合）
- 論理設計（nfr-design）から物理インフラへの橋渡しを行う

#### `/aidlc:construction-code-generation [unit]` — コード生成

指定ユニットの実行可能コード、テスト、デプロイ設定を生成する。二部構成（計画 → 承認 → 生成）。

- **引数**: ユニット名（必須）
- **常に実行**: 全ユニットに対して必ず実行される
- **コード配置ルール**:
  - brownfield: 既存構造に従う
  - greenfield（単一ユニット）: `src/`, `tests/`, `config/`
  - greenfield（マイクロサービス）: `{unit}/src/`
  - greenfield（モノリス）: `src/{unit}/`
- **Part 1（計画）**: コード生成計画をチェックボックス付きで作成し、ユーザー承認を取得
- **Part 2（生成）**: 承認された計画に厳密に従いコードを生成。各ステップ完了時にチェックボックスを即時マーク
- **重要**: アプリケーションコードはワークスペースルートに出力（`aidlc-docs/` には配置しない）。brownfield ではファイルのコピーを作らず直接編集

#### `/aidlc:construction-build-and-test` — ビルド・テスト

全ユニットのコード生成完了後に一度だけ実行し、包括的なビルド・テスト手順書を生成する。

- **引数なし**: 全ユニット横断で実行
- **前提条件**: 全ユニットの code-generation が完了していること
- **テスト戦略の判定**: プロジェクト複雑度と NFR 要件に基づき、必要なテスト種別を自動選定
- **生成される成果物**:
  - 必須: `build-instructions.md`, `unit-test-instructions.md`, `integration-test-instructions.md`
  - 条件付き: `performance-test-instructions.md`, `contract-test-instructions.md`, `security-test-instructions.md`, `e2e-test-instructions.md`
  - サマリー: `build-and-test-summary.md`
- Construction フェーズの最終ステージ。完了後は Operations フェーズへ移行

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
