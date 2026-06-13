# Implementation Tracking: Harness Uplift to JayFlow Form (P0–P4)

## Meta
**Author(s):** Coding agent (uplift session)
**Reviewer(s):** Repository operator
**Date Created:** 2026-06-13
**Date Updated:** 2026-06-13
**Status:** In Progress

## Links

- Brief: `manifesto_harness_uplift_brief.md` (operator working doc; non-published)
- Audit: `harness_sota_audit.md` (operator working doc; non-published)
- Reference harness: sibling repo (form only, product specifics stripped)
- Decisions log: `docs/decisions.md`
- Branch: `harness-uplift-jayflow-form`

## Core Transformation

The manifesto is strong on **feedforward** (docs the agent should read) but weak on
**feedback/enforcement** (mechanisms that fire regardless of whether the agent read them).
This uplift ports the *form* of a mature harness: terminology hygiene, documentation genres,
a routing table, an anti-pattern log, a decision-distillation step, a stack-agnostic verify
gate, real `.claude/` infrastructure (settings + sub-agents + skills + commands), layered
config, and an adoption-status tracker — while staying stack-agnostic, sanitized, English,
and "smallest useful set."

## Scope

- In scope: P0 hygiene/bug-fix, P1 genres/routing/anti-patterns/distillation, P2 mechanical
  enforcement slots, P3 agent infrastructure, P4 adoption legibility. Three deferred items get
  plug-points only (no implementation).
- Out of scope (deferred plug-points only): outcome-eval of the harness (7.1),
  generator-evaluator strong form (7.2), autonomous long-horizon orchestration (7.3).

## Plan

### Phase P0: Hygiene & bug-fix

- Change: fix `3-step`→`4-step pipeline (0–3)` (2 occurrences); strengthen `check-docs.sh`
  (existence guard + real `published_docs` + ban `3-step pipeline`); fix phantom
  `agentic_engineering_guide.md` reference in `run-adoption-eval.sh`.
- Exit Criteria: `rg "3-step"` empty in canonical docs; `check-docs.sh` passes and fails on
  regression / missing published doc; adoption smoke-run produces a clean `prompt.md`.
- Harness Update: this IS a harness update (the linter now catches the drift class it missed).

### Phase P1: Genre discipline, routing, anti-patterns, distillation

- Change: codify documentation genres (single-writer-per-fact) + evolve `docs/index.md` into a
  routing table; create `docs/anti-patterns.md` (AP-NN, 0 entries); add a distillation step to
  the implementation template; create + seed `docs/decisions.md`.
- Exit Criteria: genres + non-duplication rule documented; routing table covers all genres;
  anti-pattern log exists with trigger wired into AGENTS/CLAUDE; distillation step present.
- Harness Update: anti-pattern log + routing table become durable harness assets.

### Phase P2: Mechanical enforcement (stack-agnostic slots)

- Change: define a single `[verify command]` pre-PR gate; add real `.claude/settings.json`
  permissions + an opt-in `.githooks/pre-commit` scaffold (marked frontier/partial); document
  layered config (team/module/personal) in `docs/config_layers.md`.
- Exit Criteria: verify gate documented with no hardcoded package manager; settings.json valid
  JSON; config layers + override policy + anti-pattern documented.
- Harness Update: permissions + hook scaffold are the first deterministic enforcement layer.

### Phase P3: Agent infrastructure (real `.claude/`, no symlinks)

- Change: real skills (`create-spec`, `check-docs`, `docs-review`), read-only-default sub-agents
  (`explore`, `code-reviewer`, `spec-writer`), a `parallel-review` command, and the agent-agnostic
  shim model (AGENTS.md source of truth; CLAUDE.md thin `@AGENTS.md` import).
- Exit Criteria: ≥3 SKILL.md, ≥3 sub-agents with explicit write-scope, command scaffold, shim
  model documented and consistent with templates.
- Harness Update: sub-agents act as context firewalls; skills make practices invokable.

### Phase P4: Adoption legibility (capstone)

- Change: adoption-status tracker template + filled instance (legend ✓/partial/✗/doc-only/
  deferred); deferred 7.1 plug-point + new adoption-checklist items.
