#!/usr/bin/env bash

set -euo pipefail

files=$1
labels=$2

main() {
  if grep -E "target:" "$labels" > /dev/null 2>&1; then
    grep -E "target:" "$labels" | sed -E "s|^target:||"
  fi
  if grep -E "^pkgs/.*\.yaml" "$files" > /dev/null 2>&1; then
    grep -E "^pkgs/.*\.yaml" "$files" | sed -E "s|^pkgs/(.+)/[^/]+\.yaml|\1|"
  fi
}

main | sort -u
