# Application Design — Detailed Steps

**Purpose**: High-level component identification and service layer design.
**Note**: Detailed business logic design happens in Functional Design (Construction phase).

## Prerequisites
- Requirements Analysis complete
- User Stories recommended

## Step 1: Analyze Context
Read requirements.md and stories.md. Identify business capabilities and functional areas.

## Step 2: Create Design Plan
Generate plan with checkboxes for application design.

## Step 3: Mandatory Artifacts
Plan MUST include:
- [ ] components.md — component definitions, responsibilities, interfaces
- [ ] component-methods.md — method signatures, purposes, I/O types
- [ ] services.md — service definitions, responsibilities, orchestration
- [ ] component-dependency.md — dependency relationships, communication patterns

## Step 4: Generate Questions
Questions via [Answer]: tags for design decisions:
- Component boundaries, method signatures
- Service orchestration, dependency management
- Design patterns, architectural style

## Step 5: Store Plan
Save as `aidlc-docs/inception/plans/application-design-plan.md`.

## Steps 6-9: Collect, Analyze, Follow-up
Wait for answers → Check for ambiguities → Follow up → Resolve all.

## Step 10: Generate Artifacts
Create files in `aidlc-docs/inception/application-design/`:
- components.md, component-methods.md, services.md, component-dependency.md

## Step 11: Present Completion
```markdown
# Application Design Complete

[AI summary]

> **REVIEW REQUIRED:**
> `aidlc-docs/inception/application-design/`

> **WHAT'S NEXT?**
> - Request Changes
> - [If Units Generation skipped:] Add Units Generation
> - Approve & Continue — proceed to **[Units Generation / CONSTRUCTION]**
```

Wait for approval. Log in audit.md.
