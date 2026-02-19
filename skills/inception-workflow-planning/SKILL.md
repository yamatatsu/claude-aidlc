---
name: inception-workflow-planning
description: Create execution plan determining which stages to run. Analyzes scope, impact, and risk to recommend optimal workflow.
argument-hint:
disable-model-invocation: true
model: opus
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(mkdir *)
---

# AI-DLC: Workflow Planning (Inception)

ultrathink

Determine which stages to execute and create the comprehensive execution plan. This stage always executes.

## Prerequisites Check

1. Read `aidlc-docs/aidlc-state.md` — verify Requirements Analysis is complete
2. Log stage start in `aidlc-docs/audit.md`

## Execution

Follow [workflow-planning-detail.md](${CLAUDE_PLUGIN_ROOT}/reference/inception/workflow-planning-detail.md):

### Analysis
1. **Load all prior context** — reverse engineering, requirements, user stories (if any)
2. **Scope and impact analysis**:
   - Transformation scope (brownfield: single component vs architectural)
   - Change impact (user-facing, structural, data, API, NFR)
   - Component relationships (brownfield)
   - Risk assessment (Low/Medium/High/Critical)

### Determination
3. **Phase determination** — for each conditional stage, evaluate EXECUTE vs SKIP with rationale:
   - Application Design, Units Generation
   - Functional Design, NFR Requirements, NFR Design, Infrastructure Design
4. **Note adaptive detail** — all executed stages create ALL defined artifacts
5. **Multi-module coordination** (brownfield: update sequence, dependencies)

### Documentation
6. **Generate workflow visualization** — Mermaid flowchart with styling per detail doc
7. **Create execution plan** → `aidlc-docs/inception/plans/execution-plan.md`
   - Validate Mermaid per [content-validation.md](${CLAUDE_PLUGIN_ROOT}/reference/common/content-validation.md)
8. **Update state** — `aidlc-state.md` with execution plan summary

## Completion

1. Present plan to user with EXECUTE/SKIP rationale for each stage
2. Emphasize user control: "You can override any recommendation"
3. **WAIT for user approval**
4. Log approval in audit.md
5. Guide to next based on plan: first EXECUTE stage (typically `/aidlc:inception-application-design` or `/aidlc:construction-functional-design`)

## Reference Files

- [Workflow Planning Detail](${CLAUDE_PLUGIN_ROOT}/reference/inception/workflow-planning-detail.md)
- [Depth Levels](${CLAUDE_PLUGIN_ROOT}/reference/common/depth-levels.md)
- [Content Validation](${CLAUDE_PLUGIN_ROOT}/reference/common/content-validation.md)
- [Terminology](${CLAUDE_PLUGIN_ROOT}/reference/common/terminology.md)

## Critical Rules

- Always present EXECUTE/SKIP rationale for each conditional stage
- User can override any recommendation
- Validate Mermaid diagrams before writing
- Include text alternative for workflow visualization
- Append to audit.md — never overwrite
