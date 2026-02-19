# AI-DLC Plugin for Claude Code

[日本語](README.ja.md)

An implementation of [AI-DLC (AI-Driven Development Life Cycle)](https://aws.amazon.com/blogs/devops/ai-driven-development-life-cycle/) as a [Claude Code](https://claude.ai/code) plugin. Packages an adaptive software development workflow as skills, agents, and hooks.

## Installation

### Local development (recommended)

```bash
git clone https://github.com/yamatatsu/claude-aidlc.git
claude --plugin-dir ./claude-aidlc
```

## Usage

### Starting a workflow

After enabling the plugin, run in chat:

```
/aidlc:start
```

AI-DLC analyzes the workspace, initializes state files, and guides you to the next step.

### Basic flow

1. `/aidlc:start` to begin a project
2. At each stage, AI generates question files (`.md`) -- you fill in the answers
3. AI generates artifacts -- you review and approve
4. After approval, proceed to the next stage

Use `/aidlc:resume` to continue after a session break, and `/aidlc:status` to check progress at any time.

## Skills

### Entry points

| Command         | Description                                                       |
| :-------------- | :---------------------------------------------------------------- |
| `/aidlc:start`  | Start a new workflow (workspace detection + state initialization) |
| `/aidlc:resume` | Resume from a previous session                                    |
| `/aidlc:status` | Display current progress (read-only)                              |

### Inception phase (planning & design)

| Command                                | Condition       | Description                                    |
| :------------------------------------- | :-------------- | :--------------------------------------------- |
| `/aidlc:inception-reverse-engineering` | Brownfield only | Analyze existing codebase                      |
| `/aidlc:inception-requirements`        | Always          | Requirements analysis and question generation  |
| `/aidlc:inception-user-stories`        | Conditional     | User story creation                            |
| `/aidlc:inception-workflow-planning`   | Always          | Create execution plan (EXECUTE/SKIP per stage) |
| `/aidlc:inception-application-design`  | Conditional     | Application design                             |
| `/aidlc:inception-units-generation`    | Conditional     | Decompose into units of work                   |

### Construction phase (implementation)

| Command                                            | Argument  | Description                                        |
| :------------------------------------------------- | :-------- | :------------------------------------------------- |
| `/aidlc:construction-functional-design [unit]`     | Unit name | Business logic design                              |
| `/aidlc:construction-nfr-requirements [unit]`      | Unit name | NFR assessment + tech stack selection              |
| `/aidlc:construction-nfr-design [unit]`            | Unit name | NFR pattern design                                 |
| `/aidlc:construction-infrastructure-design [unit]` | Unit name | Infrastructure design                              |
| `/aidlc:construction-code-generation [unit]`       | Unit name | Code generation (2-part: planning then generation) |
| `/aidlc:construction-build-and-test`               | None      | Build & test across all units                      |

## Agent

| Agent                | Description                                                                 |
| :------------------- | :-------------------------------------------------------------------------- |
| `aidlc-orchestrator` | Workflow advisor. Reads current state and suggests next actions (read-only) |

## Project structure

```
.claude-plugin/
  plugin.json              # Plugin manifest

skills/                    # 15 skills
  start/SKILL.md
  resume/SKILL.md
  status/SKILL.md
  inception-*/SKILL.md     # 6 Inception skills
  construction-*/SKILL.md  # 6 Construction skills

agents/
  aidlc-orchestrator.md    # Workflow advisor

hooks/
  hooks.json               # Content validation hook

reference/                 # Detailed references (24 files)
  common/                  # Common rules (11 files)
  inception/               # Inception procedures (7 files)
  construction/            # Construction procedures (6 files)

templates/                 # State, audit log templates
scripts/                   # Utility scripts
```

## Generated artifacts

During workflow execution, an `aidlc-docs/` directory is created in the user's project root:

```
aidlc-docs/
  aidlc-state.md           # Project state (single source of truth)
  audit.md                 # Audit log of all interactions
  inception/               # Inception phase artifacts
    plans/
    requirements/
    user-stories/
    ...
  construction/            # Construction phase artifacts
    plans/
    [unit-name]/
    build-and-test/
```

## Design principles

- **Human in the loop** -- AI proposes, humans approve. Approval gates at every stage
- **Adaptive workflow** -- Stages are automatically selected (EXECUTE/SKIP) based on project complexity
- **AI-initiated dialogue** -- AI writes questions to `.md` files; users fill in answers
- **Single source of truth** -- `aidlc-state.md` tracks progress across all phases
- **Reproducibility** -- Clear rules ensure consistent results across sessions and models

## Acknowledgements

This project is based on [AI-DLC (AI-Driven Development Life Cycle)](https://aws.amazon.com/blogs/devops/ai-driven-development-life-cycle/) by AWS. The original rule set is available at [awslabs/aidlc-workflows](https://github.com/awslabs/aidlc-workflows) under MIT-0 license.

## License

MIT-0. See [LICENSE](LICENSE).
