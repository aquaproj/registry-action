#!/usr/bin/env bash

set -euo pipefail

pkgs=$1

while read -r pkg; do
    desc=$(yq ".packages[0].description" "pkgs/$pkg/registry.yaml")
    repo_owner=$(yq ".packages[0].repo_owner" "pkgs/$pkg/registry.yaml")
    repo_name=$(yq ".packages[0].repo_name" "pkgs/$pkg/registry.yaml")
    if [ "$repo_owner" == "null" ] || [ "$repo_name" == "null" ]; then
        echo "$pkg - $desc"
        continue
    fi
    echo "[$pkg](https://github.com/$repo_owner/$repo_name) - $desc"
done <<< "$pkgs"
