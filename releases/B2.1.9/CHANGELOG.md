# HakoSpace B2.1.9

Release date: 2026-03-08

## Changes

9b93290 fix: VP9 codec H264過濾、PLI SSRC重寫、隱藏視窗throttle、遊戲焦點fakeMinimize
924fc05 chore: 版本號更新至 B2.1.8
b3cc7a7 fix: VP9 codec preference + picker 遊戲焦點搶奪
dd81a97 fix: B2.1.6 runtime bugs — PLI延遲、假音訊控制、遊戲焦點、螢幕分享殘留
d8e794e chore: 版本號更新至 B2.1.6
353f7f4 fix: B2.1.5 runtime bugs — self-preview loopback, VP9 codec, picker focus
10e24d2 chore: .gitignore 加入 desktop/ffmpeg/ — 移除大檔案追蹤
ba1a235 chore: 版本號更新至 B2.1.5
b21d5d4 feat: 隱藏視窗 stats relay — capture-worker getStats() → 主視窗 debug overlay
be15f58 feat: 網頁版 60FPS 選項停用 — 瀏覽器無法達到 60fps
c653ef9 feat: 螢幕分享自我預覽渲染 — ScreenShareViewer + StageArea 支援 self-tile
168862e feat: voiceStore 整合 — sidecar 移除 + 自動訂閱自己 + captureWindowStats + 60fps 回退
08b6cd7 refactor: 移除 desktop sidecar 代碼 — main.ts, preload.ts, electron-builder
ea440a0 refactor: 端點路徑重命名 /api/sidecar/screen → /api/capture/screen
85bfcac fix: release.sh 支援 build number 後綴的 desktop 檔案名
e4733b8 feat: 隱藏視窗螢幕擷取架構 + build 流水號
3f26525 chore: 版本號更新至 B2.1.3
8532a92 fix: 暫時停用 sidecar 分享 + picker 一律顯示
81bed1f feat: intent-based sidecar IPC protocol + app 啟動即 spawn sidecar
8bf613a fix: sidecar track 加入時 ScreenStreamIDs nil map panic
697e63d chore: 版本號更新至 B2.1.2
940359f fix: sidecar 螢幕分享啟動失敗時回退到 getDisplayMedia + 傳遞 FFmpeg 路徑
766d7fc chore: 版本號更新至 B2.1.1 + 更新 release 保留規則
e4eb8c9 feat: Electron + 前端整合 sidecar 螢幕分享路徑
e3f6ea2 feat: SFU 伺服器整合 sidecar 螢幕分享
f4c5771 feat: 新增 Go sidecar 螢幕擷取引擎
1d76453 fix: 還原 degradationPreference + F11 全螢幕快捷鍵
1c4017f fix: 三項修復 — FPS 降幀根因 + 全螢幕 + Page Visibility
88729bf fix: fake minimize 改用螢幕外移動 + 全螢幕改用 IPC
a132a16 fix: fake minimize 保持 renderer 活躍 + 全螢幕按鈕修復
