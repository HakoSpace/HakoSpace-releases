# HakoSpace B2.4.25

Release date: 2026-03-28

## Changes

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
60056f9 fix: 未登入狀態下 401 不觸發 forceLogout 避免無限 redirect loop
e1e14b9 fix: 設定面板 sidebar 標題高度改為 h-14 對齊右側 header
8a080b6 fix: 設定面板右側加 min-w-0 防溢出、終端邊框容器改為 flex、獨立終端頁同步邊框
8f11744 fix: WS Monitor toolbar 拆成雙列避免溢出 + 終端機加邊框容器
52f8077 fix: WS Monitor 自適應寬度取代水平捲軸，OP 欄加 max-width truncate
be8803b fix: WS Monitor 右側截斷問題 + 終端機左右加 padding
97a4054 fix: 修正關於頁面和偏好設定預覽寬度不一致問題
8273635 版本號更新至 B2.4.14
