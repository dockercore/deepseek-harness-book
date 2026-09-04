#!/usr/bin/env bash
set -euo pipefail

PROJECT_NAME="${CLOUDFLARE_PAGES_PROJECT:-deepseek-harness-book}"

python scripts/prepare_site.py
mkdocs build --strict
wrangler pages deploy output/site \
  --project-name="$PROJECT_NAME" \
  --branch=main \
  --commit-dirty=true