# Reverse Engineering — Detailed Steps

**Execute when**: Brownfield project detected
**Skip when**: Greenfield project

## Step 1: Multi-Package Discovery
- Scan all packages and relationships via config files
- Classify: Application, CDK/Infrastructure, Models, Clients, Tests
- Discover infrastructure (CDK, Terraform, CloudFormation)
- Map build systems and dependencies
- Identify service architecture (Lambda, containers, APIs, data stores)
- Analyze code quality indicators

## Step 2: Generate Business Overview
Create `aidlc-docs/inception/reverse-engineering/business-overview.md`:
- Business context diagram (Mermaid)
- Business description, transactions, dictionary
- Per-component business descriptions

## Step 3: Generate Architecture Documentation
Create `aidlc-docs/inception/reverse-engineering/architecture.md`:
- System overview and architecture diagram
- Component descriptions (purpose, responsibilities, dependencies, type)
- Data flow sequence diagrams
- Integration points (APIs, databases, third-party)
- Infrastructure components

## Step 4: Generate Code Structure
Create `aidlc-docs/inception/reverse-engineering/code-structure.md`:
- Build system details
- Key classes/modules hierarchy
- Existing files inventory with purposes
- Design patterns in use
- Critical dependencies

## Step 5: Generate API Documentation
Create `aidlc-docs/inception/reverse-engineering/api-documentation.md`:
- REST API endpoints
- Internal APIs and interfaces
- Data models with fields, relationships, validation

## Step 6: Generate Component Inventory
Create `aidlc-docs/inception/reverse-engineering/component-inventory.md`:
- Application, Infrastructure, Shared, Test packages with counts

## Step 7: Generate Technology Stack
Create `aidlc-docs/inception/reverse-engineering/technology-stack.md`

## Step 8: Generate Dependencies
Create `aidlc-docs/inception/reverse-engineering/dependencies.md`:
- Internal dependency diagram (Mermaid)
- External dependencies with versions and licenses

## Step 9: Generate Code Quality Assessment
Create `aidlc-docs/inception/reverse-engineering/code-quality-assessment.md`

## Step 10: Create Timestamp File
Create `aidlc-docs/inception/reverse-engineering/reverse-engineering-timestamp.md`

## Step 11: Update State
Mark Reverse Engineering complete in `aidlc-state.md`

## Step 12: Present Completion Message
```markdown
# Reverse Engineering Complete

[AI summary of key findings]

> **REVIEW REQUIRED:**
> Please examine artifacts at: `aidlc-docs/inception/reverse-engineering/`

> **WHAT'S NEXT?**
> - Request Changes — modify the analysis
> - Approve & Continue — proceed to **Requirements Analysis**
```

## Step 13: Wait for Approval
MANDATORY: Do not proceed until user explicitly approves. Log response in audit.md.
