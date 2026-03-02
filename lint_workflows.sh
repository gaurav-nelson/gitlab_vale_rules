#!/bin/bash

set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

if ! command -v actionlint >/dev/null 2>&1; then
  echo "Error: actionlint is not installed."
  echo "Install it on macOS with: brew install actionlint"
  exit 1
fi

echo "Linting GitHub workflows in .github/workflows..."
cd "$SCRIPT_DIR"
actionlint

echo "✅ Workflow linting passed"
