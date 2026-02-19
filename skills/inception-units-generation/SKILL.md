---
name: inception-units-generation
description: Decompose system into units of work. Two-part stage with planning and generation phases.
argument-hint:
disable-model-invocation: true
model: opus
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(mkdir *)
---

# AI-DLC: Units Generation (Inception)

ultrathink

Decompose the system into manageable units of work. This is a **two-part stage**: Planning → Generation.

**Definition**: A unit of work is a logical grouping of stories for development.
- Microservices: each unit = independently deployable service
- Monolith: single unit with logical modules

## Prerequisites Check

1. Read `aidlc-docs/aidlc-state.md` — verify Application Design is complete
2. Check execution plan — confirm Units Generation is marked EXECUTE
3. If SKIP: Inform user and guide to Construction phase. **STOP.**
4. Log stage start in `aidlc-docs/audit.md`

## PART 1: Planning

Follow [units-generation-detail.md](${CLAUDE_PLUGIN_ROOT}/reference/inception/units-generation-detail.md):

1. **Create plan** with checkboxes → `aidlc-docs/inception/plans/unit-of-work-plan.md`
2. **Mandatory artifacts** in plan:
   - [ ] unit-of-work.md — unit definitions and responsibilities
   - [ ] unit-of-work-dependency.md — dependency matrix
   - [ ] unit-of-work-story-map.md — story-to-unit mapping
   - [ ] Greenfield: code organization strategy
3. **Generate questions** using [Answer]: tags
4. **Collect, analyze, follow up** — resolve all ambiguities
5. **Get explicit approval** before generation

## PART 2: Generation

6. **Load approved plan**
7. **Execute each step** — mark [x] immediately
8. **Generate artifacts** → `aidlc-docs/inception/application-design/`

## Completion

1. Update `aidlc-state.md`
2. Present completion message
3. **WAIT for user approval**
4. Log in audit.md
5. Guide to Construction: `/aidlc:construction-functional-design [unit-name]` (first unit)

## Reference Files

- [Units Generation Detail](${CLAUDE_PLUGIN_ROOT}/reference/inception/units-generation-detail.md)
- [Question Format Guide](${CLAUDE_PLUGIN_ROOT}/reference/common/question-format-guide.md)
- [Terminology](${CLAUDE_PLUGIN_ROOT}/reference/common/terminology.md)

## Critical Rules

- Two-part stage: Planning MUST be approved before Generation
- All stories must be assigned to units
- Validate unit boundaries and dependencies
- Mark checkboxes [x] IMMEDIATELY after completing each step
