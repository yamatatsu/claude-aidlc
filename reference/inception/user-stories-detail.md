# User Stories — Detailed Steps

**Two-part stage**: Planning → Generation

## Intelligent Assessment (MANDATORY)

### Execute IF (High Priority)
- New user-facing features
- User experience changes
- Multi-persona systems
- Customer-facing APIs
- Complex business logic
- Cross-team projects

### Skip Only IF
- Pure internal refactoring
- Simple isolated bug fixes
- Infrastructure-only changes
- Developer tooling changes
- Documentation-only updates

### Default: When in doubt, include user stories.

---

## PART 1: PLANNING

### Step 1: Validate Need
Document assessment in `aidlc-docs/inception/plans/user-stories-assessment.md`.

### Step 2: Create Story Plan
Generate comprehensive plan with checkboxes for story development.

### Step 3: Generate Questions
Create questions in the plan file using [Answer]: tags.
Categories: User Personas, Story Granularity, Format, Breakdown Approach, Acceptance Criteria, User Journeys, Business Context, Technical Constraints.

### Step 4: Mandatory Artifacts
Plan MUST include:
- [ ] stories.md with INVEST-criteria stories
- [ ] personas.md with user archetypes
- [ ] Acceptance criteria for each story
- [ ] Persona-to-story mapping

### Step 5: Store Plan
Save as `aidlc-docs/inception/plans/story-generation-plan.md`.

### Steps 6-8: Collect and Analyze Answers
Wait for answers → Analyze for ambiguities → Follow up if needed.

### Step 9: Get Approval
Wait for explicit plan approval before generation.

---

## PART 2: GENERATION

### Steps 10-12: Execute Plan
Load plan → Execute current step → Mark [x] → Repeat until done.

### Step 13: Present Completion
```markdown
# User Stories Complete

[AI summary]

> **REVIEW REQUIRED:**
> `aidlc-docs/inception/user-stories/stories.md` and `personas.md`

> **WHAT'S NEXT?**
> - Request Changes
> - Approve & Continue — proceed to **Workflow Planning**
```

Wait for approval. Log in audit.md.
