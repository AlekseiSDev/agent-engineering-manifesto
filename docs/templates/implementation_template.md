# Implementation Tracking: [Feature Name]

## Meta
**Author(s):** [Agent/Human Name]
**Reviewer(s):** [Agent/Human Name]
**Date Created:** [YYYY-MM-DD]
**Date Updated:** [YYYY-MM-DD]
**Status:** Draft | In Progress | Completed

## Links

- Design Doc: [Link]
- Investigation Doc: [Link if applicable]
- Branch: [branch-name]
- Related PR / Issue: [Link]

## Core Transformation

Briefly: what exactly changes in the system, and which invariant or behavior we want as the result.

## Scope

- In scope: what we are actually doing.
- Out of scope: what this implementation does not cover.

## Plan

### Step 1: [Step Name]

- Change: [what changes]
- Exit Criteria: [how we know the step is done]
- TDD Hook: [which failing test or check appears first]
- Harness Update: [which rule/script/doc to update if this step changes an invariant]

### Step 2: [Step Name]

- Change: [what changes]
- Exit Criteria: [how we know the step is done]
- TDD Hook: [which failing test or check appears first]
- Harness Update: [if applicable]

## Progress

| Step | Status | Notes | Next |
| --- | --- | --- | --- |
| `Step 1` | `in_progress` | [what is already done] | [what closes the step] |
| `Step 2` | `pending` | [comment] | [next action] |

## Verification

| Check | Type | Result | Notes |
| --- | --- | --- | --- |
| `[targeted test / integration / runtime / UI smoke-check]` | `[unit / integration / e2e / manual]` | `pending` | [comment] |

## Deviations

- How the implementation diverged from the design doc, and why.

## Distillation on Completion

When this doc reaches `Status: Completed`, the design doc becomes history. Distill its durable
knowledge outward so a future agent does not re-litigate it (single-writer-per-fact):

- **Durable WHY** — an accepted decision or trade-off (from the design's Key Decisions /
  Alternatives Considered) → one line in `docs/decisions.md` (+ a link back to this doc, or to an
  ADR if the decision was heavy).
- **Durable HOW** — a rule that is now a standard → `docs/agent_rules/`.
- **A mistake that recurred during the work** → `docs/anti-patterns.md` (`AP-NN`).

After distillation, the archived design doc is not a source of truth — the genres above are.

## Risks / Follow-Ups

- What is left out of scope.
- Which new harness/doc updates are worth making after merge.

## Status / Handoff

- Is this ready to complete? What still blocks release or handoff?
- This implementation doc is the **cross-session handoff artifact**: a future session reads it
  top-to-bottom to resume — current `Status`, what is done, what is next, and the open risks.
  _(Here autonomous multi-session orchestration plugs in — deferred.)_
