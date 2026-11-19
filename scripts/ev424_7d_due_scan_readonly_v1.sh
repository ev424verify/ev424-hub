#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
exec /usr/bin/bash "$SCRIPT_DIR/ev424_7d_due_scan_executor_v1.sh" READONLY "${1:-/home/desktop/experiment_A/ev424_pages_site}"
