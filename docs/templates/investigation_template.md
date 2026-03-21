# Investigation: [topic]

## Metadata
**Author(s):** [Agent/Human Name]
**Date Created:** [YYYY-MM-DD]
**Date Updated:** [YYYY-MM-DD]
**Status:** Draft | In Progress | Completed
**Related Links:** [issue / doc / dashboard / PR]

## Goal
Коротко: что исследуем, почему это важно, в каком контексте это происходит, какой результат считаем полезным.

## Problem Statement

- Что именно наблюдаем.
- Где это проявляется.
- Почему это считается проблемой или источником неопределенности.
- Что уже известно наверняка.

## Scope

- In scope: что входит в текущее исследование.
- Out of scope: что сознательно не исследуем сейчас.
- Constraints: доступы, время, среда, стоимость, чувствительность данных, зависимость от внешних команд.

## Success Criteria

- Какие вопросы должны получить однозначный ответ.
- Какие артефакты должны появиться в конце: finding, decision memo, fix plan, dashboard, test, repro, runbook.

## Working Hypotheses

| ID | Hypothesis | Why plausible | How to validate | Status |
| --- | --- | --- | --- | --- |
| `H1` | [Краткая гипотеза] | [Сигнал / наблюдение] | [Проверка / эксперимент] | `pending` |

## Evidence

### Canonical Sources

- Основной источник истины: система записи, контракт, владелец процесса, первичный лог, база, API, документ.
- Secondary sources: кеши, derived tables, локальные выгрузки, пользовательские репорты.
- Что не считается reliable source of truth.

### Relevant Artifacts

| Artifact | Type | Why it matters | Access / Link |
| --- | --- | --- | --- |
| `[artifact name]` | `code / log / metric / query / doc / trace / ticket` | [Причина] | [Ссылка] |

## Plan

| Step | Question | Check | Expected Signal | Status |
| --- | --- | --- | --- | --- |
| `1. Baseline` | [Что нужно понять сначала] | [Команда / запрос / чтение кода] | [Что должно стать ясным] | `in_progress` |
| `2. Evidence` | [Какую гипотезу проверяем] | [Эксперимент / воспроизведение / diff] | [Сигнал] | `pending` |
| `3. Decision` | [Какой вывод нужно подтвердить] | [Финальная проверка] | [Решение / fix plan / no-action] | `pending` |

## Methods and Experiments

| Method | Purpose | Expected signal | Status |
| --- | --- | --- | --- |
| `[reproduction / query / diff / trace / user interview / load test]` | [Зачем] | [Что должно измениться или подтвердиться] | `pending` |

## Findings

| Source / Experiment | Scope | Result | Confidence | Notes |
| --- | --- | --- | --- | --- |
| `[artifact or method]` | `[subset / environment / timeframe]` | `[signal]` | `low / medium / high` | [Комментарий] |

## Interpretation

- Подтвержденные факты без интерпретации.
- Как findings меняют понимание проблемы.
- Какая гипотеза сейчас ведущая и почему.
- Какие альтернативные объяснения уже отброшены.

## Next Actions

- `Action:` [что делаем дальше]
  `Owner:` [кто]
  `Verification:` [как поймем, что действие сработало]

## Status

- Что уже подтверждено.
- Что еще нужно для завершения расследования.
