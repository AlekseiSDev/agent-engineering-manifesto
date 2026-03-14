# Architecture

## Purpose

Use this document to answer:

- which runtimes or major components exist;
- how responsibilities are split;
- which dependencies are allowed;
- which flows are high-risk;
- where agents should start when estimating blast radius.

## System Map

| Component / Runtime | Responsibility | Depends on | Entrypoint |
| --- | --- | --- | --- |
| `[component]` | `[what it owns]` | `[dependencies]` | `[path / command / URL]` |

## Dependency Rules

- Allowed directions:
- Disallowed shortcuts:
- Shared-layer policy:

## Critical Flows

- `[flow name]`
  - Trigger:
  - Components:
  - Main risk:

## High-Risk Areas

- `[area]` — `[why it is fragile]`

## Local Entry Points

```bash
# Development or inspection commands
[command]
```

## Update Policy

- Update when a new runtime/component is introduced.
- Update when ownership or dependency direction changes.
