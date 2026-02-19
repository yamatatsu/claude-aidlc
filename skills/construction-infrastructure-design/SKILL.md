---
name: construction-infrastructure-design
description: Map logical software components to actual infrastructure services for deployment.
argument-hint: [unit-name]
disable-model-invocation: true
model: opus
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(mkdir *)
---

# AI-DLC: Infrastructure Design (Construction)

ultrathink

Map logical software components to actual infrastructure choices for the deployment environment.

**Unit**: `$ARGUMENTS` (if not provided, use default unit from execution plan)

## Prerequisites Check

1. Read `aidlc-docs/aidlc-state.md` — verify prior design stages are complete for this unit
2. Check execution plan — confirm Infrastructure Design is marked EXECUTE
3. If SKIP: Inform user and guide to Code Generation. **STOP.**
4. Log stage start in `aidlc-docs/audit.md`

## Execution

Follow [infrastructure-design-detail.md](${CLAUDE_PLUGIN_ROOT}/reference/construction/infrastructure-design-detail.md):

1. **Analyze design artifacts** — functional design + NFR design for the unit
2. **Create plan** → `aidlc-docs/construction/plans/$ARGUMENTS-infrastructure-design-plan.md`
3. **Generate questions** — context-appropriate via [Answer]: tags:
   - Deployment Environment, Compute, Storage
   - Messaging, Networking, Monitoring
   - Shared Infrastructure
4. **Collect and analyze answers**
5. **Generate artifacts** → `aidlc-docs/construction/$ARGUMENTS/infrastructure-design/`:
   - infrastructure-design.md
   - deployment-architecture.md
   - shared-infrastructure.md (if applicable)

## Completion

1. Update `aidlc-state.md`
2. Present completion message: "Infrastructure Design Complete - $ARGUMENTS"
3. **WAIT for user approval** (Request Changes / Continue)
4. Log in audit.md
5. Guide to next: `/aidlc:construction-code-generation $ARGUMENTS`

## Reference Files

- [Infrastructure Design Detail](${CLAUDE_PLUGIN_ROOT}/reference/construction/infrastructure-design-detail.md)
- [Question Format Guide](${CLAUDE_PLUGIN_ROOT}/reference/common/question-format-guide.md)

## Critical Rules

- Questions only where infrastructure decisions need user input
- ALL questions in `.md` files — NEVER in chat
- Standardized 2-option completion
