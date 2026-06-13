# `.claude/` — agent harness for this repository

This directory is the Claude Code-specific harness. It is **real and adoptable**: copy it into a
target repository and adapt the placeholders. It is also a bootstrap artifact — keep only the
parts a given repo needs.

Contents:

- `settings.json` — permissions (allow / deny). The deterministic guardrail layer.
- `agents/` — sub-agent templates (read-only by default; context firewalls). *(added in P3)*
- `skills/` — skills with progressive disclosure (`<name>/SKILL.md`). *(added in P3)*
- `commands/` — slash-command scaffolds. *(added in P3)*

## `settings.json` — permissions

`permissions.allow` pre-approves safe, read-mostly commands so the agent isn't prompted for them.
`permissions.deny` blocks destructive operations outright. This repo's allow-list covers the
commands an agent legitimately runs here (`rg`, `git diff`, `./scripts/check-docs.sh`, …).

**Adopting in another repo:** add your own verify-gate commands to `allow` — e.g. your
package manager, `[typecheck]`, `[lint]`, `[unit tests]` — and keep the `deny` list. Do not
broaden `deny` away from destructive operations.

## Enforcement hook loop (opt-in — frontier: partial even in mature harnesses)

The strongest version of "mechanisms, not prompts" is a hook loop that runs the verify gate
**regardless of whether the agent remembered to**. It is shipped here as an **opt-in scaffold**,
not enabled by default, because a deterministic Stop/PostToolUse hook changes a repo's live agent
behavior and the full loop is still frontier.

### 1. Git pre-commit hook (stack-agnostic)

`.githooks/pre-commit` runs the verify gate before each commit. Enable it per clone:

```bash
git config core.hooksPath .githooks
```

It does nothing until you opt in (git uses `.git/hooks` by default).

### 2. Claude Code hooks (optional)

To make the verify gate fire after edits and before the agent stops, add a `hooks` block to
`settings.json`. Example (adapt the command to your `[verify command]`):

```json
"hooks": {
  "PostToolUse": [
    { "matcher": "Edit|Write", "hooks": [{ "type": "command", "command": "./scripts/check-docs.sh" }] }
  ],
  "Stop": [
    { "hooks": [{ "type": "command", "command": "./scripts/check-docs.sh" }] }
  ]
}
```

Start with `PostToolUse` (advisory) before adopting a blocking `Stop` hook.

See `docs/config_layers.md` for how team / module / personal layers compose, and
`AGENTS.md` for the verify gate this repo uses.
