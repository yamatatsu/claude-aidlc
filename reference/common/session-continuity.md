# Session Continuity

## Resume Detection

When `/aidlc:resume` is invoked, follow these steps:

1. **Read `aidlc-docs/aidlc-state.md`** to determine current status
2. **Parse current phase and stage** from the state file
3. **Load prior artifacts** based on current stage (see Smart Context Loading)
4. **Present status summary** to user with resume options

## Welcome Back Template

```markdown
**Welcome back! You have an existing AI-DLC project in progress.**

Based on `aidlc-state.md`:
- **Project**: [project-name]
- **Current Phase**: [INCEPTION/CONSTRUCTION/OPERATIONS]
- **Current Stage**: [Stage Name]
- **Last Completed**: [Last completed step]
- **Next Step**: [Next step to work on]

**What would you like to do?**

A) Continue where you left off ([Next step description])
B) Review a previous stage

[Answer]:
```

## Smart Context Loading by Stage

- **Early Stages** (Workspace Detection, Reverse Engineering): Load workspace analysis
- **Requirements/Stories**: Load reverse engineering + requirements artifacts
- **Design Stages**: Load requirements + stories + architecture + design artifacts
- **Code Stages**: Load ALL artifacts + existing code files

## Mandatory Artifact Loading

Before resuming any stage, read relevant artifacts from ALL previous stages:
- **Reverse Engineering**: architecture.md, code-structure.md, api-documentation.md
- **Requirements**: requirements.md, requirement-verification-questions.md
- **User Stories**: stories.md, personas.md
- **Application Design**: components.md, component-methods.md, services.md
- **Units Generation**: unit-of-work.md, unit-of-work-dependency.md
- **Per-Unit Design**: functional-design, nfr-requirements, nfr-design, infrastructure-design artifacts
- **Code Stages**: ALL previous artifacts + code files

## Error Handling

If artifacts are missing or corrupted during resumption, see [error-handling.md](error-handling.md) for recovery procedures.

## Rules

- **ALWAYS** ask questions via `.md` files with `[Answer]:` tags, never in chat
- After loading artifacts, provide brief summary of loaded context
- Log the continuity prompt in `aidlc-docs/audit.md` with timestamp
