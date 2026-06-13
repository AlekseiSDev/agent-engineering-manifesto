# System Design: Adoption Test Harness

## Meta
**Author(s):** Codex
**Reviewer(s):** Aleksei Stepin
**Date Created:** 2026-03-14
**Date Updated:** 2026-03-14
**Status:** Approved
**Related Links:** `tests/fixtures/`, `tests/evals/adoption_checklist.md`, `scripts/run-adoption-eval.sh`

## Context

- This repository describes practices for configuring coding agents, but its best test surface is
  not unit-level — it is real adoption behavior.
- We need a minimal, reproducible way to check that, given a short project description, an agent
  produces a sensible agent harness.
- The check should be useful without hard-wiring it to one CLI or one model.

## Goals

- [x] Provide a repeatable adoption smoke test for the manifesto.
- [x] Start with two fixture repositories of different shapes.
- [x] Support human evaluation of the result against an explicit checklist.
- [x] Keep an optional hook for an external runner without hard-coding a specific CLI syntax.

## Non-Goals

- Fully automated quality evaluation with a single final score.
- Hard integration with only `codex`, `claude-code`, or any single tool.
- Production-like fixture repositories with real business logic.

## Success Criteria

- The repository has at least two fixture repos for the adoption test.
- There is a checklist to evaluate the resulting setup.
- There is a script that prepares a workspace, prompt, and run artifacts for each fixture.
- The scenario can be run manually even without built-in integration with a specific agent CLI.

## Proposed Design

### Architecture Overview

- `tests/fixtures/<fixture>/seed/`
  - a minimal fake repo that is copied into a temporary workspace
- `tests/fixtures/<fixture>/scenario.md`
  - the fixture-specific task for the subagent
- `tests/evals/adoption_checklist.md`
  - a single rubric for evaluating the resulting agent harness
- `scripts/run-adoption-eval.sh`
  - prepares a run directory, workspace, prompt, and optional runner hook

### Key Decisions

| Decision | Why | Tradeoff |
| --- | --- | --- |
| Keep fixtures in the repository | simple reproducibility and review | we have to maintain fixture drift |
| Make evaluation human-first | this kind of quality compresses poorly into unit assertions | more manual evaluation |
| Keep the runner hook generic | we don't block on one CLI's syntax | run automation is not fully plug-and-play |

### Data / Contracts / APIs

- Runner script contract: fixture name as input; a run directory with prompt/checklist/workspace
  as output.
- If an external runner is passed after `--`, the script runs it in the workspace with env vars:
  - `ADOPTION_MANIFESTO_REPO`
  - `ADOPTION_FIXTURE`
  - `ADOPTION_WORKSPACE`
  - `ADOPTION_PROMPT_FILE`
  - `ADOPTION_CHECKLIST_FILE`

## Alternatives Considered

| Option | Why not chosen |
| --- | --- |
| Text instructions only, no script | awkward to reproduce and to save artifacts |
| Full automation for `codex` only | too early to fix a single runtime contract |
| One fixture instead of two | weak protection against overfitting to one scenario |

## Risks and Open Questions

- Two fixtures do not yet cover a wide range of repo shapes.
- Manual review will remain an important part of acceptance.
- An evaluator script for structural invariants on top of the checklist may be needed later.

## Status

- Sufficient for the first iteration of the harness.
- Next step: actually run the fixtures through a subagent and see whether the picture holds up.
