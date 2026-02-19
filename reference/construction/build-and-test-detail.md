# Build and Test — Detailed Steps

**Purpose**: Build all units and execute comprehensive testing.

## Prerequisites
- Code Generation complete for ALL units

## Step 1: Analyze Testing Requirements
- Unit tests (already generated per unit)
- Integration tests (between units/services)
- Performance tests (load, stress, scalability)
- End-to-end tests (complete workflows)
- Contract tests (API contracts between services)
- Security tests (vulnerabilities, auth)

## Step 2: Generate Build Instructions
Create `aidlc-docs/construction/build-and-test/build-instructions.md`:
- Prerequisites, dependencies, environment
- Build steps with commands
- Verification and troubleshooting

## Step 3: Generate Unit Test Instructions
Create `aidlc-docs/construction/build-and-test/unit-test-instructions.md`

## Step 4: Generate Integration Test Instructions
Create `aidlc-docs/construction/build-and-test/integration-test-instructions.md`

## Step 5: Generate Performance Test Instructions (if applicable)
Create `aidlc-docs/construction/build-and-test/performance-test-instructions.md`

## Step 6: Generate Additional Tests (as needed)
- contract-test-instructions.md
- security-test-instructions.md
- e2e-test-instructions.md

## Step 7: Generate Test Summary
Create `aidlc-docs/construction/build-and-test/build-and-test-summary.md`:
- Build status, test results (unit, integration, performance, additional)
- Overall status, next steps

## Step 8: Update State
Mark Build and Test complete in `aidlc-state.md`.

## Step 9: Present Results
```markdown
# Build and Test Complete

**Build Status**: [Success/Failed]
**Test Results**: [Summary]

Generated files in `aidlc-docs/construction/build-and-test/`

**Ready to proceed to Operations stage?**
```

Log in audit.md.
