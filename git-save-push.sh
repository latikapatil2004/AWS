#!/usr/bin/env bash
set -e

MESSAGE="${1:-}"
OPTION="${2:-}"

if [ -z "$MESSAGE" ]; then
  printf 'Usage: bash %s "commit message" [--gitignore]\n' "$0"
  exit 1
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Run inside a Git repository."
  exit 1
fi

BRANCH="$(git branch --show-current)"
if [ -z "$BRANCH" ]; then
  echo "No current branch. Switch to a branch first."
  exit 1
fi

if [ "$OPTION" = "--gitignore" ] && [ ! -f .gitignore ]; then
  printf '.env\n*.log\nnode_modules/\ndist/\n' > .gitignore
  echo ".gitignore created. Review its rules for your project."
fi

echo "Current branch: $BRANCH"
echo "Review current working-tree status:"
git status

git add --all

echo "Status after staging:"
git status

echo "Review staged changes before continuing:"
git diff --cached

if git diff --cached --quiet; then
  echo "No staged changes to commit. Nothing was committed or pushed."
  exit 0
fi

read -r -p "Create commit on $BRANCH? (y/N): " ANSWER
case "$ANSWER" in
  y|Y|yes|YES) ;;
  *) echo "Cancelled; no commit or push."; exit 0 ;;
esac

git commit -m "$MESSAGE"

read -r -p "Push $BRANCH to origin now? (y/N): " PUSH_ANSWER
case "$PUSH_ANSWER" in
  y|Y|yes|YES) git push -u origin "$BRANCH" ;;
  *) echo "Commit kept locally; push skipped." ;;
esac
