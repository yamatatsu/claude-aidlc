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

### Command details

#### `/aidlc:start` — Start new workflow

Analyzes the workspace, auto-detects the project type (greenfield / brownfield), and initializes AI-DLC state management.

- **Workspace detection**: Determines project type from existing code and build files
- **Initialization**: Creates `aidlc-docs/` directory, `aidlc-state.md` (state tracking), and `audit.md` (audit log)
- **Next step guidance**: Routes to reverse-engineering for brownfield, requirements for greenfield

If `aidlc-state.md` already exists, suggests `/aidlc:resume` instead.

#### `/aidlc:resume` — Resume from previous session

Resumes a paused workflow from the last completed stage.

- **Smart context loading**: Loads only artifacts relevant to the current stage to minimize token usage
- **Status summary**: Shows project type, current phase/stage, and last completed milestone
- **Next action options**: Offers to continue or review previous artifacts

#### `/aidlc:status` — Display progress

Read-only view of current project progress. No files are modified.

- Fast execution (Haiku model, isolated Explore agent)
- Displays progress as checklists for Inception and Construction phases
- Lists all generated artifacts

---

#### `/aidlc:inception-reverse-engineering` — Analyze existing codebase

Comprehensively analyzes a brownfield codebase and generates technical documentation.

- **Scope**: Brownfield only (skipped for greenfield)
- **Analysis**: Package structure, architecture, APIs, components, tech stack, dependencies, code quality
- **Artifacts** (9 files): `business-overview.md`, `architecture.md`, `code-structure.md`, `api-documentation.md`, `component-inventory.md`, `technology-stack.md`, `dependencies.md`, `code-quality-assessment.md`, `reverse-engineering-timestamp.md`
- Proceeds to requirements after user approval

#### `/aidlc:inception-requirements` — Requirements analysis

Decomposes the user's intent into functional and non-functional requirements. Automatically adjusts question depth based on project complexity.

- **3-phase execution**:
  1. **Analysis**: Load context, determine adaptive depth (minimal / standard / comprehensive)
  2. **Questions**: Generate questions across 8+ categories in `.md` files — user fills in `[Answer]:` tags
  3. **Documentation**: Consolidate answers into `requirements.md`
- **Artifacts**: `requirement-verification-questions.md`, `requirements.md`
- Contradictory answers trigger follow-up questions for resolution

#### `/aidlc:inception-user-stories` — User story creation

Converts requirements into user-centric stories and personas. Two-part (planning → approval → generation).

- **Pre-assessment**: Evaluates whether user stories add value (proposes skip for refactoring/bug-fix-only projects, documenting the decision in `user-stories-assessment.md`)
- **Part 1 (Planning)**: Creates a story generation plan and collects explicit user approval
- **Part 2 (Generation)**: Generates stories and personas per approved plan, enforcing INVEST criteria (Independent, Negotiable, Valuable, Estimable, Small, Testable)
- **Artifacts**: `user-stories-assessment.md`, `story-generation-plan.md`, `stories.md`, `personas.md`

#### `/aidlc:inception-workflow-planning` — Execution plan creation

Analyzes scope, impact, and risk to determine EXECUTE / SKIP for all subsequent stages. Always runs.

- **Analysis**: Transformation scope, change impact, risk assessment, component relationships (brownfield)
- **Conditional stages evaluated**: application-design, units-generation, functional-design, nfr-requirements, nfr-design, infrastructure-design
- **Mermaid flowchart**: Visual representation of the execution plan
- **Artifacts**: `execution-plan.md` (per-stage EXECUTE/SKIP with rationale), updated `aidlc-state.md`
- Users can override any EXECUTE/SKIP decision

#### `/aidlc:inception-application-design` — Application design

Designs high-level component structure and service layers. Technology-agnostic.

- **Prerequisite**: Marked EXECUTE in execution plan
- **Scope**: Component identification and responsibility definition, service layer design, dependency mapping (detailed business logic deferred to functional-design)
- **Questions**: Design decisions and component boundaries presented in `.md` files
- **Artifacts**: `components.md`, `component-methods.md`, `services.md`, `component-dependency.md`

