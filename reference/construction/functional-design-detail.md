# Functional Design — Detailed Steps

**Purpose**: Detailed business logic design per unit (technology-agnostic).

## Prerequisites
- Units Generation complete
- Application Design recommended

## Step 1: Analyze Unit Context
- Read unit definition from `aidlc-docs/inception/application-design/unit-of-work.md`
- Read story map from `aidlc-docs/inception/application-design/unit-of-work-story-map.md`

## Step 2: Create Plan
Generate plan with checkboxes for business logic, domain models, business rules.

## Step 3: Generate Questions
Proactive questioning across ALL categories:
- Business Logic Modeling: entities, workflows, data transformations
- Domain Model: concepts, relationships, data structures
- Business Rules: decision rules, validation, constraints
- Data Flow: inputs, outputs, transformations, persistence
- Integration Points: external systems, APIs
- Error Handling: error scenarios, validation failures
- Business Scenarios: edge cases, alternative flows
- Frontend Components (if applicable): UI structure, interactions, state

## Step 4: Store Plan
Save as `aidlc-docs/construction/plans/{unit-name}-functional-design-plan.md`.

## Step 5: Collect and Analyze Answers
Wait → Review for ambiguities → Follow up → Resolve all.

## Step 6: Generate Artifacts
In `aidlc-docs/construction/{unit-name}/functional-design/`:
- business-logic-model.md
- business-rules.md
- domain-entities.md
- frontend-components.md (if applicable)

## Step 7: Present Completion
```markdown
# Functional Design Complete - [unit-name]

[AI summary]

> **REVIEW REQUIRED:**
> `aidlc-docs/construction/[unit-name]/functional-design/`

> **WHAT'S NEXT?**
> - Request Changes
> - Continue to Next Stage — proceed to **[next stage]**
```

Wait for approval. Log in audit.md. Update state.
