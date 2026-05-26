# HakoSpace B2.4.46

Release date: 2026-03-29

## Changes

8013d34 版本號更新至 B2.4.46
25dd865 feat: Theme 繼承系統 — inherit_background / inherit_colors / inherit_fonts
d73362e 版本號更新至 B2.4.45
2232ccf fix: tab 切換時同步 channel theme — voice/text/DM 各自套用正確主題
9c06a54 版本號更新至 B2.4.44
45b57f6 feat: titlebar_opacity + channel theme debug logs
9fa6c50 版本號更新至 B2.4.43
eceae44 feat: 背景系統雙層改造 — theme wallpaper + channel background
a5e363e 版本號更新至 B2.4.42
3f370fe fix: Protocol version 統一為 B2，單一來源
2d1b5de 版本號更新至 B2.4.41
95e90e7 feat: WS protocol version gate + token refresh 不再觸發 WS 重連
6cf0102 版本號更新至 B2.4.40
6285180 fix: token refresh 觸發 WS disconnect/reconnect 無限循環
899604e 版本號更新至 B2.4.39
afe09a6 fix: voice disconnect 加 5 秒寬限期等待 WS 重連
c4348d2 版本號更新至 B2.4.38
42d7a3b fix: WS 重連不再踢出 voice — session cleanup 和 sendFn 改進
18f3154 版本號更新至 B2.4.37
3424c0e fix: screen share 強制 VP9 優先，避免 H264 SFU PLI 問題
6016b2f 版本號更新至 B2.4.36
ecb5990 chore: 清理 syncPeers debug log，減少 log 噪音
b5041f5 版本號更新至 B2.4.35
34e4eb2 fix: renegotiation 期間 ICE failed 不應直接 leaveVoice
eb0e9a5 版本號更新至 B2.4.34
94a270d fix: trackMap 洩漏所有 room track 給每個 peer
562c63c 版本號更新至 B2.4.33
40cdcef fix: 背景圖片只在 text channel 顯示
33f5ee9 版本號更新至 B2.4.32
a3107ff fix: StartScreenShare 後 syncPeersActor 不發 renegotiation offer
