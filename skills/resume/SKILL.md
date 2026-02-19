---
name: resume
description: Resume an existing AI-DLC workflow from where you left off. Loads state and context from previous session.
disable-model-invocation: true
model: opus
allowed-tools: Read, Write, Edit, Glob, Grep
---

# AI-DLC: Resume Workflow

ultrathink

You are resuming an existing AI-DLC workflow. Follow these steps precisely.

## Step 1: Load State

1. Read `aidlc-docs/aidlc-state.md`
   - If not found: Inform user no existing project detected. Suggest `/aidlc:start` instead. **STOP.**
2. Parse current phase, stage, and progress

## Step 2: Smart Context Loading

Load artifacts based on current stage, following [session-continuity.md](${CLAUDE_PLUGIN_ROOT}/reference/common/session-continuity.md):

- **Early Stages**: Load workspace analysis only
- **Requirements/Stories**: Load reverse engineering + requirements
- **Design Stages**: Load requirements + stories + architecture + design
- **Code Stages**: Load ALL artifacts + existing code files

Provide a brief summary of loaded context to the user.

## Step 3: Present Status

Display current status:

```markdown
**Welcome back! Your AI-DLC project is in progress.**

- **Project**: [project-name]
- **Project Type**: [greenfield/brownfield]
- **Current Phase**: [INCEPTION/CONSTRUCTION]
- **Current Stage**: [stage-name]
- **Last Completed**: [last completed stage]
- **Next Step**: [next stage to work on]

**Loaded context from**: [list of loaded artifacts]
```

## Step 4: Present Options

Show available actions:
- Continue where left off → provide the specific `/aidlc:` command to run
- Review a previous stage → list completed stages

## Step 5: Log Resume

Append resume event to `aidlc-docs/audit.md`:
```markdown
## Session Resume
**Timestamp**: [ISO 8601]
**Current Phase**: [phase]
**Current Stage**: [stage]
**Context Loaded**: [list of artifacts]

---
```

## Reference Files

- [Session Continuity](${CLAUDE_PLUGIN_ROOT}/reference/common/session-continuity.md)
- [Error Handling](${CLAUDE_PLUGIN_ROOT}/reference/common/error-handling.md)
- [Workflow Changes](${CLAUDE_PLUGIN_ROOT}/reference/common/workflow-changes.md)

## Critical Rules

- ALWAYS read aidlc-state.md first
- Load context incrementally — validate each artifact
- If artifacts are missing, follow error-handling.md recovery procedures
- Use Edit (append) for audit.md — NEVER overwrite
