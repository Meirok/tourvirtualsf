#!/bin/bash
set -e
SRC="${1%/}"
NAME=$(basename "$SRC")
cd ~/tourvirtualsf
rm -rf "$NAME"
cp -R "$SRC" "$NAME"
rm -rf "$NAME/.git"
find "$NAME" -maxdepth 1 -name '*.zip' -delete
find "$NAME" \( -name '._*' -o -name '.DS_Store' \) -delete
git add .
git commit -m "tour $NAME" || true
git push
echo ""
echo "Listo: https://tourvirtualsf.com.ar/$NAME/"
