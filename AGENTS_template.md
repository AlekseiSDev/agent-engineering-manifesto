# AGENTS Template

This file is a sanitized example of how the manifesto can be adapted in a real repository.
For this repository, `AGENTS.md` is authoritative.
Use this file as a copy-and-edit starting point in another repository.

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

- Default path: 3-step pipeline
  1. system design
  2. implementation tracking
  3. TDD execution for logic changes
- Investigation comes first when the problem is not understood.
- Harness engineering is cross-cutting and should result in a durable guardrail.

## Core Principles

1. Discovery before code or doc edits.
2. Keep facts, rules, and templates separate.
3. Prefer one canonical filename and term per concept.
4. Treat verification as part of completion.
5. Sanitize public examples before committing or publishing.

## Workflow Selection

- **New feature / large refactor**:
  create a concise system design doc, then an implementation doc, then execute with TDD.
- **Bug / unclear root cause**:
  create an investigation doc first, then decide on the fix.
- **Repeated agent error**:
  update the harness with a rule, doc, template, or verification script.

## Repo Hygiene

- Replace placeholders, sample commands, and example paths before adoption.
- Remove organization-specific names, internal branch policies, and private operational details.
- Keep `AGENTS.md` short; move domain detail into smaller docs.
- Update `README.md`, `AGENTS.md`, and `docs/index.md` together when terminology changes.

## Verification

- Run the repository's documented verification commands.
- Search for stale terminology or leaked example data before publishing.
- Record known gaps explicitly if a check cannot be run.
