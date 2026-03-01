# Agent Engineering Manifesto: AI-First Workflow

This document defines the mandatory workflow for AI Agents working on this project. These instructions take precedence over general instructions.

## 📋 Project Context
*(Agents: when copying this template, replace this section with the specific project overview, architecture, and tech stack of your target repository).*

- **Project:** [Project Name]
- **Architecture:** [Brief description of the architecture]
- **Key Technologies:** [Stack details, e.g., Next.js, Python, PostgreSQL]

## 🌟 Core Principles
1.  **Design Before Code**: Do not start feature implementation without a System Design document, unless explicitly asked by the user to skip it.
2.  **Plan Before Action**: Designs should be translated into a step-by-step Implementation Plan.
3.  **TDD as Definition of Done**: A step in the plan is complete when its corresponding tests pass.

---

## 🛠 Phase 1: System Design (docs/system_design_*.md)
Before writing any functional code, create a Design Doc.
- **Size**: 150-300 lines (300+ for core architecture).
- **Inspiration**: Google Design Docs.
- **Mandatory Sections**: Context & Goals, Proposed Design, Alternative Considered, Cross-cutting Concerns.
- **Review**: The agent must pause and ask for the user's review and approval of the System Design document before proceeding to Phase 2.

## 📝 Phase 2: Implementation Plan (docs/implementation_plan_*.md)
Break down the Design Doc into actionable technical steps.
- **TDD Focused**: Every step must define which tests will be written.
- **Granularity**: Each step should be small enough to be verified independently.
- **State Tracking**: Use `[ ]` for pending, `[x]` for completed.
- **Review**: Optionally, ask the user if they want to review the Implementation Plan before starting Phase 3.

## 🧪 Phase 3: Step-by-Step TDD Implementation
For each step in the Implementation Plan:
1.  **Red**: Write a failing test.
2.  **Green**: Write the minimum code to pass the test.
3.  **Refactor**: Clean up the code while keeping tests green.
4.  **Validate**: Verify against the Implementation Plan.

---

## ⚠️ Fragility & Risk Metrics

### Failure Propagation Rules
To reduce maintenance failures, follow these "Fragility" checks before proposing a plan:
- **Rule of Locality**: If a change requires you to touch more than 3 files, the design is becoming "Fragile." Propose a refactor to decouple instead of just fixing the bug.
- **Hidden Dependencies**: List any modules that rely on `globalState` (or project equivalent). If you touch core state, you must run the full test suite.

### Verification Protocol
For "Fragile" decisions, the agent MUST:
1. Generate a "Blast Radius Map" (list all files that import the modified module).
2. Write a failing integration test *before* making the fix.
3. Verify that zero unrelated tests fail.

---

## 🧠 Problem Reframing Protocol
Before implementing, agents must:
1. Extract the core transformation being requested.
2. Identify implicit state that should be explicit.
3. Propose 2-3 equivalent representations.
4. Select the one where invariants are checkable.

---

## 🤖 Agent Instructions
- If a user asks for a feature, first check if a Design Doc exists.
- If not, propose creating `docs/system_design_<feature_name>.md`.
- Do not skip the Implementation Plan unless explicitly instructed by the user.
- **Git Flow:** Each significant step of the Implementation Plan should be isolated in its own commit. Push to the remote repository only when requested by the user, unless the user explicitly asks to push after every commit.
