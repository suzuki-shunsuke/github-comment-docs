#!/usr/bin/env bash

set -eu

cd "$(dirname "$0")/.."

echo "---
sidebar_position: 400
---

# Usage

<!-- This is generated by scripts/generate-usage.sh. Don't edit this file directly. -->

$(github-comment help-all)" > docs/usage.md
