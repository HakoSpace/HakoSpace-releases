# HakoSpace B2.5.98

Release date: 2026-05-20

## Changes

1cdecca 版本號更新至 B2.5.98
a91de42 fix(pages): iframe sandbox 加 allow-same-origin（不加則 CSP self 永不匹配 → page 空白）
310cb98 fix(i18n): 雙括弧 placeholder 顯示殘留 brace 文字（{15}/{43.8} 等）
1fde6dc 版本號更新至 B2.5.97
5dddda9 feat(pages): 網頁 Host 加上傳格式說明 — 雙 audience（admin + LLM）
85872eb fix(pages): extractPageZip 正規化 Windows 反斜線路徑分隔符
edcf979 版本號更新至 B2.5.96
514e066 fix(admin): orphan-cleanup handler path-traversal 雙層防護 (I-0012)
749af1a 版本號更新至 B2.5.95
d8857b2 fix(update): channel toggle uses SHA-equality (not version order) for /check
74d0004 feat(pages): 豐富頁面功能 PR-4 — 網頁 Host admin 設定分頁
693db5d feat(pages): 豐富頁面功能 PR-3 — channel type 'page' + iframe 渲染
41c668f feat(pages): 豐富頁面功能 PR-2 — public serve handler + safety layer + PV buffer
431cbbf feat(pages): 豐富頁面功能 PR-1 — DB schema + admin CRUD API
77548da 版本號更新至 B2.5.94
ed2a77d fix(update): atomic tmp pattern + progress UI for self-update (I-0011)
8cd175e 版本號更新至 B2.5.93
fa17a30 fix(frontend): louder voice stage tile entrance + fill-mode both
2c6387c feat(frontend): theme element transitions (bg cross-fade + color transition)
abfca4c 版本號更新至 B2.5.92
eee5769 feat(frontend): animate voice stage + missed modals (PR 6)
88375eb 版本號更新至 B2.5.91
5105f4d feat(frontend): loading animation polish round (a11y + theme + races)
b9abc5e feat(frontend): animate Tier C loading regions (monument/note/settings/bell)
bf40b8a feat(frontend): animate Tier B loading regions (user panel + forum)
162aba7 版本號更新至 B2.5.90
e5926fa feat(frontend): animate Tier A loading regions (channel/main/dm/boot)
4772e64 feat(frontend): add loading animation foundation
2790c93 docs: add frontend loading animation plan
318a9e6 fix(turn): DDNS refresh 加 hysteresis + 真正套用 IP 變化
