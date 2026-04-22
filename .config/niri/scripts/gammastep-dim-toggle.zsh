#!/usr/bin/env zsh
set -euo pipefail

GAMMASTEP=/usr/bin/gammastep
PKILL=/usr/bin/pkill

STATE_FILE="${HOME}/.cache/gammastep-warm-toggle"
WARM_TEMP=3200

mkdir -p "${HOME}/.cache"

if [[ -f "$STATE_FILE" ]]; then
  $PKILL -x gammastep 2>/dev/null || true
  rm -f "$STATE_FILE"
else
  $PKILL -x gammastep 2>/dev/null || true
  "$GAMMASTEP" -P -O "$WARM_TEMP" >/dev/null 2>&1 &
  : > "$STATE_FILE"
fi
