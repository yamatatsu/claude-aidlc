# Workspace Detection — Detailed Steps

## Step 1: Check for Existing AI-DLC Project
- Check if `aidlc-docs/aidlc-state.md` exists
- If exists: suggest `/aidlc:resume` to continue
- If not exists: continue with new project assessment

## Step 2: Scan Workspace
- Scan for source code files (.ts, .js, .py, .java, .go, .rs, .rb, .php, .cs, .cpp, etc.)
- Check for build files (package.json, pom.xml, build.gradle, Cargo.toml, etc.)
- Identify workspace root directory (NOT aidlc-docs/)
- Record findings:

```markdown
## Workspace State
- **Existing Code**: [Yes/No]
- **Languages**: [List if found]
- **Build System**: [npm/maven/gradle/cargo/etc.]
- **Project Structure**: [Monolith/Microservices/Library/Empty]
- **Workspace Root**: [Path]
```

## Step 3: Determine Next Stage
- **Empty workspace (greenfield)**: `brownfield = false` → Requirements Analysis
- **Has code (brownfield)**: `brownfield = true` → check for reverse engineering artifacts
  - Artifacts exist: Skip to Requirements Analysis
  - No artifacts: Reverse Engineering next

## Step 4: Create Initial State File
Create `aidlc-docs/aidlc-state.md` from the state template.

## Step 5: Present Completion Message

**Brownfield**:
```markdown
# Workspace Detection Complete

- **Project Type**: Brownfield project
- [Summary of findings]
- **Next Step**: Proceeding to **Reverse Engineering**...
```

**Greenfield**:
```markdown
# Workspace Detection Complete

- **Project Type**: Greenfield project
- **Next Step**: Proceeding to **Requirements Analysis**...
```

## Step 6: Auto-Proceed
No user approval required — this is informational. Automatically proceed to next stage.
