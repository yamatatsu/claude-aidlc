---
name: inception-user-stories
description: Create user stories and personas from requirements. Two-part stage with planning and generation phases.
argument-hint:
disable-model-invocation: true
model: opus
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(mkdir *)
---

# AI-DLC: User Stories (Inception)

ultrathink

Convert requirements into user-centered stories with acceptance criteria. This is a **two-part stage**: Planning → Generation.

## Prerequisites Check

1. Read `aidlc-docs/aidlc-state.md` — verify Requirements Analysis is complete
2. Log stage start in `aidlc-docs/audit.md`

## Intelligent Assessment (MANDATORY)

Before proceeding, validate that user stories add value. Follow the assessment criteria in [user-stories-detail.md](${CLAUDE_PLUGIN_ROOT}/reference/inception/user-stories-detail.md).

- **Execute** for: user-facing features, multi-persona, complex business logic, cross-team
- **Skip** for: pure refactoring, isolated bug fixes, infrastructure-only, dev tooling
- **Default**: When in doubt, include user stories
- Document assessment in `aidlc-docs/inception/plans/user-stories-assessment.md`

## PART 1: Planning

1. **Create story plan** with checkboxes → `aidlc-docs/inception/plans/story-generation-plan.md`
2. **Generate questions** using [Answer]: tags — personas, granularity, format, acceptance criteria
3. **Include mandatory artifacts**: stories.md, personas.md, INVEST criteria, acceptance criteria
4. **Inform user** and WAIT for answers
5. **Analyze answers** for ambiguities — follow up if needed
6. **Get explicit approval** of plan before generation

## PART 2: Generation

7. **Load approved plan** from `aidlc-docs/inception/plans/story-generation-plan.md`
8. **Execute each step** — mark [x] immediately after completion
9. **Generate artifacts**:
   - `aidlc-docs/inception/user-stories/stories.md`
   - `aidlc-docs/inception/user-stories/personas.md`

## Completion

1. Update `aidlc-state.md` — mark User Stories complete
2. Present completion message with summary
3. **WAIT for user approval**
4. Log approval in audit.md
5. Guide to next: `/aidlc:inception-workflow-planning`

## Reference Files

- [User Stories Detail](${CLAUDE_PLUGIN_ROOT}/reference/inception/user-stories-detail.md)
- [Question Format Guide](${CLAUDE_PLUGIN_ROOT}/reference/common/question-format-guide.md)
- [Overconfidence Prevention](${CLAUDE_PLUGIN_ROOT}/reference/common/overconfidence-prevention.md)

## Critical Rules

- Two-part stage: Planning MUST be approved before Generation starts
- Follow INVEST criteria for all stories
- ALL questions in `.md` files — NEVER in chat
- Mark checkboxes [x] IMMEDIATELY after completing each step
- Resolve ALL ambiguities before proceeding
