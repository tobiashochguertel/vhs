#!/bin/bash
# Regenerate GIFs from tape files using local vhs binary
# Requires: ffmpeg with libass support (brew install ffmpeg-full on macOS)
#
# Usage:
#   ./regenerate-gifs.sh              # Regenerate all GIFs
#   VHS_BIN=/path/to/vhs ./regenerate-gifs.sh  # Custom vhs binary

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VHS_BIN="${VHS_BIN:-$HOME/go/bin/vhs}"

# Add ffmpeg-full to PATH if installed (keg-only)
if [ -f "/opt/homebrew/opt/ffmpeg-full/bin/ffmpeg" ]; then
    export PATH="/opt/homebrew/opt/ffmpeg-full/bin:$PATH"
fi

if [ ! -f "$VHS_BIN" ]; then
    echo "Error: vhs binary not found at $VHS_BIN"
    echo "Set VHS_BIN environment variable to override"
    exit 1
fi

cd "$SCRIPT_DIR/examples"

for tape in *.tape; do
    echo "Generating $tape..."
    "$VHS_BIN" "$tape"
done

echo "Done! Generated $(ls -1 *.gif 2>/dev/null | wc -l) GIFs"
