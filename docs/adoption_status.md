# Adoption Status (this repository)

A living map of which harness practices this repository has adopted, and how far. It makes the kit
self-describing: you can see what is enabled, what is a documented recipe, and what is deferred.
Template: `docs/templates/adoption_status_template.md`.

## Legend

- `✓` — implemented and working
- `partial` — partially in place (note the gap)
- `doc-only` — documented recipe, not mechanically enforced
- `deferred` — planned; a plug-point exists, not built yet
- `✗` — not needed / out of scope for this repo

## Status

### Foundations
| Practice | Status | Notes / location |
| --- | --- | --- |
| 4-step pipeline (UI/UX → design → impl → TDD) | `✓` | `README.md`, `AGENTS.md`; dogfooded via `docs/templates/` |
| Investigation entry path | `✓` | `docs/templates/investigation_template.md` |
| Verify gate | `✓` | `./scripts/check-docs.sh` (named in `AGENTS.md`) |
| Sanitized public docs | `✓` | enforced by `check-docs.sh` banned-pattern scan |

### Single-agent discipline
| Practice | Status | Notes / location |
| --- | --- | --- |
| Documentation genres (single-writer-per-fact) | `✓` | `docs/index.md` |
| Routing table | `✓` | `docs/index.md` |
| Decisions log | `✓` | `docs/decisions.md` (live) |
| Anti-pattern log | `✓` | `docs/anti-patterns.md` (0 entries; filled by fact, not seeded) |
| Decision distillation on completion | `doc-only` | step in `docs/templates/implementation_template.md` |

### Mechanical enforcement
| Practice | Status | Notes / location |
| --- | --- | --- |
| Verify-gate lint / checks | `✓` | banned-pattern scan + published-doc existence guard in `check-docs.sh` |
| Permissions (allow / deny) | `✓` | `.claude/settings.json` |
| Pre-commit / agent hooks | `partial` | opt-in scaffold `.githooks/pre-commit` + `.claude/README.md` (frontier) |
| Layered config (team / module / personal) | `doc-only` | `docs/config_layers.md`; this single-package repo has no module layer |

### Agent infrastructure
| Practice | Status | Notes / location |
| --- | --- | --- |
| Skills | `✓` | `.claude/skills/{create-spec,check-docs,docs-review}` |
| Read-only sub-agents | `✓` | `.claude/agents/{explore,code-reviewer,spec-writer}` (spec-writer write-scoped to `docs/`) |
| Slash commands | `partial` | one scaffold: `.claude/commands/parallel-review.md` |
| Agent-agnostic shim (`AGENTS.md` + `CLAUDE.md`) | `✓` | `CLAUDE_template.md` imports `@AGENTS.md` |

### Advanced / deferred
| Practice | Status | Notes / location |
| --- | --- | --- |
| Adoption test harness | `✓` | `tests/fixtures/`, `tests/evals/adoption_checklist.md`, `scripts/run-adoption-eval.sh` |
| Outcome evaluation of the harness | `deferred` | plug-point in `tests/evals/adoption_checklist.md` ("Future: outcome metrics") |
| Generator–evaluator review | `deferred` | plug-point in `.claude/agents/code-reviewer.md` |
| Autonomous long-horizon orchestration | `deferred` | plug-point in `docs/templates/implementation_template.md` (handoff artifact) |

## Notes

- This map is itself an adoption-legibility artifact; keep it honest. `✗ not needed` and `deferred`
  are legitimate statuses — don't inflate to `✓`.
- The three `deferred` rows are the next horizon; each has a real plug-point in the repo, not just
  an intention here.
