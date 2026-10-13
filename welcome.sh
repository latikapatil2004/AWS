#!/usr/bin/env bash

if [ -z "${1:-}" ]; then
  echo "Usage: bash welcome.sh <name>"
  exit 1
fi

echo "Welcome, $1!"
