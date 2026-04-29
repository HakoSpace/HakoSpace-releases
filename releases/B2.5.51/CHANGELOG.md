# HakoSpace B2.5.51

Release date: 2026-04-29

## Changes

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
1a58bf4 fix(sidebar) Mic button 跟上 isTouch 三元尺寸 — 解 touch 裝置 row 高度不一致
03a37d5 版本號更新至 B2.5.46
b65ad7c fix(legal) Agora「關於」tab + 首登 EULA modal 一致性改為外開 canonical URL
1dfc897 版本號更新至 B2.5.45
04727d1 feat(legal) ADR-0007 Legal Compliance Gate 全棧實作
e0d9a3b 版本號更新至 B2.5.44
4c2154c fix(release) build-server.sh protocol drift B2 → B3
f835f0d 版本號更新至 B2.5.43
82d39d4 fix(camera) B-0015 post-release hotfix: protocol bump + DM video flow + forced update overlay
b576d24 版本號更新至 B2.5.42
c9d1468 feat(camera) B-0015 camera sharing + DM video call 完整實作
5b39624 版本號更新至 B2.5.41
