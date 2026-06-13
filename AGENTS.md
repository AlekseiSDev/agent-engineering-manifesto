# Agent Engineering Manifesto: Repository Instructions

## Project Context

* **Project:** Agent Engineering Manifesto
* **Architecture:** docs-first starter-kit repository
* **Purpose:** publish a reusable operating model for coding agents plus a small set of starter docs and templates
* **Key Technologies:** Markdown, Git, Bash, ripgrep
* **Main Entry Points:** `README.md`, `AGENTS.md`, `CLAUDE_template.md`, `AGENTS_template.md`, `docs/index.md`, `docs/templates/`, `scripts/check-docs.sh`
* **Primary Verification Commands:** `./scripts/check-docs.sh`, `git diff --check`

## Documentation Routing

* Start with `README.md` for public framing and adoption guidance.
* Use `AGENTS.md` as the operative instruction set for this repository.
* Use `docs/index.md` to route inside the docs tree; it maps every fact to its genre.
* Record decisions in `docs/decisions.md` (read it before proposing alternatives) and recurring mistakes in `docs/anti-patterns.md`.
* Treat `AGENTS_template.md` and `CLAUDE_template.md` as sanitized, non-authoritative example/templates.
* Treat `docs/templates/*` and `docs/agent_rules/*` as reusable starter artifacts, not as source-of-truth docs for this repository.
* In target repositories: `docs/ui-ux.md` is the primary source of truth for what is being built (user perspective). `docs/system_design.md` is derived from it. `docs/decisions.md` logs architectural decisions.

Do not copy this file blindly into another repository. Use `AGENTS_template.md` or `CLAUDE_template.md` as the starting point for adoption.

## Canonical Model

* Default delivery path: 4-step pipeline
  0. UI/UX specification — what we build from user perspective (human-authored)
  1. concise system design — derived from UI/UX spec
  2. implementation tracking — with research step before each plan
  3. TDD-first execution when logic changes
* Before writing an implementation plan for a phase, the agent reads the relevant system design section, affected UI/UX flows, existing decisions, and explores current code. This is the research step — lightweight, not a separate document.
* Investigation is a separate entry path when the problem or solution space is unclear.
* Harness engineering is a cross-cutting practice: when agents repeat a mistake, add a guardrail instead of only patching the immediate task.
* Avoid the old hybrid label in published docs unless the user explicitly wants that historical wording.

## Core Principles

1. **Discovery Before Edits**: read the smallest relevant source before changing docs or templates.
2. **One Canonical Term per Concept**: if naming changes, update all canonical docs in the same change.
3. **Public Examples Must Stay Sanitized**: no company names, internal commands, leaked architecture, or private practices in published examples.
4. **Keep Facts Factual and Templates Reusable**: repo docs describe this repository; templates describe starter structure for target repositories.
5. **Harness the Mistake**: the second time a confusion repeats, add the strongest durable fix — a mechanical rule (lint/test/check in the verify gate), a structural doc fix, or an `AP-NN` entry in `docs/anti-patterns.md`. Prefer a mechanical rule over prose for an architectural invariant.
6. **Keep Docs Lean**: avoid duplicating the same rationale across `README.md`, `AGENTS.md`, and `docs/index.md`.
7. **One Fact, One Genre (Single-Writer-Per-Fact)**: every fact lives in exactly one genre — WHY in `docs/decisions.md`, WHAT in the UI/UX spec and system designs, HOW in `docs/agent_rules/`, recurring mistakes in `docs/anti-patterns.md`. Do not duplicate a fact across genres, and do not restate in prose what types or tests already express. See `docs/index.md`.

## Workflow Selection

* **New workflow model / new doc class / naming change**:
  create a concise system design doc before broad edits.
* **Multi-file cleanup or structural docs refactor**:
  maintain an implementation doc when the change spans `README.md`, `AGENTS.md`, `docs/`, and templates.
* **Unclear root cause or repeated agent confusion**:
  start with an investigation doc, then decide whether the fix is wording, structure, or harness.

## Repo-Specific Change Rules

* If you change canonical workflow terminology, update `README.md`, `AGENTS.md`, `docs/index.md`, and templates together.
* If you change document naming conventions, update templates and all references in the same change.
* If you change `AGENTS_template.md` or `CLAUDE_template.md`, verify that they stay public and sanitized.
* If you change starter factual docs, update the matching files in `docs/templates/` instead of introducing placeholder root docs in this repository.
* Prefer adding or improving a harness when the same documentation mistake could recur; record a recurring mistake as an `AP-NN` entry in `docs/anti-patterns.md`.
* When making an architectural or design decision during work on this repository, append a one-liner to `docs/decisions.md`. When an implementation doc reaches `Status: Completed`, distill its durable decisions into `docs/decisions.md` and durable conventions into `docs/agent_rules/`.

## Verification and Definition of Done

A documentation change is done only when:

* changed files agree on terminology and file naming;
* public-facing examples contain no private or project-external data;
* repo-specific docs are factual and templates remain reusable;
* `./scripts/check-docs.sh` passes;
* `git diff --check` passes.

## Git Discipline

* keep commits scoped to meaningful documentation or harness changes;
* rewrite local or unreviewed history when sanitizing leaked public content;
* do not push until the sanitized diff has been reviewed.