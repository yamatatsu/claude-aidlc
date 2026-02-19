---
name: inception-application-design
description: Design application components, methods, services, and dependencies at a high level.
argument-hint:
disable-model-invocation: true
model: opus
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(mkdir *)
---

# AI-DLC: Application Design (Inception)

ultrathink

High-level component identification and service layer design. Detailed business logic design happens later in Functional Design (Construction phase).

## Prerequisites Check

1. Read `aidlc-docs/aidlc-state.md` — verify Workflow Planning is complete
2. Check execution plan — confirm Application Design is marked EXECUTE
3. If SKIP: Inform user and guide to next stage. **STOP.**
4. Log stage start in `aidlc-docs/audit.md`

## Execution

Follow [application-design-detail.md](${CLAUDE_PLUGIN_ROOT}/reference/inception/application-design-detail.md):

1. **Analyze context** — read requirements.md and stories.md
2. **Create design plan** with checkboxes → `aidlc-docs/inception/plans/application-design-plan.md`
3. **Mandatory artifacts** in plan:
   - [ ] components.md — definitions, responsibilities, interfaces
   - [ ] component-methods.md — method signatures, purposes, I/O types
   - [ ] services.md — service definitions, orchestration
   - [ ] component-dependency.md — relationships, communication patterns
4. **Generate questions** using [Answer]: tags for design decisions
5. **Inform user** and WAIT for answers
6. **Analyze answers** — follow up on ambiguities
7. **Generate artifacts** → `aidlc-docs/inception/application-design/`

## Completion

1. Update `aidlc-state.md`
2. Present completion message
3. **WAIT for user approval**
4. Log in audit.md
5. Guide to next: `/aidlc:inception-units-generation` or first Construction stage

## Reference Files

- [Application Design Detail](${CLAUDE_PLUGIN_ROOT}/reference/inception/application-design-detail.md)
- [Question Format Guide](${CLAUDE_PLUGIN_ROOT}/reference/common/question-format-guide.md)

## Critical Rules

- Focus on HIGH-LEVEL design — detailed business logic is for Functional Design
- ALL questions in `.md` files with [Answer]: tags
- Resolve ALL ambiguities before generating artifacts
