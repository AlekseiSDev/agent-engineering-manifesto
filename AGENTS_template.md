# AGENTS Template

This file is a sanitized example of how the manifesto can be adapted in a real repository.
For this repository, `AGENTS.md` is authoritative.
Use this file as a copy-and-edit starting point in another repository.

Bootstrap rule:

- copy this file into the target repository as the resident agent file and adapt it;
- do not keep `AGENTS_template.md` in the target repository unless the team intentionally wants to maintain local bootstrap assets;
- do not keep unused files from `docs/templates/` after they have served their setup purpose.

## Project Context

- **Project:** Documentation-first agent-enablement repository
- **Architecture:** docs-first starter kit
- **Key Technologies:** Markdown, Git, Bash, ripgrep
- **Main Entry Points:** `README.md`, `AGENTS.md`, `docs/index.md`, `docs/templates/`
- **Primary Verification Commands:** `./scripts/check-docs.sh`, `git diff --check`

## Documentation Routing

- Read `README.md` for the public framing of the repository.
- Use `AGENTS.md` for active repository rules.
- Use `docs/index.md` to find the right factual doc, rule doc, or template.
- Keep templates in `docs/templates/` reusable and generic.
- Keep example docs sanitized and clearly marked as examples.

## Canonical Model

- Default delivery path: 4-step pipeline (0–3)
  0. UI/UX specification — what we build from the user's perspective (usually human-authored)
  1. system design — derived from the UI/UX spec
  2. implementation tracking — with a lightweight research step before each plan
  3. TDD-first execution when business logic changes
- Investigation is a separate entry path when the problem or solution space is unclear.
- Harness engineering is cross-cutting and should result in a durable guardrail.

## Core Principles

1. Discovery before code or doc edits.
2. Keep facts, rules, and templates separate.
3. Prefer one canonical filename and term per concept.
4. Treat verification as part of completion.
5. Sanitize public examples before committing or publishing.
6. One fact, one genre: WHY in a decisions log, WHAT in product/design docs, HOW in convention docs, recurring mistakes in an anti-patterns log. Don't duplicate a fact across docs.

## Workflow Selection

- **New feature / large refactor**:
  create a concise system design doc, then an implementation doc, then execute with TDD.
- **Bug / unclear root cause**:
  create an investigation doc first, then decide on the fix.
- **Repeated agent error**:
  update the harness — prefer a mechanical rule (lint/test/check); otherwise a structural doc
  fix or an `AP-NN` entry in the anti-patterns log (added the second time, not the first).

## Repo Hygiene

- Replace placeholders, sample commands, and example paths before adoption.
- Remove organization-specific names, internal branch policies, and private operational details.
- Keep `AGENTS.md` short; move domain detail into smaller docs.
- Update `README.md`, `AGENTS.md`, and `docs/index.md` together when terminology changes.
- Treat template files as bootstrap-only by default: instantiate what is useful, then delete the leftovers.

## Verification

- Run the repository's documented verification commands.
- Search for stale terminology or leaked example data before publishing.
- Record known gaps explicitly if a check cannot be run.
