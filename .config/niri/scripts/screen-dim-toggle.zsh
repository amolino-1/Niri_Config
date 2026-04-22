#!/usr/bin/env zsh
set -euo pipefail

GAMMASTEP=/usr/bin/gammastep
PKILL=/usr/bin/pkill
TIMEOUT=/usr/bin/timeout
STATE="$HOME/.cache/screen-warm.state"
TEMP=3200

mkdir -p "$HOME/.cache"

$PKILL -x wlsunset 2>/dev/null || true
$PKILL -x hyprsunset 2>/dev/null || true

if [[ -f "$STATE" ]]; then
  $TIMEOUT 1s $GAMMASTEP -x >/dev/null 2>&1 || true
  $PKILL -x gammastep 2>/dev/null || true
  rm -f "$STATE"
else
  $TIMEOUT 1s $GAMMASTEP -P -O "$TEMP" >/dev/null 2>&1 || true
  $PKILL -x gammastep 2>/dev/null || true
  : > "$STATE"
fi
