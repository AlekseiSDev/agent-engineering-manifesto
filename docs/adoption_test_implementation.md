# Implementation Tracking: Adoption Test Harness

## Meta
**Author(s):** Codex
**Reviewer(s):** Aleksei Stepin
**Date Created:** 2026-03-14
**Date Updated:** 2026-03-14
**Status:** Completed

## Links

- Design Doc: `docs/adoption_test_system_design.md`
- Branch: `harness-engineering-hybrid`

## Core Transformation

Add a usage-based adoption test harness that prepares a fake repo, a prompt for a subagent, and a
checklist for manual evaluation of the result.

## Scope

- In scope: fixtures, scenario files, evaluation checklist, runner script, brief documentation.
- Out of scope: full automation of an external subagent CLI and an automatic quality score.

## Plan

| Step | Change | Exit Criteria | TDD Hook | Harness Update |
| --- | --- | --- | --- | --- |
| `1` | Add design + implementation trail | the repo has docs explaining the test structure | check the files exist | new docs for repeatable work |
| `2` | Create two fixture repos and scenarios | fixtures are concrete enough for adoption setup | the script can prepare a workspace by fixture name | fixture library |
| `3` | Add checklist and runner script | the script prepares prompt, workspace, and run artifacts | `bash -n` and dry runs pass for both fixtures | reusable adoption harness |
| `4` | Update README | README references the adoption test as part of repo capabilities | manual read-through | better discoverability |

## Progress

| Step | Status | Notes | Next |
| --- | --- | --- | --- |
| `1` | `done` | design and implementation docs added | — |
| `2` | `done` | added fixtures `minimal-service` and `telegram-agent-bridge` | — |
| `3` | `done` | script + checklist ready, dry run done | — |
| `4` | `done` | README updated | — |

## Verification

| Check | Type | Result | Notes |
| --- | --- | --- | --- |
| `bash -n scripts/run-adoption-eval.sh` | `shell` | `passed` | runner script syntax is correct |
| `./scripts/run-adoption-eval.sh minimal-service --output-root /tmp/adoption-evals` | `smoke` | `passed` | prepared a run directory with no external runner |
| `./scripts/run-adoption-eval.sh telegram-agent-bridge --output-root /tmp/adoption-evals` | `smoke` | `passed` | prepared a run directory with no external runner |
| `./scripts/check-docs.sh` | `repo` | `passed` | published docs pass the current guardrail |

## Deviations

- Instead of hard integration with one agent CLI, a generic runner hook was added via env vars and `--`.

## Risks / Follow-Ups

- A real run of the fixtures through a subagent with live review output is still needed.
- A third fixture for a monorepo or frontend-heavy repo may be worth adding later.

## Status

- The first iteration of the adoption-test harness is ready.
- Next meaningful step: use the fixtures as an acceptance test for the manifesto.
