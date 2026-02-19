# Workflow Planning — Detailed Steps

**Always Execute** after requirements are gathered.

## Step 1: Load All Prior Context
- Reverse engineering artifacts (if brownfield)
- Requirements and user answers
- User stories (if executed)

## Step 2: Scope and Impact Analysis
### Transformation Scope (Brownfield)
- Single component vs architectural transformation
- Infrastructure vs application changes
- Cross-package impact

### Change Impact Assessment
- User-facing, structural, data model, API, NFR impacts

### Risk Assessment
- Low / Medium / High / Critical

## Step 3: Phase Determination
For each conditional stage, evaluate EXECUTE vs SKIP with rationale.

## Step 4: Note Adaptive Detail
All executed stages create ALL defined artifacts. Detail level adapts to complexity.

## Step 5: Multi-Module Coordination (Brownfield)
Analyze dependencies, determine update sequence, document coordination plan.

## Step 6: Generate Workflow Visualization
Create Mermaid flowchart with status styling:
- Always-execute: green
- Conditional execute: orange dashed
- Skip: gray dashed

## Step 7: Create Execution Plan Document
Save as `aidlc-docs/inception/plans/execution-plan.md` with:
- Analysis summary, impact assessment, risk level
- Workflow visualization
- Phase-by-phase EXECUTE/SKIP decisions with rationale
- Package change sequence (brownfield)

## Step 8: Update State
Update `aidlc-state.md` with execution plan summary.

## Step 9: Present Plan to User
```markdown
# Workflow Planning Complete

[Summary of analysis and recommendations]

> **REVIEW REQUIRED:**
> `aidlc-docs/inception/plans/execution-plan.md`

> **WHAT'S NEXT?**
> - Request Changes
> - [If stages skipped:] Add Skipped Stages
> - Approve & Continue — proceed to **[Next Stage]**
```

Wait for approval. Log in audit.md.
