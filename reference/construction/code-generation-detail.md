# Code Generation — Detailed Steps

**Two-part stage**: Planning → Generation (per unit)
**Brownfield note**: "generate" = modify existing files when appropriate.

## Prerequisites
- All prior design stages for this unit complete
- Unit ready for code generation

---

## PART 1: PLANNING

### Step 1: Analyze Context
- Read unit design artifacts
- Read story map for assigned stories
- Identify dependencies and interfaces

### Step 2: Create Code Generation Plan
- Determine code location (see Code Location Rules below)
- Brownfield: review code-structure.md for existing files
- Plan steps: Project Setup → Business Logic → Testing → API Layer → Repository Layer → Frontend (if applicable) → Migrations → Documentation → Deployment

### Step 3: Store Plan
Save as `aidlc-docs/construction/plans/{unit-name}-code-generation-plan.md`.

### Step 4: Get Approval
Present plan summary. Wait for explicit approval.

---

## PART 2: GENERATION

### Steps 5-7: Execute Plan
Load plan → Execute current step → Mark [x] → Repeat.

### Code Location Rules
- **Application code**: Workspace root ONLY (never aidlc-docs/)
- **Documentation**: aidlc-docs/ only
- **Brownfield**: Use existing structure
- **Greenfield single unit**: `src/`, `tests/`, `config/`
- **Greenfield multi-unit (microservices)**: `{unit-name}/src/`
- **Greenfield multi-unit (monolith)**: `src/{unit-name}/`

### Brownfield Rules
- Check if file exists before generating
- If exists: modify in-place (NEVER create copies like `_modified` or `_new`)
- If new: create new file

### Automation-Friendly UI Code
- Add `data-testid` to interactive elements
- Naming: `{component}-{element-role}`
- Keep test IDs stable across changes

### Step 8: Present Completion
```markdown
# Code Generation Complete - [unit-name]

[File list: Modified vs Created]

> **REVIEW REQUIRED:**
> - Application Code: `[workspace-path]`
> - Documentation: `aidlc-docs/construction/[unit-name]/code/`

> **WHAT'S NEXT?**
> - Request Changes
> - Continue to Next Stage — proceed to **[next unit / Build & Test]**
```

Wait for approval. Log in audit.md. Update state.
