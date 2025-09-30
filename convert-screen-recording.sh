#!/usr/bin/env bash

# Convert .mov files (e.g. QuickTime screen recordings) to compressed .mp4

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 input.mov [output.mp4]"
  exit 1
fi

input="$1"
output="${2:-${input%.*}.mp4}"

ffmpeg -i "$input" \
  -c:v libx264 -preset fast -crf 23 \
  -c:a aac -b:a 128k \
  "$output"

echo "✅ Converted '$input' → '$output'"
