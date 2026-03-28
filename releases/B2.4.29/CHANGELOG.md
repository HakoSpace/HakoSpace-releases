# HakoSpace B2.4.29

Release date: 2026-03-28

## Changes

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
1130234 版本號更新至 B2.4.19
b03947f fix: NotePanel {font:} 語法解析 — 加入 rehypeFontRegion plugin
ceead65 版本號更新至 B2.4.18
e0f321d feat: ThemeUp 主題系統 + Inline Font 訊息字型
abdf63f 版本號更新至 B2.4.17
a0a99aa fix: 遮蔽 GIN log 中的 token 參數防止明文洩露
2b9098f 版本號更新至 B2.4.16
a31d108 feat: 新增 Server Logs 管理面板 (GET /api/admin/logs + Settings 分頁)
34ca122 版本號更新至 B2.4.15
f646f91 版本號更新至 B2.4.13
