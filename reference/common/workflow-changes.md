# Mid-Workflow Changes

## Types of Changes

### 1. Adding a Skipped Stage
1. Confirm request with user
2. Check prerequisites are complete
3. Add stage to execution plan with rationale
4. Mark as "PENDING" in `aidlc-state.md`
5. Execute normally
6. Log in `audit.md`

### 2. Skipping a Planned Stage
1. Confirm request and warn about impact
2. Get explicit confirmation
3. Mark as "SKIPPED" in execution plan and state
4. Note: later stages may need manual intervention
5. Log in `audit.md`

### 3. Restarting Current Stage
1. Understand specific concerns
2. Offer: modify existing artifacts vs complete restart
3. If restart: archive artifacts, reset checkboxes, re-execute
4. Log reason for restart

### 4. Restarting Previous Stage
1. Assess impact on all dependent stages
2. Warn user about cascading re-work
3. If confirmed: archive all affected artifacts, reset all affected stages
4. Return to target stage and re-execute forward

### 5. Changing Depth Level
1. Confirm with user
2. Update execution plan
3. Only possible before or during stage (not after)

### 6. Pausing Workflow
1. Complete current step if possible
2. Update all checkboxes
3. Ensure `aidlc-state.md` is current
4. Log pause point in `audit.md`
5. On resume: detect existing project, load context, show status

## Guidelines
- **Always confirm** before destructive changes
- **Always archive** before making changes
- **Always log** changes in `audit.md`
- **Always validate** consistency after changes
- Workflow adapts to user needs

## Change Log Format
```markdown
## Change Request - [Stage Name]
**Timestamp**: [ISO 8601]
**Request**: [What user wants]
**Impact**: [What will be affected]
**Confirmation**: [User's response]
**Action**: [What was done]

---
```
