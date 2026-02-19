# Question Format Guide

## MANDATORY: All Questions in Dedicated Files

**CRITICAL**: NEVER ask questions directly in chat. ALL questions go in dedicated `.md` files.

## File Naming
- `{stage-name}-questions.md` in `aidlc-docs/` subdirectories
- Examples: `requirement-verification-questions.md`, `story-planning-questions.md`

## Question Structure

```markdown
## Question [Number]
[Clear, specific question text]

A) [First meaningful option]
B) [Second meaningful option]
C) Other (please describe after [Answer]: tag below)

[Answer]:
```

## Rules

- **"Other" is MANDATORY** as the LAST option for every question
- Only include meaningful options (don't pad to fill A-E)
- Minimum: 2 meaningful options + Other
- Maximum: 5 meaningful options + Other
- Options must be mutually exclusive and clear

## Workflow

1. Create question file with all questions
2. Inform user: "I've created {file} with [X] questions. Please fill in the [Answer]: tags."
3. Wait for user confirmation ("done", "completed", etc.)
4. Read file, extract answers, validate completeness
5. Check for contradictions and ambiguities
6. If issues found, create `{stage}-clarification-questions.md`
7. Resolve ALL contradictions before proceeding

## Contradiction Detection

Look for:
- Scope vs impact mismatch
- Risk vs breaking changes mismatch
- Vague responses: "depends", "maybe", "not sure", "mix of"
- Undefined terms or references

## Error Handling

- **Missing answers**: Request user to complete all questions
- **Invalid answers**: Request valid letter choice
- **Ambiguous answers**: Request letter choice or "Other" with description
