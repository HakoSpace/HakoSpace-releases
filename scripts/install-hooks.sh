#!/bin/bash
# install-hooks.sh — 安裝 HakoSpace-releases 的 git hooks 到本地 .git/hooks/
#
# git hooks 不會跟著 repo clone（位於 .git/hooks/ 而非 tracked tree），
# 所以每次新 clone 都要手動跑這個 script 一次。
#
# 安裝的 hook：
#   - pre-commit: 擋下意外刪除 release metadata 的 commit

set -euo pipefail

# 顏色
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BOLD='\033[1m'
NC='\033[0m'

# 找 repo root
REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || true)
if [ -z "$REPO_ROOT" ]; then
    echo -e "${RED}此目錄不是 git repo${NC}" >&2
    exit 1
fi


# 警告 core.hooksPath override — 若有設，git 不會讀 .git/hooks/，
# 把 hook 裝到那裡形同沒裝。寧可拒絕安裝，也不要給 false sense of security。
CONFIGURED_HOOKS_PATH=$(git -C "$REPO_ROOT" config --get core.hooksPath || true)
if [ -n "$CONFIGURED_HOOKS_PATH" ]; then
    echo -e "${YELLOW}注意：偵測到 git config core.hooksPath = $CONFIGURED_HOOKS_PATH${NC}" >&2
    echo -e "${YELLOW}git 不會讀取 .git/hooks/，安裝到此處將無效。${NC}" >&2
    echo -e "${YELLOW}請手動把 hook 放到 $CONFIGURED_HOOKS_PATH/，或先 git config --unset core.hooksPath${NC}" >&2
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
HOOKS_SRC="$SCRIPT_DIR/hooks"
# 用 git rev-parse --git-path 同時 handle 一般 repo / worktree / submodule
HOOKS_DST=$(git -C "$REPO_ROOT" rev-parse --git-path hooks)

if [ ! -d "$HOOKS_SRC" ]; then
    echo -e "${RED}找不到 hooks source: $HOOKS_SRC${NC}" >&2
    exit 1
fi

mkdir -p "$HOOKS_DST"

installed=0
for hook in "$HOOKS_SRC"/*; do
    [ -f "$hook" ] || continue
    name=$(basename "$hook")
    dst="$HOOKS_DST/$name"

    # 若已存在且內容不同，備份
    if [ -f "$dst" ] && ! cmp -s "$hook" "$dst"; then
        backup="$dst.backup-$(date +%Y%m%d-%H%M%S)"
        cp "$dst" "$backup"
        echo -e "${YELLOW}既有 $name 已備份至 $(basename "$backup")${NC}"
    fi

    cp "$hook" "$dst"
    chmod +x "$dst"
    installed=$((installed + 1))
    echo -e "${GREEN}✓ 安裝 $name${NC}"
done

echo
echo -e "${BOLD}完成，安裝 $installed 個 hook 到 $HOOKS_DST/${NC}"
echo
echo "驗證："
echo "  - 嘗試 git rm releases/B*/CHANGELOG.md 應被 pre-commit 拒絕"
echo "  - 緊急 override：ALLOW_METADATA_DELETE=1 git commit ..."
