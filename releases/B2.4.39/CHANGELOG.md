# HakoSpace B2.4.39

Release date: 2026-03-28

## Changes

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
8fb8990 版本號更新至 B2.4.31
b6c89c2 fix: screen subscription 在 peer reconnect 後遺失
f4c2858 版本號更新至 B2.4.30
a6efefe fix: 用 OfferSentOnce 取代 Offered 做 no-change skip 判斷
ce4825e 版本號更新至 B2.4.29
a4d5cd0 fix: syncPeersActor 只在有 track 變更時才發 offer
49b47f4 版本號更新至 B2.4.28
d2ded82 fix: handleAnswer 成功後正確 reset peer.Offered
a92cb46 版本號更新至 B2.4.27
0a43f87 fix: syncPeersActor offer 風暴 — skip non-stable peer 不做 retry
59cd6a2 版本號更新至 B2.4.26
ec29d02 fix: syncPeersActor return true 阻止其他 peer 收到 offer
68aca08 版本號更新至 B2.4.25
77bfe66 debug: syncPeers 加 AddTrack/skip log + 還原自動訂閱
