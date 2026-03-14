# Agent Engineering Manifesto: Repository Instructions

## Project Context

- **Project:** Agent Engineering Manifesto
- **Architecture:** docs-first starter-kit repository
- **Purpose:** publish a reusable operating model for coding agents plus a small set of starter docs and templates
- **Key Technologies:** Markdown, Git, Bash, ripgrep
- **Main Entry Points:** `README.md`, `AGENTS.md`, `AGENTS_template.md`, `docs/index.md`, `docs/templates/`, `scripts/check-docs.sh`
- **Primary Verification Commands:** `./scripts/check-docs.sh`, `git diff --check`

## Documentation Routing

- Start with `README.md` for public framing and adoption guidance.
- Use `AGENTS.md` as the operative instruction set for this repository.
- Use `docs/index.md` to route inside the docs tree.
- Treat `AGENTS_template.md` as a sanitized, non-authoritative example/template.
- Treat `docs/templates/*` and `docs/agent_rules/*` as reusable starter artifacts, not as source-of-truth docs for this repository.

Do not copy this file blindly into another repository. Use `AGENTS_template.md` as the starting point for adoption.

## Canonical Model

- Default delivery path: 3-step pipeline
  1. concise system design
  2. implementation tracking
  3. TDD-first execution when logic changes
- Investigation is a separate entry path when the problem or solution space is unclear.
- Harness engineering is a cross-cutting practice: when agents repeat a mistake, add a guardrail instead of only patching the immediate task.
- Avoid the old hybrid label in published docs unless the user explicitly wants that historical wording.

## Core Principles

1. **Discovery Before Edits**: read the smallest relevant source before changing docs or templates.
2. **One Canonical Term per Concept**: if naming changes, update all canonical docs in the same change.
3. **Public Examples Must Stay Sanitized**: no company names, internal commands, leaked architecture, or private practices in published examples.
4. **Keep Facts Factual and Templates Reusable**: repo docs describe this repository; templates describe starter structure for target repositories.
5. **Harness the Mistake**: if a confusion repeats, add a script, rule, template fix, or better source-of-truth doc.
6. **Keep Docs Lean**: avoid duplicating the same rationale across `README.md`, `AGENTS.md`, `docs/index.md`, and `docs/agentic_engineering_guide.md`.

## Workflow Selection

- **New workflow model / new doc class / naming change**:
  create a concise system design doc before broad edits.
- **Multi-file cleanup or structural docs refactor**:
  maintain an implementation doc when the change spans `README.md`, `AGENTS.md`, `docs/`, and templates.
- **Unclear root cause or repeated agent confusion**:
  start with an investigation doc, then decide whether the fix is wording, structure, or harness.

## Repo-Specific Change Rules

- If you change canonical workflow terminology, update `README.md`, `AGENTS.md`, `docs/index.md`, and `docs/agentic_engineering_guide.md` together.
- If you change document naming conventions, update templates and all references in the same change.
- If you change `AGENTS_template.md`, verify that it stays public and sanitized.
- If you change starter factual docs, update the matching files in `docs/templates/` instead of introducing placeholder root docs in this repository.
- Prefer adding or improving a harness when the same documentation mistake could recur.

## Verification and Definition of Done

A documentation change is done only when:

- changed files agree on terminology and file naming;
- public-facing examples contain no private or project-external data;
- repo-specific docs are factual and templates remain reusable;
- `./scripts/check-docs.sh` passes;
- `git diff --check` passes.

## Git Discipline

- keep commits scoped to meaningful documentation or harness changes;
- rewrite local or unreviewed history when sanitizing leaked public content;
- do not push until the sanitized diff has been reviewed.
