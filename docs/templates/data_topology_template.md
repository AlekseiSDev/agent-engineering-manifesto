# Data Topology

## Purpose

Use this document to answer:

- which runtime owns which data;
- what is the source of truth;
- where config entrypoints live;
- how to inspect data locally;
- where agents should not guess.

## Runtime to Storage Matrix

| Runtime / Component | Primary Storage | Ownership | Config Entrypoint | Local Access |
| --- | --- | --- | --- | --- |
| `[component]` | `[storage]` | `[entity group]` | `[path]` | `[command / URL]` |

## Canonical Sources

- Primary source of truth:
- Secondary or derived sources:
- Non-authoritative surfaces:

## Important Entities

| Entity / Table / Collection | Owner | Why it matters | Notes |
| --- | --- | --- | --- |
| `[entity]` | `[owner]` | `[reason]` | `[constraints]` |

## Connection Entry Points

- `[config file]`
- `[env file]`
- `[deployment manifest]`

## Local Inspection Recipes

```bash
[db or queue inspection command]
```

## Update Policy

- Update when storage systems or ownership change.
- Update when local inspection paths change materially.
