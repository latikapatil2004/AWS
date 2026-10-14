#!/usr/bin/env bash

if [ ! -f .gitignore ]; then
  cat > .gitignore <<EOF_IGNORE
.env
*.log
node_modules/
dist/
EOF_IGNORE
  echo ".gitignore is created. review its rules for your project"
else
  echo ".gitignore is already exist; leaving it unchanged."
fi
