---
name: inception-requirements
description: Gather and analyze requirements with adaptive depth. Creates requirement questions and generates requirements document.
argument-hint:
disable-model-invocation: true
model: opus
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(mkdir *)
---

# AI-DLC: Requirements Analysis (Inception)

ultrathink

Gather and analyze requirements for the project. This stage always executes with adaptive depth.

**Role**: Assume the role of a product owner.

## Prerequisites Check

1. Read `aidlc-docs/aidlc-state.md` — verify Workspace Detection is complete
2. If brownfield: verify Reverse Engineering is complete (or skipped)
3. Log stage start in `aidlc-docs/audit.md`

## Execution

Follow [requirements-analysis-detail.md](${CLAUDE_PLUGIN_ROOT}/reference/inception/requirements-analysis-detail.md):

### Phase 1: Analysis
1. **Load context** — reverse engineering artifacts if brownfield
2. **Analyze user request** — clarity, type, scope, complexity
3. **Determine depth** — minimal / standard / comprehensive
4. **Assess current requirements** — analyze all user-provided content

### Phase 2: Questions
5. **Completeness analysis** — evaluate ALL areas (functional, NFR, user scenarios, business, technical, quality)
6. **Generate questions** → `aidlc-docs/inception/requirements/requirement-verification-questions.md`
   - Use [Answer]: tag format per [question-format-guide.md](${CLAUDE_PLUGIN_ROOT}/reference/common/question-format-guide.md)
   - Always include "Other" as last option
7. **Inform user** and WAIT for answers

### Phase 3: Document
8. **Read answers** — validate completeness, check for contradictions
9. **If ambiguities**: create clarification questions, wait for resolution
10. **Generate requirements** → `aidlc-docs/inception/requirements/requirements.md`

## Completion

1. Update `aidlc-state.md` — mark Requirements Analysis complete
2. Present completion message with summary
3. **WAIT for user approval**
4. Log approval in audit.md
5. Guide to next: `/aidlc:inception-user-stories` or `/aidlc:inception-workflow-planning`

## Reference Files

- [Requirements Analysis Detail](${CLAUDE_PLUGIN_ROOT}/reference/inception/requirements-analysis-detail.md)
- [Question Format Guide](${CLAUDE_PLUGIN_ROOT}/reference/common/question-format-guide.md)
- [Depth Levels](${CLAUDE_PLUGIN_ROOT}/reference/common/depth-levels.md)
- [Overconfidence Prevention](${CLAUDE_PLUGIN_ROOT}/reference/common/overconfidence-prevention.md)

## Critical Rules

- NEVER ask questions in chat — ALL questions in `.md` files with `[Answer]:` tags
- ALWAYS create questions unless requirements are exceptionally clear
- Analyze ALL answers for ambiguities before proceeding
- Do NOT proceed with unresolved contradictions
- Append to audit.md — never overwrite
