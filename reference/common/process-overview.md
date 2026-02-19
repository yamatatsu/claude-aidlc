# AI-DLC Process Overview

Technical reference for the AI-DLC adaptive workflow.

## Three-Phase Lifecycle

- **INCEPTION PHASE**: Planning & architecture — determines WHAT to build and WHY
- **CONSTRUCTION PHASE**: Design, implementation & test — determines HOW to build it
- **OPERATIONS PHASE**: Deployment & monitoring (placeholder for future expansion)

## Adaptive Workflow Sequence

Workspace Detection (always) → Reverse Engineering (brownfield only) → Requirements Analysis (always, adaptive depth) → User Stories (conditional) → Workflow Planning (always) → Application Design (conditional) → Units Generation (conditional) → Per-Unit Construction Loop → Build and Test (always)

## Always-Execute Stages
- Workspace Detection, Requirements Analysis, Workflow Planning, Code Generation, Build and Test

## Conditional Stages
- Reverse Engineering, User Stories, Application Design, Units Generation, Functional Design, NFR Requirements, NFR Design, Infrastructure Design

## Key Principles
- Stages execute only when they add value
- Each stage is independently evaluated
- Simple changes may skip conditional stages
- Complex changes get full treatment
- User can override any recommendation
- All questions in `.md` files with `[Answer]:` tags (never in chat)
- Standardized 2-option completion messages (Request Changes / Approve & Continue)