- Exit Criteria: tracker present with legend; deferred plug-points all noted, none implemented.
- Harness Update: the kit becomes self-describing about its own maturity.

## Progress

| Phase | Status | Notes | Next |
| --- | --- | --- | --- |
| `Pre-flight` | `completed` | Created this tracker + `docs/decisions.md`. | — |
| `P0` | `completed` | Fixed 3-step→4-step (2 files); existence guard + `3-step pipeline` ban in `check-docs.sh`; dropped phantom `agentic_engineering_guide.md` ref in `check-docs.sh` + `run-adoption-eval.sh`; gitignored operator working docs. Verified: pass + both fail-paths + adoption smoke-run clean. | — |
| `P1` | `completed` | Genres + routing table in `docs/index.md`; new `docs/anti-patterns.md` (AP-NN, 0 entries); distillation step + handoff plug-point in implementation template; wired genres/anti-patterns into AGENTS/README/AGENTS_template/CLAUDE_template + generic `docs_index_template`. Plus English-consistency pass (5 files). check-docs + git diff --check clean. | — |
| `P2` | `completed` | Verify gate named (`[verify command]` slot in templates; `check-docs.sh` named as this repo's gate in AGENTS.md); real `.claude/settings.json` (permissions) + `.claude/README.md`; opt-in `.githooks/pre-commit` (frontier/partial); `docs/config_layers.md` (layers + override policy + anti-pattern), registered in published_docs + routing table. settings.json valid JSON; check-docs clean. | — |
| `P3` | `completed` | Real skills (`create-spec`, `check-docs`, `docs-review`); read-only sub-agents (`explore`, `code-reviewer`, `spec-writer`→write-scoped to `docs/`; generator-evaluator plug-point in `code-reviewer`); `parallel-review` command; `CLAUDE_template.md` rewritten as a thin `@AGENTS.md` shim; README adoption steps + kit list updated; routing rows for skills/agents/commands. check-docs + git diff --check clean. | — |
| `P4` | `completed` | `docs/templates/adoption_status_template.md` + filled `docs/adoption_status.md` (legend ✓/partial/doc-only/deferred/✗), registered in published_docs + routing. Deferred 7.1 "Future: outcome metrics" note + new "Harness Mechanics" check items in adoption_checklist. All three deferred plug-points (7.1/7.2/7.3) in place, none implemented. check-docs + existence guard + git diff --check clean. | Final verification. |

## Verification

| Check | Type | Result | Notes |
| --- | --- | --- | --- |
| `./scripts/check-docs.sh` | linter | `pass (P0)` | Passes; fails on `3-step pipeline` regression and on missing published doc. |
| `rg "3-step"` (canonical docs) | grep | `pass (P0)` | Empty across canonical docs. |
| `./scripts/run-adoption-eval.sh minimal-service` | smoke | `pass (P0)` | Produces `prompt.md` with no phantom reference. |
| `.claude/settings.json` JSON parse | manual | `pass (P2)` | Valid JSON. |
| `git diff --check` | linter | `pass` | Clean after every phase. |

## Deviations

- **English-consistency pass (P1, added scope):** discovered Russian prose in five tracked files
  (`docs/templates/{implementation,system_design,investigation}_template.md`,
  `docs/adoption_test_system_design.md`, `docs/adoption_test_implementation.md`). The English-only
  guardrail + DoD apply to every shipped artifact, so all five were translated to English. The
  operator brief assumed existing files were already English; this corrects that assumption.

## Risks / Follow-Ups

- `published_docs` must only gain a file in the same commit that creates it (existence guard).
- `anti-patterns.md` and skills stay out of `published_docs` (negative-example content).
- `manifesto_harness_uplift_brief.md` + `harness_sota_audit.md` are non-published working docs;
  remove or gitignore before any public push.

## Status

- This implementation doc is the live tracker AND the cross-session handoff artifact: a future
  session reads it top-to-bottom to resume. (Here autonomous multi-session orchestration plugs
  in — deferred, see brief §7.3.)
- Completion gate: all phases' exit criteria met, Definition of Done satisfied, operator OK on
  each phase commit.
