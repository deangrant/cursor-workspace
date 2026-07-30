#!/usr/bin/env sh
# afterFileEdit: auto-fix edited .md files (parity with biome --write; CI uses
# check-only).
. "$(dirname "$0")/lib/extract-file-path.sh"

file=$(extract_file_path) || exit 0

[ -z "$file" ] && exit 0
[ ! -f "$file" ] && exit 0

case "$file" in
  *.md) ;;
  *) exit 0 ;;
esac

exec pnpm exec markdownlint --fix -- "$file"