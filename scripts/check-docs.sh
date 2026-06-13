#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

git diff --check

# Canonical, published prose docs scanned for banned terminology.
# Negative-example content (docs/anti-patterns.md, .claude/skills/*) is intentionally
# excluded: it legitimately quotes banned terms as "what not to do". Add a file here only
# in the same change that creates it (the existence guard below fails on a missing file).
published_docs=(
  "README.md"
  "AGENTS.md"
  "AGENTS_template.md"
  "CLAUDE_template.md"
  "docs/index.md"
  "docs/config_layers.md"
  "tests/evals/adoption_checklist.md"
)

# Fail loudly if a published doc is missing. Without this guard, rg's "file not found"
# (exit 2) is swallowed by the 2>/dev/null below and the pattern scan passes vacuously.
missing=0
for doc in "${published_docs[@]}"; do
  if [[ ! -f "$doc" ]]; then
    echo "Missing published doc: $doc" >&2
    missing=1
  fi
done
if [[ "$missing" -ne 0 ]]; then
  echo "check-docs: published_docs is out of sync with the repository." >&2
  exit 1
fi

banned_patterns=(
  "Hybrid Workflow"
  "The Hybrid Model"
  "3-step pipeline"
  "globalState"
  "@test-suite-all"
  "feature_name_system_design_doc"
)

for pattern in "${banned_patterns[@]}"; do
  if rg -n --fixed-strings "$pattern" "${published_docs[@]}" >/tmp/check-docs.out 2>/dev/null; then
    echo "Forbidden pattern found: $pattern" >&2
    cat /tmp/check-docs.out >&2
    rm -f /tmp/check-docs.out
    exit 1
  fi
done

rm -f /tmp/check-docs.out

echo "Docs checks passed."
