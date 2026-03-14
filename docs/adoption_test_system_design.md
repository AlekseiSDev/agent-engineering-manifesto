# System Design: Adoption Test Harness

## Meta
**Author(s):** Codex
**Reviewer(s):** Aleksei Stepin
**Date Created:** 2026-03-14
**Date Updated:** 2026-03-14
**Status:** Approved
**Related Links:** `tests/fixtures/`, `tests/evals/adoption_checklist.md`, `scripts/run-adoption-eval.sh`

## Context

- Этот репозиторий описывает практики для настройки coding agents, но лучший test surface для него не unit-level, а реальное adoption behavior.
- Нужен минимальный, воспроизводимый способ проверить, что агент по короткому описанию проекта создает вменяемую агентскую обвязку.
- Проверка должна быть полезной и без жесткой привязки к одному CLI или одной модели.

## Goals

- [x] Дать повторяемый adoption smoke test для manifesto.
- [x] Начать с двух fixture-репозиториев разной формы.
- [x] Поддержать человеческую оценку результата по явному checklist.
- [x] Оставить опциональный hook для внешнего runner без зашивки конкретного синтаксиса CLI.

## Non-Goals

- Полностью автоматическая оценка качества с одним итоговым score.
- Жесткая интеграция только с `codex`, `claude-code`, или другим одним инструментом.
- Полноценные production-like fixture-репозитории с реальной бизнес-логикой.

## Success Criteria

- В репозитории есть минимум два fixture-репо для adoption test.
- Есть checklist, по которому можно оценить результат настройки.
- Есть script, который готовит workspace, prompt и run artifacts для каждого fixture.
- Сценарий можно прогнать вручную даже без встроенной интеграции с конкретным agent CLI.

## Proposed Design

### Architecture Overview

- `tests/fixtures/<fixture>/seed/`
  - минимальный fake repo, который будет копироваться во временный workspace
- `tests/fixtures/<fixture>/scenario.md`
  - fixture-specific задача для subagent
- `tests/evals/adoption_checklist.md`
  - единый rubric для оценки получившейся агентской обвязки
- `scripts/run-adoption-eval.sh`
  - подготавливает run directory, workspace, prompt и optional runner hook

### Key Decisions

| Decision | Why | Tradeoff |
| --- | --- | --- |
| Держать fixtures в репозитории | простая воспроизводимость и review | придется поддерживать fixture drift |
| Делать evaluation human-first | качество такого проекта плохо сжимается в unit assertion | больше ручной оценки |
| Оставить runner hook generic | не блокируемся на синтаксисе одного CLI | автоматизация запуска не полностью plug-and-play |

### Data / Contracts / APIs

- Контракт runner script: fixture name на входе, run directory с prompt/checklist/workspace на выходе.
- Если передан внешний runner после `--`, script запускает его в workspace с env vars:
  - `ADOPTION_MANIFESTO_REPO`
  - `ADOPTION_FIXTURE`
  - `ADOPTION_WORKSPACE`
  - `ADOPTION_PROMPT_FILE`
  - `ADOPTION_CHECKLIST_FILE`

## Alternatives Considered

| Option | Why not chosen |
| --- | --- |
| Только текстовая инструкция без script | неудобно воспроизводить и сохранять артефакты |
| Полная автоматизация только под `codex` | слишком рано фиксировать один runtime contract |
| Один fixture вместо двух | слабая защита от переобучения под один сценарий |

## Risks and Open Questions

- Два fixture пока не покрывают широкий спектр repo shapes.
- Manual review останется важной частью acceptance.
- Возможно позже понадобится evaluator script для структурных инвариантов поверх checklist.

## Status

- Достаточно для первой итерации harness.
- Следующий шаг: реально прогнать fixtures через subagent и посмотреть, нравится ли картинка.
