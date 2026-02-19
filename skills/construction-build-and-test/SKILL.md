---
name: construction-build-and-test
description: Generate build instructions and comprehensive test strategy for all units.
argument-hint:
disable-model-invocation: true
model: opus
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(ls *), Bash(find *), Bash(mkdir *), Bash(npm *), Bash(npx *), Bash(bun *), Bash(cargo *), Bash(go *), Bash(python *), Bash(pip *), Bash(mvn *), Bash(gradle *)
---

# AI-DLC: Build and Test (Construction)

ultrathink

Generate comprehensive build and test instructions for all units. This stage runs once after all units complete code generation.

## Prerequisites Check

1. Read `aidlc-docs/aidlc-state.md` — verify Code Generation is complete for ALL units
2. If any unit incomplete: Inform user which units need code generation. **STOP.**
3. Log stage start in `aidlc-docs/audit.md`

## Execution

Follow [build-and-test-detail.md](${CLAUDE_PLUGIN_ROOT}/reference/construction/build-and-test-detail.md):

### Analysis
1. **Analyze testing requirements** — determine appropriate strategy:
   - Unit tests (already generated per unit)
   - Integration tests (between units/services)
   - Performance tests (if NFR requirements defined)
   - E2E tests, contract tests, security tests (as needed)

### Generate Instructions
2. **Build instructions** → `aidlc-docs/construction/build-and-test/build-instructions.md`
   - Prerequisites, dependencies, build steps, verification, troubleshooting
3. **Unit test instructions** → `aidlc-docs/construction/build-and-test/unit-test-instructions.md`
4. **Integration test instructions** → `aidlc-docs/construction/build-and-test/integration-test-instructions.md`
5. **Performance test instructions** (if applicable) → `aidlc-docs/construction/build-and-test/performance-test-instructions.md`
6. **Additional tests** (as needed):
   - contract-test-instructions.md
   - security-test-instructions.md
   - e2e-test-instructions.md

### Summary
7. **Generate test summary** → `aidlc-docs/construction/build-and-test/build-and-test-summary.md`

## Completion

1. Update `aidlc-state.md` — mark Build and Test complete
2. Present comprehensive results:
   - Build status
   - Test results per category
   - Generated files list
3. **WAIT for user approval**: "Ready to proceed to Operations stage?"
4. Log in audit.md

## Reference Files

- [Build and Test Detail](${CLAUDE_PLUGIN_ROOT}/reference/construction/build-and-test-detail.md)
- [Content Validation](${CLAUDE_PLUGIN_ROOT}/reference/common/content-validation.md)

## Critical Rules

- This runs ONCE for ALL units (not per-unit)
- Code Generation must be complete for ALL units before starting
- Generate appropriate test types based on project complexity
- Append to audit.md — never overwrite
