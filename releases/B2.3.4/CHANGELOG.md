# HakoSpace B2.3.4

Release date: 2026-03-17

## Changes

57a0ece feat: terminal permission UI — access check, permissions tab, admin visibility
931d292 feat: add terminal permission frontend API + i18n
4eb297c feat: add terminal permission API handlers + update access check
77c3ec1 feat: add terminal permission DB models + ACL function
330c9c6 feat: voice SFU — codec mismatch recovery, peer PC reset, screen state callback
3ab8429 chore: desktop 版本號同步至 B2.3.4
f001297 fix: remove unnecessary webSecurity:false from captureWindow
ba472de fix: update all hakoCap paths from electron/ to daemon/
1b0ba86 fix: update hakoCap build path from electron/ to daemon/
4b74c24 版本號更新至 B2.3.4
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
