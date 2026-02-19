# Adaptive Depth Levels

## Core Principle

When a stage executes, ALL its defined artifacts are created. "Depth" refers to the detail level within those artifacts.

## Stage Selection vs Detail Level

### Stage Selection (Binary)
- Workflow Planning decides: EXECUTE or SKIP for each stage
- If EXECUTE: Stage runs and creates ALL defined artifacts
- If SKIP: Stage doesn't run at all

### Detail Level (Adaptive)
- **Simple problems**: Concise artifacts with essential detail
- **Complex problems**: Comprehensive artifacts with extensive detail
- AI determines appropriate detail based on problem characteristics

## Factors Influencing Detail

1. **Request Clarity**: How clear and complete is the request?
2. **Problem Complexity**: How intricate is the solution space?
3. **Scope**: Single file → component → multiple components → system-wide?
4. **Risk Level**: Impact of errors or omissions?
5. **Context**: Greenfield vs brownfield, existing documentation?
6. **User Preferences**: Expressed preference for brevity or detail?

## Guiding Principle

**"Create exactly the detail needed — no more, no less."**

- Don't inflate simple problems with unnecessary detail
- Don't shortchange complex problems by omitting critical detail
- Let problem characteristics drive detail level naturally
