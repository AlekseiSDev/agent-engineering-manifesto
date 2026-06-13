# Investigation: [topic]

## Metadata
**Author(s):** [Agent/Human Name]
**Date Created:** [YYYY-MM-DD]
**Date Updated:** [YYYY-MM-DD]
**Status:** Draft | In Progress | Completed
**Related Links:** [issue / doc / dashboard / PR]

## Goal
Briefly: what we are investigating, why it matters, in what context it happens, and what result we
consider useful.

## Problem Statement

- What exactly we observe.
- Where it shows up.
- Why it is considered a problem or a source of uncertainty.
- What is already known for certain.

## Scope

- In scope: what this investigation covers.
- Out of scope: what we deliberately do not investigate now.
- Constraints: access, time, environment, cost, data sensitivity, dependency on external teams.

## Success Criteria

- Which questions must get an unambiguous answer.
- Which artifacts should exist at the end: finding, decision memo, fix plan, dashboard, test,
  repro, runbook.

## Working Hypotheses

| ID | Hypothesis | Why plausible | How to validate | Status |
| --- | --- | --- | --- | --- |
| `H1` | [short hypothesis] | [signal / observation] | [check / experiment] | `pending` |

## Evidence

### Canonical Sources

- The primary source of truth: system of record, contract, process owner, primary log, database,
  API, document.
- Secondary sources: caches, derived tables, local exports, user reports.
- What does not count as a reliable source of truth.

### Relevant Artifacts

| Artifact | Type | Why it matters | Access / Link |
| --- | --- | --- | --- |
| `[artifact name]` | `code / log / metric / query / doc / trace / ticket` | [reason] | [link] |

## Plan

| Step | Question | Check | Expected Signal | Status |
| --- | --- | --- | --- | --- |
| `1. Baseline` | [what to understand first] | [command / query / code read] | [what should become clear] | `in_progress` |
| `2. Evidence` | [which hypothesis we test] | [experiment / reproduction / diff] | [signal] | `pending` |
| `3. Decision` | [which conclusion to confirm] | [final check] | [decision / fix plan / no-action] | `pending` |

## Methods and Experiments

| Method | Purpose | Expected signal | Status |
| --- | --- | --- | --- |
| `[reproduction / query / diff / trace / user interview / load test]` | [why] | [what should change or be confirmed] | `pending` |

## Findings

| Source / Experiment | Scope | Result | Confidence | Notes |
| --- | --- | --- | --- | --- |
| `[artifact or method]` | `[subset / environment / timeframe]` | `[signal]` | `low / medium / high` | [comment] |

## Interpretation

- Confirmed facts without interpretation.
- How the findings change the understanding of the problem.
- Which hypothesis is now leading, and why.
- Which alternative explanations have already been ruled out.

## Next Actions

- `Action:` [what we do next]
  `Owner:` [who]
  `Verification:` [how we will know the action worked]

## Status

- What is already confirmed.
- What is still needed to close the investigation.
