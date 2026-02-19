# AI-DLC Terminology

## Phase vs Stage
- **Phase**: High-level lifecycle phase (INCEPTION, CONSTRUCTION, OPERATIONS)
- **Stage**: Individual workflow activity within a phase (e.g., Requirements Analysis, Code Generation)

## Three Phases

| Phase | Purpose | Focus |
|:------|:--------|:------|
| INCEPTION | Planning & Architecture | WHAT and WHY |
| CONSTRUCTION | Design, Implementation & Test | HOW |
| OPERATIONS | Deployment & Monitoring | Future expansion |

## Architecture Terms

| Term | Definition | Usage Context |
|:-----|:-----------|:-------------|
| **Unit of Work** | Logical grouping of stories for development | Planning & decomposition |
| **Service** | Independently deployable component | Microservices architecture |
| **Module** | Logical grouping within a service/monolith | Internal organization |
| **Component** | Reusable building block (class, function, package) | Design & implementation |

## Stage Terminology

- **Planning**: Creating a plan with questions and checkboxes
- **Generation**: Executing the plan to create artifacts

## Depth Levels
- **Minimal**: Quick, focused execution for simple changes
- **Standard**: Normal depth for typical projects
- **Comprehensive**: Full depth for complex/high-risk projects

## Artifact Types
- **Plans**: Documents with checkboxes guiding execution (`aidlc-docs/plans/`)
- **Artifacts**: Generated outputs from executing plans
- **State Files**: `aidlc-state.md` (progress), `audit.md` (audit trail)

## Stage Types
- **ALWAYS**: Always executes (Workspace Detection, Requirements Analysis, Workflow Planning, Code Generation, Build and Test)
- **CONDITIONAL**: Executes based on assessment (all others)

## Abbreviations
- **AI-DLC**: AI-Driven Development Life Cycle
- **NFR**: Non-Functional Requirements
- **UOW**: Unit of Work
