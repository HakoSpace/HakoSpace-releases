#!/bin/bash
# cleanup-binaries.sh — 安全清除本地 HakoSpace release binary
#
# 為什麼需要：本地 releases/B<ver>/ 目錄會累積 ~350MB/版 的 binary。
# 過去用 `rm -rf releases/B<ver>/` 一次清掉，會連帶刪除 git-tracked
# metadata（CHANGELOG/latest.yml/SHA256SUMS）— 這正是事故起源。
#
# 此 script 只刪 binary 白名單，metadata 一律不動。
#
# 用法：
#   ./cleanup-binaries.sh              # dry-run，列出會刪什麼（不實際刪除）
#   ./cleanup-binaries.sh --apply      # 實際刪除
#   ./cleanup-binaries.sh --keep B2.6.3 [--keep B2.6.2 ...] --apply
#                                      # 保留指定版本不刪 binary

set -euo pipefail

# 顏色
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BOLD='\033[1m'
NC='\033[0m'

# 預設：dry-run
APPLY=0
KEEP_VERSIONS=()

while [ "$#" -gt 0 ]; do
    case "$1" in
        --apply)
            APPLY=1
            shift
            ;;
        --keep)
            shift
            [ "$#" -eq 0 ] && { echo -e "${RED}--keep 需要版本參數${NC}" >&2; exit 1; }
            KEEP_VERSIONS+=("$1")
            shift
            ;;
        -h|--help)
            # 抽出檔頭文件（# 用法 ~ 第一個空行），不抓到 set -euo
            sed -n '/^# 用法：/,/^$/p' "$0"
            exit 0
            ;;
        *)
            echo -e "${RED}未知參數: $1${NC}" >&2
            exit 1
            ;;
    esac
done

# cd 到 script 目錄（讓 ./releases 路徑正確）
cd "$(dirname "$0")"

if [ ! -d releases ]; then
    echo -e "${RED}找不到 releases/ 目錄，請在 HakoSpace-releases repo root 執行${NC}" >&2
    exit 1
fi

# 白名單：只刪這些 pattern 的檔案
# - 不刪 *.md / *.yml / *.txt（metadata）
# - 不刪 releases/ 之外
# - 支援 B<ver> 與 V<ver> 兩種前綴
# - 含 electron-builder sidecars (.blockmap)；其他平台 artifact 等實際出現再加
mapfile -t TARGETS < <(
    find releases -maxdepth 2 -type f \( \
        -name "desktop-hakospace-*-*.AppImage" -o \
        -name "desktop-hakospace-*-*.AppImage.blockmap" -o \
        -name "desktop-hakospace-*-*.exe" -o \
        -name "desktop-hakospace-*-*.exe.blockmap" -o \
        -name "server-hakospace-*-*" -o \
        -name "server-hakospace-*-*.exe" \
    \) 2>/dev/null | sort
)

if [ "${#TARGETS[@]}" -eq 0 ]; then
    echo -e "${GREEN}沒有需要清除的 binary${NC}"
    exit 0
fi

# 過濾 --keep 指定的版本
if [ "${#KEEP_VERSIONS[@]}" -gt 0 ]; then
    FILTERED=()
    for f in "${TARGETS[@]}"; do
        # 抽 release 目錄名（releases/<ver>/...）
        ver=$(echo "$f" | awk -F/ '{print $2}')
        skip=0
        for k in "${KEEP_VERSIONS[@]}"; do
            if [ "$ver" = "$k" ]; then
                skip=1
                break
            fi
        done
        if [ "$skip" -eq 0 ]; then
            FILTERED+=("$f")
        fi
    done
    TARGETS=("${FILTERED[@]}")
fi

if [ "${#TARGETS[@]}" -eq 0 ]; then
    echo -e "${GREEN}沒有需要清除的 binary（保留版本後）${NC}"
    exit 0
fi

# 計算總大小
TOTAL_BYTES=0
for f in "${TARGETS[@]}"; do
    if [ -f "$f" ]; then
        bytes=$(stat -c%s "$f" 2>/dev/null || stat -f%z "$f" 2>/dev/null || echo 0)
        TOTAL_BYTES=$((TOTAL_BYTES + bytes))
    fi
done
TOTAL_MB=$((TOTAL_BYTES / 1024 / 1024))

if [ "$APPLY" -eq 0 ]; then
    echo -e "${BOLD}── DRY RUN ──${NC}"
    echo -e "${YELLOW}以下 ${#TARGETS[@]} 個 binary 將被刪除（${TOTAL_MB} MB）：${NC}"
else
    echo -e "${BOLD}── APPLY ──${NC}"
    echo -e "${YELLOW}刪除以下 ${#TARGETS[@]} 個 binary（${TOTAL_MB} MB）：${NC}"
fi

for f in "${TARGETS[@]}"; do
    echo "  $f"
done

if [ "${#KEEP_VERSIONS[@]}" -gt 0 ]; then
    echo
    echo -e "${GREEN}保留版本（不刪 binary）：${KEEP_VERSIONS[*]}${NC}"
fi

if [ "$APPLY" -eq 0 ]; then
    echo
    echo -e "${BOLD}加 --apply 實際執行刪除${NC}"
    exit 0
fi

echo
echo -e "${BOLD}執行刪除中...${NC}"
deleted=0
failed=()
for f in "${TARGETS[@]}"; do
    if rm -- "$f"; then
        deleted=$((deleted + 1))
    else
        failed+=("$f")
    fi
done
if [ "${#failed[@]}" -gt 0 ]; then
    echo -e "${YELLOW}以下 ${#failed[@]} 個檔案刪除失敗（權限／占用？）：${NC}" >&2
    printf '    %s\n' "${failed[@]}" >&2
fi
echo -e "${GREEN}完成，刪除 ${deleted}/${#TARGETS[@]} 個 binary（節省 ${TOTAL_MB} MB）${NC}"

# 再次提示 metadata 安全
echo
echo -e "${BOLD}注意：${NC}本 script 只清 binary。git-tracked metadata"
echo "（CHANGELOG.md / latest.yml / SHA256SUMS.txt）一律不動。"
