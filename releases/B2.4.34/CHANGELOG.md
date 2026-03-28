# HakoSpace B2.4.34

Release date: 2026-03-28

## Changes

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
81719a0 版本號更新至 B2.4.24
9809e30 fix: 晚加入語音的用戶看螢幕分享一直 loading
2c4a238 版本號更新至 B2.4.23
e1aad7f fix: monitor Record() panic on send to closed channel
d2d4e80 版本號更新至 B2.4.22
0bd561a fix: WS 重連風暴 + /api/users 請求風暴
9c1d142 版本號更新至 B2.4.21
fd169e4 fix: 背景圖片被 MessageArea bg-hako-tertiary 遮蔽
201185a 版本號更新至 B2.4.20
ee9c807 fix: 主題編輯器顏色選擇器色塊填滿整個框
