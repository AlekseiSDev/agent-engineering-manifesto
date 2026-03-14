# Implementation Tracking: Adoption Test Harness

## Meta
**Author(s):** Codex
**Reviewer(s):** Aleksei Stepin
**Date Created:** 2026-03-14
**Date Updated:** 2026-03-14
**Status:** Completed

## Links

- Design Doc: `docs/adoption_test_system_design.md`
- Branch: `harness-engineering-hybrid`

## Core Transformation

Добавить usage-based adoption test harness, который подготавливает фиктивный repo, prompt для subagent и checklist для ручной оценки результата.

## Scope

- In scope: fixtures, scenario files, evaluation checklist, runner script, краткая документация.
- Out of scope: полная автоматизация внешнего subagent CLI и автоматический quality score.

## Plan

| Step | Change | Exit Criteria | TDD Hook | Harness Update |
| --- | --- | --- | --- | --- |
| `1` | Добавить design + implementation trail | В репозитории есть docs с объяснением структуры теста | Проверка наличия файлов | Новые docs для повторяемой работы |
| `2` | Создать два fixture-репозитория и сценарии | Fixtures достаточно конкретны для adoption setup | Script может подготовить workspace по имени fixture | Fixture library |
| `3` | Добавить checklist и runner script | Script готовит prompt, workspace и run artifacts | `bash -n` и dry run для обоих fixtures проходят | Reusable adoption harness |
| `4` | Обновить README | README ссылается на adoption test как часть repo capabilities | Manual read-through | Better discoverability |

## Progress

| Step | Status | Notes | Next |
| --- | --- | --- | --- |
| `1` | `done` | Design и implementation docs добавлены | — |
| `2` | `done` | Добавлены fixtures `minimal-service` и `telegram-agent-bridge` | — |
| `3` | `done` | Script + checklist готовы, dry run выполнен | — |
| `4` | `done` | README обновлен | — |

## Verification

| Check | Type | Result | Notes |
| --- | --- | --- | --- |
| `bash -n scripts/run-adoption-eval.sh` | `shell` | `passed` | Синтаксис runner script корректен |
| `./scripts/run-adoption-eval.sh minimal-service --output-root /tmp/adoption-evals` | `smoke` | `passed` | Подготовлен run directory без внешнего runner |
| `./scripts/run-adoption-eval.sh telegram-agent-bridge --output-root /tmp/adoption-evals` | `smoke` | `passed` | Подготовлен run directory без внешнего runner |
| `./scripts/check-docs.sh` | `repo` | `passed` | Published docs проходят текущий guardrail |

## Deviations

- Вместо жесткой интеграции с одним agent CLI добавлен generic runner hook через env vars и `--`.

## Risks / Follow-Ups

- Нужен реальный прогон fixtures через subagent и живой review output.
- Возможно позже стоит добавить третий fixture под monorepo или frontend-heavy repo.

## Status

- Первая итерация adoption-test harness готова.
- Следующий meaningful step: использовать fixtures как acceptance test для manifesto.
