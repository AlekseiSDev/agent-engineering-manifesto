# Adoption Status

A living map of which harness practices this repository has adopted, and how far. It makes the kit
**self-describing**: a new agent or contributor sees what is enabled at a glance, and what is
deliberately not. Fill it in for your repo and update it as practices land.

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
| Delivery pipeline (e.g. UI/UX → design → impl → TDD) | `[status]` | `[where]` |
| Investigation entry path | `[status]` | |
| Verify gate (`[verify command]`) | `[status]` | |
| Sanitized public docs | `[status]` | |

### Single-agent discipline
| Practice | Status | Notes / location |
| --- | --- | --- |
| Documentation genres (single-writer-per-fact) | `[status]` | |
| Routing table | `[status]` | |
| Decisions log | `[status]` | |
| Anti-pattern log | `[status]` | |
| Decision distillation on completion | `[status]` | |

### Mechanical enforcement
| Practice | Status | Notes / location |
| --- | --- | --- |
| Verify-gate lint / checks | `[status]` | |
| Permissions (allow / deny) | `[status]` | |
| Pre-commit / agent hooks | `[status]` | |
| Layered config (team / module / personal) | `[status]` | |

### Agent infrastructure
| Practice | Status | Notes / location |
| --- | --- | --- |
| Skills | `[status]` | |
| Read-only sub-agents | `[status]` | |
| Slash commands | `[status]` | |
| Agent-agnostic shim (`AGENTS.md` + `CLAUDE.md`) | `[status]` | |

### Advanced / deferred
| Practice | Status | Notes / location |
| --- | --- | --- |
| Adoption / outcome evaluation | `[status]` | |
| Generator–evaluator review | `[status]` | |
| Autonomous long-horizon orchestration | `[status]` | |

## How to use

- Update a row when a practice lands or changes status.
- Don't pad the table — `✗ not needed` is a legitimate, honest status.
- Pair every `✓` with a location so a reader can verify it.
