# Units Generation — Detailed Steps

**Two-part stage**: Planning → Generation

**Definition**: A unit of work is a logical grouping of stories for development.
- Microservices: each unit = independently deployable service
- Monolith: single unit with logical modules

## Prerequisites
- Application Design REQUIRED
- Requirements and stories recommended

---

## PART 1: PLANNING

### Step 1: Create Plan
Generate plan with checkboxes for system decomposition.

### Step 2: Mandatory Artifacts
- [ ] unit-of-work.md — unit definitions and responsibilities
- [ ] unit-of-work-dependency.md — dependency matrix
- [ ] unit-of-work-story-map.md — story-to-unit mapping
- [ ] Greenfield: code organization strategy
- [ ] Validate boundaries and dependencies
- [ ] Ensure all stories assigned to units

### Step 3: Generate Questions
Categories: Story Grouping, Dependencies, Team Alignment, Technical Considerations, Business Domain, Code Organization (greenfield multi-unit).

### Step 4: Store Plan
Save as `aidlc-docs/inception/plans/unit-of-work-plan.md`.

### Steps 5-8: Collect, Analyze, Follow-up, Approve

---

## PART 2: GENERATION

### Steps 9-11: Execute Plan
Load plan → Execute → Mark [x] → Repeat.

### Step 12: Present Completion
```markdown
# Units Generation Complete

[AI summary]

> **REVIEW REQUIRED:**
> `aidlc-docs/inception/application-design/`

> **WHAT'S NEXT?**
> - Request Changes
> - Approve & Continue — proceed to **CONSTRUCTION PHASE**
```

Wait for approval. Log in audit.md.
