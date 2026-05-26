# HakoSpace B2.5.53

Release date: 2026-04-29

## Changes

567acaa 版本號更新至 B2.5.53
72dccec fix(forum): PR-H 補完 reviewer suggestions + nits + spec gaps
5e9e950 fix(forum): PR-G hotfix 5 reviewer blockers (ADR-0015 code-review-gate)
610c66b ops(hooks): code-review-gate Stop hook for Agora cwd (ADR-0015)
2aba86a feat(forum): PR-E forum settings modal (server admin+ only)
454734e feat(forum): PR-D frontend forum panel V1.1 (list / detail / composer)
5443598 feat(forum): PR-F forum_post_count daily aggregation + admin endpoints
ea40ab5 feat(forum): PR-C rate limit subsystem (in-memory sliding window)
f20bfbf feat(forum): PR-B backend API + storage / admin handler 對接 V1.1
21c210b feat(forum): PR-A schema migration for forum channel V1.1
cb6e1ed 版本號更新至 B2.5.52
4463099 build(release) 加 --bump/--cleanup-prev/--no-preflight 自動化 release 流程
6ea2d1d 版本號更新至 B2.5.51
7d36dff fix(auth) 抽 AuthLayout 解決窄螢幕 auth 頁面無法 scroll 的 bug
dfacc2f chore(desktop) 移除 ffmpeg bundle extraResources 條目（ADR-0014 Option A）
61e1758 fix(legal) Clear-Site-Data 不清 storage，避免清掉 auth_token 導致 /legal/sign 401
acb7772 chore(desktop) 同步 package.json 版本至 2.5.49
6e45367 版本號更新至 B2.5.49
55c86c0 fix(legal,sw) Clear-Site-Data + cleanupOutdatedCaches 解卡舊 SW 永久迴圈
724c3e6 chore(desktop) 同步 package.json 版本至 2.5.48
b14bbfe 版本號更新至 B2.5.48
7b6f071 fix(sw) skipWaiting + clientsClaim + 早期版本 probe 解瀏覽器卡舊靜態檔
04fb753 版本號更新至 B2.5.47
c0a8295 Merge pull request #10 from HakoSpace/feat/rwd-overflow-menu
7a2e212 Merge pull request #8 from HakoSpace/fix/sidebar-mic-isTouch-rwd
692c97d Merge pull request #9 from HakoSpace/feat/voice-source-popover
3defda4 feat(sidebar) RWD overflow menu + voice row 降級視圍
df2e243 feat(icons) 15 檔剩餘 inline SVG → lucide barrel 全清
7ff46d7 feat(icons) Call + VoiceChatPanel inline SVG → lucide barrel
50da09f feat(sidebar) Visual Source popover + Sidebar inline SVG → lucide 全清
