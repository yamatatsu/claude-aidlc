---
name: construction-nfr-design
description: Incorporate NFR patterns and logical components into unit design.
argument-hint: [unit-name]
disable-model-invocation: true
model: opus
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(mkdir *)
---

# AI-DLC: NFR Design (Construction)

ultrathink

Incorporate NFR requirements into the unit design using design patterns and logical components.

**Unit**: `$ARGUMENTS` (if not provided, use default unit from execution plan)

## Prerequisites Check

1. Read `aidlc-docs/aidlc-state.md` — verify NFR Requirements is complete for this unit
2. Check execution plan — confirm NFR Design is marked EXECUTE
3. If SKIP: Inform user and guide to next stage. **STOP.**
4. Log stage start in `aidlc-docs/audit.md`

## Execution

Follow [nfr-design-detail.md](${CLAUDE_PLUGIN_ROOT}/reference/construction/nfr-design-detail.md):

1. **Analyze NFR requirements** from `aidlc-docs/construction/$ARGUMENTS/nfr-requirements/`
2. **Create plan** → `aidlc-docs/construction/plans/$ARGUMENTS-nfr-design-plan.md`
3. **Generate questions** — context-appropriate via [Answer]: tags:
   - Resilience, Scalability, Performance, Security patterns
   - Logical components (queues, caches, etc.)
4. **Collect and analyze answers**
5. **Generate artifacts** → `aidlc-docs/construction/$ARGUMENTS/nfr-design/`:
   - nfr-design-patterns.md
   - logical-components.md

## Completion

1. Update `aidlc-state.md`
2. Present completion message: "NFR Design Complete - $ARGUMENTS"
3. **WAIT for user approval** (Request Changes / Continue)
4. Log in audit.md
5. Guide to next: `/aidlc:construction-infrastructure-design $ARGUMENTS`

## Reference Files

- [NFR Design Detail](${CLAUDE_PLUGIN_ROOT}/reference/construction/nfr-design-detail.md)
- [Question Format Guide](${CLAUDE_PLUGIN_ROOT}/reference/common/question-format-guide.md)

## Critical Rules

- Questions only where user input is truly needed for pattern decisions
- ALL questions in `.md` files — NEVER in chat
- Standardized 2-option completion
