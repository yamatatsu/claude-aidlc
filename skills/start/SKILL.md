---
name: start
description: Start a new AI-DLC workflow. Analyzes workspace, initializes state, and guides through the adaptive development lifecycle.
disable-model-invocation: true
model: opus
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(ls *), Bash(find *), Bash(mkdir *)
---

# AI-DLC: Start New Workflow

ultrathink

You are initiating the AI-DLC (AI-Driven Development Life Cycle) workflow. Follow these steps precisely.

## Step 1: Display Welcome Message

Read and display the welcome message from [welcome-message.md](${CLAUDE_PLUGIN_ROOT}/reference/common/welcome-message.md). Display it ONCE to the user.

## Step 2: Workspace Detection

Perform workspace detection following [workspace-detection-detail.md](${CLAUDE_PLUGIN_ROOT}/reference/inception/workspace-detection-detail.md):

1. **Check for existing project**: Look for `aidlc-docs/aidlc-state.md`
   - If found: Inform user and suggest running `/aidlc:resume` instead. **STOP HERE.**
2. **Scan workspace** for source code and build files
3. **Determine project type**: greenfield or brownfield
4. **Log initial user request** in audit.md with complete raw input

## Step 3: Initialize State

1. Create `aidlc-docs/` directory structure:
   ```
   aidlc-docs/
   ├── inception/
   │   ├── plans/
   │   ├── reverse-engineering/
   │   ├── requirements/
   │   ├── user-stories/
   │   └── application-design/
   ├── construction/
   │   ├── plans/
   │   └── build-and-test/
   ├── aidlc-state.md
   └── audit.md
   ```

2. Create `aidlc-docs/aidlc-state.md` based on [aidlc-state.md template](${CLAUDE_PLUGIN_ROOT}/templates/aidlc-state.md)
3. Create `aidlc-docs/audit.md` based on [audit.md template](${CLAUDE_PLUGIN_ROOT}/templates/audit.md)
4. Log the initial user request in audit.md

## Step 4: Present Workspace Detection Results

Present findings following the completion message format in workspace-detection-detail.md.

## Step 5: Guide to Next Stage

Based on project type, inform user of next step:
- **Brownfield** (no RE artifacts): "Run `/aidlc:inception-reverse-engineering` to analyze existing codebase"
- **Brownfield** (RE artifacts exist): "Run `/aidlc:inception-requirements` to begin requirements analysis"
- **Greenfield**: "Run `/aidlc:inception-requirements` to begin requirements analysis"

## Reference Files

- [Process Overview](${CLAUDE_PLUGIN_ROOT}/reference/common/process-overview.md)
- [Terminology](${CLAUDE_PLUGIN_ROOT}/reference/common/terminology.md)
- [Content Validation](${CLAUDE_PLUGIN_ROOT}/reference/common/content-validation.md)
- [Error Handling](${CLAUDE_PLUGIN_ROOT}/reference/common/error-handling.md)

## Critical Rules

- Display welcome message ONCE only
- ALL questions go in `.md` files with `[Answer]:` tags — NEVER ask in chat
- Log ALL user inputs in audit.md with ISO 8601 timestamps
- Application code goes in workspace root, documentation in `aidlc-docs/` only
- Always use `Edit` (append) for audit.md — NEVER overwrite
