# HakoSpace B2.3.3

Release date: 2026-03-14

## Changes

a7d920d 版本號更新至 B2.3.3
5303bae fix: trigger audio playback after screen subscription gate opens
8105242 fix: screen share audio lost after rejoining voice channel
c7d263a 版本號更新至 B2.3.1
b77e1a6 chore: remove unused ScreenShareViewer component
54d3d3e fix: broadcast WHIP status to all sessions, preserve room with active WHIP peers
346427e fix: WHIP streams now visible in StageArea for late-joining members
0092e44 fix: remove Chromium background throttling workarounds (hakocap-daemon replaces them)
4b70166 feat: overhaul read system, add iMessage DM with tab system, fix scroll
8fc62f4 fix: resolve renegotiation storm when WHIP tracks active
4541b56 fix: late-joining peers now see active WHIP streams
4bd12aa fix: WHIP tracks bypass screen subscription — auto-send to all viewers
a766edd perf: SCHED_FIFO real-time priority for RTP forwarding threads
8d56048 perf: LockOSThread on RTP forwarding goroutines
cb4c47e fix: add REMB decay to prevent publisher bitrate stagnation
4e60a18 fix: WHIP use room shared API (no TWCC) + NACK SSRC remap
34d52a1 版本號更新至 B2.2.9
e7d49d0 fix: B2.2.8 — 舞台區分享者頭像重複 + SCREEN_STATE 包含分享者
566e553 fix: B2.2.7 — drainSenderRTCP sidecar 優先 + sidecar 螢幕分享 SCREEN_STATE 廣播修復
0994ef9 fix: B2.2.6 — PLI 發送到 sidecar PC 而非 peer PC + codec 診斷日誌
e2d10c8 fix: B2.2.5 — capture window lazy init、VP9 codec default、hakoCap 品質預設、PLI 診斷日誌
c1120f1 chore: 版本號更新至 B2.2.4
a61b33b fix: hakoCap 整合修復 — 傳遞 codec 設定、移除多餘 sendScreenStart
e682071 fix: hakoCap Windows cross-compile — 自動下載 node.lib + 產生 MinGW import library
70afe18 fix: hakoCap 完整打包流程 — extraResources + packaged 路徑偵測 + build scripts 自動編譯 addon
855464c feat: hakoCap 整合 — 桌面版隱藏視窗改用原生擷取引擎、設定 sidecar→hakocap 重命名
10c523d feat: 開放網頁版60FPS、桌面版新增螢幕分享引擎選項
9b93290 fix: VP9 codec H264過濾、PLI SSRC重寫、隱藏視窗throttle、遊戲焦點fakeMinimize
924fc05 chore: 版本號更新至 B2.1.8
b3cc7a7 fix: VP9 codec preference + picker 遊戲焦點搶奪
