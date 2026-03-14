#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

git diff --check

published_docs=(
  "README.md"
  "AGENTS.md"
  "AGENTS_template.md"
  "docs/index.md"
  "docs/agentic_engineering_guide.md"
)

banned_patterns=(
  "Hybrid Workflow"
  "The Hybrid Model"
  "Jay Canvas"
  "Jay Flow"
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
