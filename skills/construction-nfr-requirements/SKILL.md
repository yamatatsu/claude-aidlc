---
name: construction-nfr-requirements
description: Determine non-functional requirements and select technology stack for a unit.
argument-hint: [unit-name]
disable-model-invocation: true
model: opus
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(mkdir *)
---

# AI-DLC: NFR Requirements (Construction)

ultrathink

Determine non-functional requirements and make technology stack choices for the specified unit.

**Unit**: `$ARGUMENTS` (if not provided, use default unit from execution plan)

## Prerequisites Check

1. Read `aidlc-docs/aidlc-state.md` — verify Functional Design is complete for this unit
2. Check execution plan — confirm NFR Requirements is marked EXECUTE
3. If SKIP: Inform user and guide to next stage. **STOP.**
4. Log stage start in `aidlc-docs/audit.md`

## Execution

Follow [nfr-requirements-detail.md](${CLAUDE_PLUGIN_ROOT}/reference/construction/nfr-requirements-detail.md):

1. **Analyze functional design** from `aidlc-docs/construction/$ARGUMENTS/functional-design/`
2. **Create plan** → `aidlc-docs/construction/plans/$ARGUMENTS-nfr-requirements-plan.md`
3. **Generate questions** — proactive across ALL categories:
   - Scalability, Performance, Availability, Security
   - Tech Stack, Reliability, Maintainability, Usability
4. **Collect and analyze answers** — resolve all ambiguities
5. **Generate artifacts** → `aidlc-docs/construction/$ARGUMENTS/nfr-requirements/`:
   - nfr-requirements.md
   - tech-stack-decisions.md

## Completion

1. Update `aidlc-state.md`
2. Present completion message: "NFR Requirements Complete - $ARGUMENTS"
3. **WAIT for user approval** (Request Changes / Continue)
4. Log in audit.md
5. Guide to next: `/aidlc:construction-nfr-design $ARGUMENTS`

## Reference Files

- [NFR Requirements Detail](${CLAUDE_PLUGIN_ROOT}/reference/construction/nfr-requirements-detail.md)
- [Question Format Guide](${CLAUDE_PLUGIN_ROOT}/reference/common/question-format-guide.md)
- [Overconfidence Prevention](${CLAUDE_PLUGIN_ROOT}/reference/common/overconfidence-prevention.md)

## Critical Rules

- ALL questions in `.md` files — NEVER in chat
- Default to asking when ANY ambiguity exists
- Watch for vague terms: "standard", "typical", "depends"
- Standardized 2-option completion
