---
name: status
description: Display current AI-DLC project status and progress (read-only).
model: haiku
context: fork
agent: Explore
allowed-tools: Read, Glob, Grep
---

# AI-DLC: Project Status

Read `aidlc-docs/aidlc-state.md` and display a comprehensive status summary.

## Steps

1. **Read State File**: Load `aidlc-docs/aidlc-state.md`
   - If not found: Report "No AI-DLC project found. Run `/aidlc:start` to begin."

2. **Read Audit Log**: Load `aidlc-docs/audit.md` to get latest activity

3. **Check Artifacts**: Scan `aidlc-docs/` for existing artifacts

4. **Present Status Report**:

```markdown
# AI-DLC Project Status

## Project Info
- **Project Type**: [greenfield/brownfield]
- **Started**: [date]
- **Last Updated**: [date]

## Phase Progress

### INCEPTION PHASE
- [x/blank] Workspace Detection
- [x/blank] Reverse Engineering
- [x/blank] Requirements Analysis
- [x/blank] User Stories
- [x/blank] Workflow Planning
- [x/blank] Application Design
- [x/blank] Units Generation

### CONSTRUCTION PHASE
[Per-unit status if available]
- [x/blank] Build and Test

## Current Position
- **Phase**: [current phase]
- **Stage**: [current stage]
- **Next Action**: Run `/aidlc:[next-skill-name]`

## Artifacts Generated
[List of existing artifact files in aidlc-docs/]
```

This skill is read-only. It does not modify any files.
