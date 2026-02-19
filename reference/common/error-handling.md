# Error Handling and Recovery

## Error Severity Levels

| Level | Description | Action |
|:------|:------------|:-------|
| **Critical** | Workflow cannot continue | Stop and ask user |
| **High** | Phase cannot complete as planned | Offer workarounds |
| **Medium** | Phase can continue with adjustments | Note and continue |
| **Low** | Minor issues | Log and continue |

## Common Errors

### Missing Artifacts
- **Cause**: Files deleted, moved, or never created
- **Solution**: Identify which stage created them, regenerate if stage was marked complete
- **Recovery**: Return to the creating stage and re-execute

### Corrupted State File
- **Cause**: Manual editing, incomplete previous run
- **Solution**: Ask user to start fresh or attempt recovery
- **Recovery**: Create backup, regenerate from existing artifacts

### Contradictory Requirements
- **Cause**: Unclear understanding, changing needs
- **Solution**: Create follow-up questions to resolve
- **Rule**: Do NOT proceed until resolved

### Incomplete Answers
- **Cause**: User skipped questions
- **Solution**: Highlight unanswered questions, provide examples
- **Rule**: Do NOT proceed until all required answers provided

### Inconsistent State
- **Cause**: State file doesn't match actual artifacts
- **Recovery**: Verify artifacts exist, update state file to reflect reality

## Recovery Procedures

### Partial Phase Completion
1. Load the phase plan file
2. Find last completed step (last `[x]` checkbox)
3. Resume from next uncompleted step
4. Verify prior steps are actually complete

### User Wants to Restart
1. Confirm user wants to restart
2. Archive existing artifacts: `{artifact}.backup`
3. Reset phase status in `aidlc-state.md`
4. Re-execute phase from beginning

### User Wants to Skip
1. Confirm user understands implications
2. Document skip reason in `audit.md`
3. Mark phase as "SKIPPED" in `aidlc-state.md`
4. Note: May cause issues in later phases

## Logging Format

```markdown
## Error - [Phase Name]
**Timestamp**: [ISO 8601]
**Error Type**: [Critical/High/Medium/Low]
**Description**: [What went wrong]
**Resolution**: [How resolved]
**Impact**: [Effect on workflow]

---
```

## Best Practices
1. Validate early — check inputs before starting work
2. Checkpoint often — update checkboxes immediately
3. Communicate clearly — explain what's happening
4. Ask questions — don't assume
5. Document everything in `audit.md`
