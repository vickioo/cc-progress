#!/usr/bin/env bash
# update-progress.sh - 半自动更新 progress docs
#
# 用法：
#   bash update-progress.sh scan    # 扫描 /tmp/handoff-*.json，打印摘要（不写）
#   bash update-progress.sh sync    # git add+commit+push progress docs
#
# TODO:
#   - 根据 handoff 文件名规则自动映射项目（ws0-* → RAYLINE_THEME）
#   - 自动 append 决策日志条目
#   - 钩到 .claude/settings.local.json 的 SessionEnd hook

set -euo pipefail

PROGRESS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="${PROGRESS_REPO_ROOT:-$HOME/service/cc-progress}"

cmd="${1:-scan}"

case "$cmd" in
  scan)
    echo "== handoff files in /tmp =="
    ls -lt /tmp/handoff-*.json 2>/dev/null | head -10 || echo "(none)"
    echo
    echo "== progress docs =="
    ls -lt "$PROGRESS_DIR"/*.md
    ;;

  sync)
    if [ ! -d "$REPO_ROOT/.git" ]; then
      echo "ERROR: progress repo not found at $REPO_ROOT"
      echo "Set PROGRESS_REPO_ROOT or clone vickioo/cc-progress first."
      exit 1
    fi
    # 同步 docs/progress/*.md 到 progress repo 根
    cp "$PROGRESS_DIR"/*.md "$REPO_ROOT/"
    cd "$REPO_ROOT"
    git add -A
    if git diff --cached --quiet; then
      echo "nothing to commit"
      exit 0
    fi
    git commit -m "sync progress from mycc docs $(date +%Y-%m-%d)"
    git push
    ;;

  *)
    echo "usage: $0 {scan|sync}"
    exit 1
    ;;
esac
