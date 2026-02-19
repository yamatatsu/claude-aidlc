# Requirements Analysis — Detailed Steps

**Adaptive Phase**: Always executes. Detail level adapts to complexity.
**Role**: Assume the role of a product owner.

## Prerequisites
- Workspace Detection complete
- Reverse Engineering complete (if brownfield)

## Step 1: Load Context (if brownfield)
Load architecture.md, component-inventory.md, technology-stack.md from reverse engineering.

## Step 2: Analyze User Request (Intent Analysis)
- **Clarity**: Clear / Vague / Incomplete
- **Type**: New Feature / Bug Fix / Refactoring / Upgrade / Migration / Enhancement / New Project
- **Scope**: Single File / Single Component / Multiple Components / System-wide / Cross-system
- **Complexity**: Trivial / Simple / Moderate / Complex

## Step 3: Determine Depth
- **Minimal**: Clear, simple request
- **Standard**: Needs clarification, normal complexity
- **Comprehensive**: Complex, high-risk, multiple stakeholders

## Step 4: Assess Current Requirements
Analyze user-provided content: intent statements, existing documents, pasted content.

## Step 5: Completeness Analysis
**MANDATORY**: Evaluate ALL areas:
- Functional Requirements: features, interactions, behaviors
- Non-Functional Requirements: performance, security, scalability
- User Scenarios: use cases, edge cases, error scenarios
- Business Context: goals, constraints, success criteria
- Technical Context: integrations, data, boundaries
- Quality Attributes: reliability, maintainability, testability

## Step 6: Generate Clarifying Questions
- ALWAYS create `aidlc-docs/inception/requirements/requirement-verification-questions.md`
- Use [Answer]: tag format (see question-format-guide.md)
- WAIT for user answers before proceeding

## Step 7: Generate Requirements Document
- PREREQUISITE: All answers received and analyzed
- Create `aidlc-docs/inception/requirements/requirements.md`
- Include intent analysis, functional/non-functional requirements, user answers

## Step 8: Update State
Mark Requirements Analysis complete in `aidlc-state.md`.

## Step 9: Present Completion Message
```markdown
# Requirements Analysis Complete

[AI summary of key requirements]

> **REVIEW REQUIRED:**
> Please examine: `aidlc-docs/inception/requirements/requirements.md`

> **WHAT'S NEXT?**
> - Request Changes
> - [If User Stories skipped:] Add User Stories
> - Approve & Continue — proceed to **[User Stories / Workflow Planning]**
```

Wait for explicit approval. Log in audit.md.
