# Claude Code Instructions

## Project Context

* **Project:** [Project name]
* **Architecture:** [Brief description]
* **Key Technologies:** [Stack]
* **Build Command:** [e.g. `npm run build`]
* **Test Command:** [e.g. `npm test`]
* **Lint Command:** [e.g. `npm run lint`]

## Documentation Routing

| Document | Purpose | When to read |
|----------|---------|--------------|
| `docs/ui-ux.md` | What we build from user perspective. Primary source of truth. | Before system design, before planning any phase |
| `docs/system_design.md` | Technical design: phases, entities, API contracts, architecture | Before implementation planning |
| `docs/decisions.md` | Log of architectural/design decisions (WHY) | Before proposing alternatives to existing patterns |
| `docs/anti-patterns.md` | Recurring mistakes (`AP-NN`) and their durable fixes | When a mistake recurs; before repeating a known-hard task |
| `docs/data_schema.md` | Data model reference | When working with DB, models, or migrations |
| `docs/testing_strategy.md` | Testing approach and conventions | When writing or modifying tests |
| `docs/index.md` | Full docs routing | When unsure where to look |

## Planning Phase (before writing code)

When asked to implement a phase or a feature:

1. Read the relevant phase section from `docs/system_design.md`
2. Read `docs/ui-ux.md` for affected user flows
3. Read `docs/decisions.md` to avoid contradicting prior decisions
4. Explore current code in affected directories (`ls`, `grep`, read key files)
5. Run existing tests to confirm baseline: `[TEST_COMMAND]`
6. Propose an implementation plan that includes test cases for each step
7. Wait for human approval before writing code

If the problem or root cause is unclear, start with investigation:
gather evidence, form hypotheses, verify — before proposing a plan.

## During Implementation

* TDD when changing business logic: Red → Green → Refactor
* Run tests after each meaningful change
* Verify each step against the plan before moving to the next

## Decision Log

When we make an architectural or design decision during implementation,
append it to `docs/decisions.md` in format:
```
- **[YYYY-MM-DD] Decision title**: What we decided. Why.
```
Do not duplicate existing entries. Read the file before appending.

When an implementation doc reaches Completed, distill its durable decisions into
`docs/decisions.md` and any durable conventions into `docs/agent_rules/`, so the archived
design doc is not mistaken for a source of truth.

## Code Style and Principles

* [Add your project-specific style rules here]
* Fallback: follow the Google style guide for the project's primary language
* Prefer low coupling and high cohesion between modules
* No dead code — remove unused imports, functions, variables
* Write clear error messages; avoid swallowing exceptions silently

## Harness Rules

When the same mistake happens a second time, add the strongest durable fix:
* code pattern / architectural invariant → a mechanical rule (lint rule, test, or check in the verify gate)
* workflow confusion → fix the routing or wording in the relevant doc
* missing convention → add it to `docs/agent_rules/`
* a recurring mistake worth recording → an `AP-NN` entry in `docs/anti-patterns.md`