#### `/aidlc:inception-units-generation` — Unit decomposition

Decomposes the system into independently developable units of work. Two-part (planning → approval → generation).

- **Prerequisite**: Application-design complete and marked EXECUTE
- **Unit definition**: Logical grouping of stories — maps to services in microservices, logical modules in monoliths
- **Part 1 (Planning)**: Creates decomposition plan and questions, collects user approval
- **Part 2 (Generation)**: Generates unit definitions per approved plan, validating that all stories are assigned to a unit
- **Artifacts**: `unit-of-work.md`, `unit-of-work-dependency.md`, `unit-of-work-story-map.md`, plus code organization strategy for greenfield

---

#### `/aidlc:construction-functional-design [unit]` — Business logic design

Designs detailed business logic, domain model, and business rules for a unit. Technology-agnostic.

- **Argument**: Unit name (required)
- **Runs per unit**: Invoke once for each unit
- **Question categories**: Business logic, domain model, business rules, data flow, integration, error handling, frontend
- **Artifacts**: `business-logic-model.md`, `business-rules.md`, `domain-entities.md`, `frontend-components.md` (if applicable)
- Ambiguities always trigger follow-up questions

#### `/aidlc:construction-nfr-requirements [unit]` — NFR assessment + tech stack

Evaluates non-functional requirements and selects the technology stack for a unit.

- **Argument**: Unit name (required)
- **Assessment categories** (8): Scalability, performance, availability, security, reliability, maintainability, usability, tech stack
- **Artifacts**: `nfr-requirements.md`, `tech-stack-decisions.md` (with selection rationale)
- Detects vague terms ("standard", "typical", "depends") and generates clarification questions

#### `/aidlc:construction-nfr-design [unit]` — NFR pattern design

Translates NFR requirements into design patterns and logical components.

- **Argument**: Unit name (required)
- **Design targets**: Resilience, scalability, performance, and security patterns
- **Logical components**: Abstract components (queues, caches, load balancers, etc.) — concrete infrastructure mapping deferred to infrastructure-design
- **Artifacts**: `nfr-design-patterns.md`, `logical-components.md`

#### `/aidlc:construction-infrastructure-design [unit]` — Infrastructure design

Maps logical components to actual infrastructure services.

- **Argument**: Unit name (required)
- **Design targets**: Compute, storage, messaging, networking, monitoring
- **Artifacts**: `infrastructure-design.md`, `deployment-architecture.md`, `shared-infrastructure.md` (for cross-unit resources, if applicable)
- Bridges the gap from logical design (nfr-design) to physical infrastructure

#### `/aidlc:construction-code-generation [unit]` — Code generation

Generates executable code, tests, and deployment configs for a unit. Two-part (planning → approval → generation).

- **Argument**: Unit name (required)
- **Always runs**: Executes for every unit
- **Code location rules**:
  - Brownfield: Follow existing structure
  - Greenfield (single unit): `src/`, `tests/`, `config/`
  - Greenfield (microservices): `{unit}/src/`
  - Greenfield (monolith): `src/{unit}/`
- **Part 1 (Planning)**: Creates a code generation plan with checkboxes, collects user approval
- **Part 2 (Generation)**: Generates code strictly following the approved plan, marking checkboxes on completion
- **Important**: Application code goes in the workspace root only (never in `aidlc-docs/`). Brownfield edits files in-place without creating copies

#### `/aidlc:construction-build-and-test` — Build & test

Runs once after all units complete code generation. Generates comprehensive build and test instructions.

- **No argument**: Runs across all units
- **Prerequisite**: Code generation complete for ALL units
- **Test strategy**: Auto-selects required test types based on project complexity and NFR requirements
- **Artifacts**:
  - Required: `build-instructions.md`, `unit-test-instructions.md`, `integration-test-instructions.md`
  - Conditional: `performance-test-instructions.md`, `contract-test-instructions.md`, `security-test-instructions.md`, `e2e-test-instructions.md`
  - Summary: `build-and-test-summary.md`
- Final Construction phase stage. Transitions to Operations upon completion

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
