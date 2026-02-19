---
name: inception-reverse-engineering
description: Analyze existing codebase for brownfield projects. Generates architecture, API, component, and technology documentation.
argument-hint:
disable-model-invocation: true
model: opus
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(ls *), Bash(find *), Bash(mkdir *)
---

# AI-DLC: Reverse Engineering (Inception)

ultrathink

Analyze the existing codebase and generate comprehensive design artifacts for this brownfield project.

## Prerequisites Check

1. Read `aidlc-docs/aidlc-state.md` — verify project is brownfield
2. If greenfield: Inform user this stage is for brownfield only. Suggest `/aidlc:inception-requirements`. **STOP.**
3. Log stage start in `aidlc-docs/audit.md`

## Execution

Follow the detailed steps in [reverse-engineering-detail.md](${CLAUDE_PLUGIN_ROOT}/reference/inception/reverse-engineering-detail.md):

1. **Multi-Package Discovery** — scan all packages, infrastructure, build systems, services, code quality
2. **Generate Business Overview** → `aidlc-docs/inception/reverse-engineering/business-overview.md`
3. **Generate Architecture** → `aidlc-docs/inception/reverse-engineering/architecture.md`
4. **Generate Code Structure** → `aidlc-docs/inception/reverse-engineering/code-structure.md`
5. **Generate API Documentation** → `aidlc-docs/inception/reverse-engineering/api-documentation.md`
6. **Generate Component Inventory** → `aidlc-docs/inception/reverse-engineering/component-inventory.md`
7. **Generate Technology Stack** → `aidlc-docs/inception/reverse-engineering/technology-stack.md`
8. **Generate Dependencies** → `aidlc-docs/inception/reverse-engineering/dependencies.md`
9. **Generate Code Quality Assessment** → `aidlc-docs/inception/reverse-engineering/code-quality-assessment.md`
10. **Create Timestamp** → `aidlc-docs/inception/reverse-engineering/reverse-engineering-timestamp.md`

## Completion

1. Update `aidlc-state.md` — mark Reverse Engineering complete
2. Present completion message with summary
3. **WAIT for user approval** — do NOT proceed until confirmed
4. Log approval in audit.md
5. Guide to next: `/aidlc:inception-requirements`

## Reference Files

- [Reverse Engineering Detail](${CLAUDE_PLUGIN_ROOT}/reference/inception/reverse-engineering-detail.md)
- [Content Validation](${CLAUDE_PLUGIN_ROOT}/reference/common/content-validation.md)
- [ASCII Diagram Standards](${CLAUDE_PLUGIN_ROOT}/reference/common/ascii-diagram-standards.md)

## Critical Rules

- Validate all Mermaid diagrams before writing
- Use basic ASCII only for diagrams (no Unicode box-drawing)
- Application code stays in workspace root — docs in `aidlc-docs/` only
- Log ALL interactions in audit.md (append only)
