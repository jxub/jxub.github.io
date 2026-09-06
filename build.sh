#!/usr/bin/env bash
set -euo pipefail

HUGO_VERSION="0.127.0"

if command -v hugo >/dev/null 2>&1; then
  HUGO="hugo"
else
  BIN_DIR="$(pwd)/.hugo-bin"
  HUGO="$BIN_DIR/hugo"
  if [ ! -x "$HUGO" ]; then
    mkdir -p "$BIN_DIR"
    curl -sSL "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-amd64.tar.gz" \
      -o /tmp/hugo.tar.gz
    tar -xzf /tmp/hugo.tar.gz -C "$BIN_DIR" hugo
  fi
fi

"$HUGO" --minify
