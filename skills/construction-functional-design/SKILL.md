---
name: construction-functional-design
description: Design detailed business logic, domain models, and business rules for a unit (technology-agnostic).
argument-hint: [unit-name]
disable-model-invocation: true
model: opus
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(mkdir *)
---

# AI-DLC: Functional Design (Construction)

ultrathink

Design detailed business logic for the specified unit. Technology-agnostic, focused purely on business functions.

**Unit**: `$ARGUMENTS` (if not provided, use default unit from execution plan)

## Prerequisites Check

1. Read `aidlc-docs/aidlc-state.md` — verify Units Generation or Workflow Planning is complete
2. Check execution plan — confirm Functional Design is marked EXECUTE
3. If SKIP: Inform user and guide to next stage. **STOP.**
4. Validate unit name exists in unit-of-work.md (if Units Generation was executed)
5. Log stage start in `aidlc-docs/audit.md`

## Execution

Follow [functional-design-detail.md](${CLAUDE_PLUGIN_ROOT}/reference/construction/functional-design-detail.md):

1. **Analyze unit context** — read unit definition and story map
2. **Create plan** with checkboxes → `aidlc-docs/construction/plans/$ARGUMENTS-functional-design-plan.md`
3. **Generate questions** using [Answer]: tags — proactive across ALL categories:
   - Business Logic, Domain Model, Business Rules, Data Flow
   - Integration Points, Error Handling, Business Scenarios
   - Frontend Components (if applicable)
4. **Inform user** and WAIT for answers
5. **Analyze answers** — follow up on ALL ambiguities
6. **Generate artifacts** → `aidlc-docs/construction/$ARGUMENTS/functional-design/`:
   - business-logic-model.md
   - business-rules.md
   - domain-entities.md
   - frontend-components.md (if applicable)

## Completion

1. Update `aidlc-state.md` — mark Functional Design complete for this unit
2. Present completion message: "Functional Design Complete - $ARGUMENTS"
3. **WAIT for user approval** (Request Changes / Continue to Next Stage)
4. Log in audit.md
5. Guide to next: `/aidlc:construction-nfr-requirements $ARGUMENTS`

## Reference Files

- [Functional Design Detail](${CLAUDE_PLUGIN_ROOT}/reference/construction/functional-design-detail.md)
- [Question Format Guide](${CLAUDE_PLUGIN_ROOT}/reference/common/question-format-guide.md)
- [Overconfidence Prevention](${CLAUDE_PLUGIN_ROOT}/reference/common/overconfidence-prevention.md)

## Critical Rules

- This is technology-agnostic design — no infrastructure concerns
- ALL questions in `.md` files — NEVER in chat
- Default to asking questions when ANY ambiguity exists
- Standardized 2-option completion (Request Changes / Continue)
