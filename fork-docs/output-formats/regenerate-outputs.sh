#!/bin/bash
# Regenerate all outputs from tape files using local vhs binary
# Requires: ttyd and ffmpeg (brew install vhs on macOS)
#
# Usage:
#   ./regenerate-outputs.sh              # Regenerate all outputs
#   VHS_BIN=/path/to/vhs ./regenerate-outputs.sh  # Custom vhs binary

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VHS_BIN="${VHS_BIN:-$HOME/go/bin/vhs}"

# Add ffmpeg-full to PATH if installed (keg-only on macOS)
if [ -f "/opt/homebrew/opt/ffmpeg-full/bin/ffmpeg" ]; then
    export PATH="/opt/homebrew/opt/ffmpeg-full/bin:$PATH"
fi

if [ ! -f "$VHS_BIN" ]; then
    echo "Error: vhs binary not found at $VHS_BIN"
    echo "Set VHS_BIN environment variable to override"
    exit 1
fi

cd "$SCRIPT_DIR/examples"

echo "Regenerating all outputs..."
echo ""

for tape in *.tape; do
    echo "Generating outputs from: $tape"
    "$VHS_BIN" "$tape"
done

echo ""
echo "Done! Generated outputs:"
echo "  GIFs: $(ls -1 *.gif 2>/dev/null | wc -l | tr -d ' ')"
echo "  MP4s: $(ls -1 *.mp4 2>/dev/null | wc -l | tr -d ' ')"
echo "  WebMs: $(ls -1 *.webm 2>/dev/null | wc -l | tr -d ' ')"
echo "  ASCIIs: $(ls -1 *.ascii 2>/dev/null | wc -l | tr -d ' ')"
echo "  TXTs: $(ls -1 *.txt 2>/dev/null | wc -l | tr -d ' ')"
echo "  TESTs: $(ls -1 *.test 2>/dev/null | wc -l | tr -d ' ')"
