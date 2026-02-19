# Infrastructure Design — Detailed Steps

**Purpose**: Map logical components to actual infrastructure services.

## Prerequisites
- Functional Design complete
- NFR Design recommended

## Step 1: Analyze Design Artifacts
Read functional design and NFR design for the unit.

## Step 2: Create Plan
Plan with checkboxes for infrastructure mapping.

## Step 3: Generate Questions
Context-appropriate via [Answer]: tags:
- Deployment Environment: cloud provider, setup
- Compute: service choice (Lambda, ECS, EC2, etc.)
- Storage: database selection
- Messaging: queuing services
- Networking: load balancing, API gateway
- Monitoring: observability tooling
- Shared Infrastructure: sharing strategy

## Step 4: Store Plan
Save as `aidlc-docs/construction/plans/{unit-name}-infrastructure-design-plan.md`.

## Step 5: Collect and Analyze

## Step 6: Generate Artifacts
In `aidlc-docs/construction/{unit-name}/infrastructure-design/`:
- infrastructure-design.md
- deployment-architecture.md
- shared-infrastructure.md (if applicable)

## Step 7: Present Completion
```markdown
# Infrastructure Design Complete - [unit-name]

[AI summary]

> **REVIEW REQUIRED:**
> `aidlc-docs/construction/[unit-name]/infrastructure-design/`

> **WHAT'S NEXT?**
> - Request Changes
> - Continue to Next Stage — proceed to **Code Generation**
```

Wait for approval. Log in audit.md. Update state.
