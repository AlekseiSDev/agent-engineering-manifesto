---
name: check-docs
description: Use this skill before proposing a commit or PR, and whenever you change README.md, AGENTS.md, CLAUDE_template.md, docs/index.md, or a template. It runs this repository's verify gate (./scripts/check-docs.sh) and explains how to fix a failure — terminology drift, a missing published doc, or whitespace errors.
---

# check-docs

Run the repository's verify gate and resolve failures before committing.

## When to use

- Before proposing any commit or PR.
- After editing a published doc (`README.md`, `AGENTS.md`, `CLAUDE_template.md`,
  `AGENTS_template.md`, `docs/index.md`, `docs/config_layers.md`,
  `tests/evals/adoption_checklist.md`).

## Steps

1. Run the verify gate:
   ```bash
   ./scripts/check-docs.sh
   ```
2. If it fails, read the message and fix the cause:
   - **`Forbidden pattern found: <X>`** — banned terminology leaked into a published doc. Replace it
     with the canonical term (the banned list guards against terminology drift and product leakage).
   - **`Missing published doc: <path>`** — a file in `published_docs` doesn't exist. Either create it
     (in the same change) or remove it from the list. Never register a file before it exists.
   - **`git diff --check`** trailing-whitespace / conflict-marker errors — clean them up.
3. Re-run until it passes.

## Checklist

- [ ] The gate passes locally.
- [ ] If you added a new canonical doc, you registered it in `published_docs` in the **same** change.
- [ ] Negative-example docs (`docs/anti-patterns.md`, skills) are **not** in `published_docs`.

## What this skill does NOT do

- It does not auto-fix content; it tells you what to fix.
- It does not replace review — it's the mechanical floor, not the ceiling.

## Reference

- The gate: `scripts/check-docs.sh`
- Opt-in pre-commit wiring: `.claude/README.md`
