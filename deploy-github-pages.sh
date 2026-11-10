#!/usr/bin/env bash
# Deploy Inspiration Vibes to GitHub Pages (free, static, no build step).
#
# Prerequisites:
#   - git
#   - GitHub CLI (gh)  ->  https://cli.github.com  (or: winget install GitHub.cli)
#
# First run does a one-time `gh auth login` in your browser.
# Re-runs just push; the Actions workflow in .github/workflows/pages.yml deploys.

set -euo pipefail
cd "$(dirname "$0")"

REPO="${1:-inspiration-vibes}"
OWNER="$(gh api user -q .login)"
URL="https://${OWNER}.github.io/${REPO}/"

if ! command -v gh >/dev/null 2>&1; then
  echo "✗ GitHub CLI not found. Install it: https://cli.github.com"
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "→ One-time GitHub login (browser will open)…"
  gh auth login --hostname github.com --git-protocol https --web
fi

if gh repo view "$REPO" --json name >/dev/null 2>&1; then
  echo "→ Repo exists, pushing…"
  git remote get-url origin >/dev/null 2>&1 \
    || git remote add origin "https://github.com/${OWNER}/${REPO}.git"
  git push -u origin main
else
  echo "→ Creating repo ${OWNER}/${REPO} and pushing…"
  gh repo create "$REPO" --public --source=. --push
fi

echo "→ Enabling GitHub Pages (Actions build)…"
gh api -X POST "/repos/${OWNER}/${REPO}/pages" -f build_type=workflow >/dev/null 2>&1 || true

echo
echo "✓ Done. Deploy runs in the 'Deploy to GitHub Pages' workflow."
echo "  Site:  ${URL}"
echo "  Logs:  https://github.com/${OWNER}/${REPO}/actions"
