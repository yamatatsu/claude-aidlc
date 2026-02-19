---
name: construction-code-generation
description: Generate code, tests, and deployment artifacts for a unit. Two-part stage with planning and generation.
argument-hint: [unit-name]
disable-model-invocation: true
model: opus
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(ls *), Bash(find *), Bash(mkdir *), Bash(npm *), Bash(npx *), Bash(bun *), Bash(cargo *), Bash(go *), Bash(python *), Bash(pip *), Bash(mvn *), Bash(gradle *)
---

# AI-DLC: Code Generation (Construction)

ultrathink

Generate code for the specified unit. This is a **two-part stage**: Planning → Generation. Always executes for each unit.

**Unit**: `$ARGUMENTS` (if not provided, use default unit from execution plan)

## Prerequisites Check

1. Read `aidlc-docs/aidlc-state.md` — verify prior design stages are complete for this unit
2. Log stage start in `aidlc-docs/audit.md`

## PART 1: Planning

Follow [code-generation-detail.md](${CLAUDE_PLUGIN_ROOT}/reference/construction/code-generation-detail.md):

1. **Analyze unit context** — read all design artifacts, story map, dependencies
2. **Determine code location** (see Code Location Rules):
   - **Brownfield**: Use existing structure (review code-structure.md)
   - **Greenfield single unit**: `src/`, `tests/`, `config/`
   - **Greenfield multi-unit (microservices)**: `{unit}/src/`
   - **Greenfield multi-unit (monolith)**: `src/{unit}/`
3. **Create code generation plan** with checkboxes → `aidlc-docs/construction/plans/$ARGUMENTS-code-generation-plan.md`
   - Project structure setup, business logic, tests, API layer, repository layer
   - Frontend (if applicable), migrations, documentation, deployment
4. **Present plan summary** to user
5. **WAIT for explicit approval** before generation

## PART 2: Generation

6. **Load approved plan**
7. **Execute each step**:
   - Application code → workspace root (NEVER aidlc-docs/)
   - Documentation → `aidlc-docs/construction/$ARGUMENTS/code/`
   - Brownfield: modify in-place (NEVER create `_modified` or `_new` copies)
8. **Mark [x]** immediately after each step
9. **Repeat** until all steps complete

## Completion

1. Update `aidlc-state.md` — mark Code Generation complete for this unit
2. Present completion message listing created/modified files
3. **WAIT for user approval** (Request Changes / Continue)
4. Log in audit.md
5. Guide to next:
   - More units remaining: `/aidlc:construction-functional-design [next-unit]`
   - All units done: `/aidlc:construction-build-and-test`

## Reference Files

- [Code Generation Detail](${CLAUDE_PLUGIN_ROOT}/reference/construction/code-generation-detail.md)
- [Content Validation](${CLAUDE_PLUGIN_ROOT}/reference/common/content-validation.md)

## Critical Rules

- **Application code in workspace root** — NEVER in aidlc-docs/
- **Brownfield**: modify existing files in-place — never create copies
- **Two-part stage**: Planning MUST be approved before Generation
- **NO HARDCODED LOGIC**: Only execute what's in the approved plan
- **FOLLOW PLAN EXACTLY**: Do not deviate from step sequence
- **UPDATE CHECKBOXES**: Mark [x] immediately after each step
- **UI code**: Add `data-testid` attributes for automation
- Standardized 2-option completion
