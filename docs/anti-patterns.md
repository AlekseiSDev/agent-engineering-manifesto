# Anti-Patterns

A living log of mistakes that recur, and the durable fix for each. This is the WHAT-keeps-going-wrong
genre (see `docs/index.md` → Documentation Genres).

## The trigger: the second time, not the first

Add an entry when the **same class of mistake happens a second time** — not on the first
occurrence (that's noise) and not preventively (that's speculation). The first time, fix it and
move on. The second time, it is a pattern: record it here.

When you record it, prefer the **strongest available durable fix**, in this order:

1. A **mechanical rule** that makes the mistake impossible or caught automatically (a lint rule, a
   type, a test, a `check` in the verify gate). For an architectural invariant, this beats prose.
2. A **structural doc fix** — clearer routing, better naming, an explicit constraint in the right
   genre — when the mistake is a confusion, not a code defect.
3. An **entry here** as the fallback record, and as the place to point a mechanical rule at later.

An entry here is a record of a recurring mistake; it is **not** a substitute for a rule when a rule
is possible. Do not re-state the same rule in every prompt, and do not bury the fix in a code
comment — both are feedforward that the next session may never read.

## Format

```
## AP-NN — [short title: what goes wrong]

**What:** [the mistake, concretely — what the agent tends to do]

**Why it's bad:**
- [consequence or structural reason]
- [second reason, if any]

**What to do instead:**
[the correct approach; a ❌ / ✅ contrast or a short rule. Use [placeholder] stand-ins,
not real banned terms or leaked specifics.]

**Reference / mechanical guard:** [link to the rule/test/doc that enforces this, or "none yet"]

---
```

## Conventions

- `AP-NN` — append-only numbering (`AP-01`, `AP-02`, …). Don't renumber.
- A superseded entry is **marked `superseded`** (with a pointer to its replacement), not deleted —
  the context of why it was wrong stays useful.
- Keep examples sanitized and stack-agnostic: use `[placeholder]` for any concrete term, path, or
  command. This file is excluded from the published-docs banned-pattern scan precisely because it
  documents mistakes by negative example; don't make it leak by quoting real banned strings.

## Entries

_None yet. Entries are added by fact, the second time a mistake recurs — not seeded in advance._
