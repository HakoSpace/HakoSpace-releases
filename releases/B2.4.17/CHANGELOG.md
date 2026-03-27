# HakoSpace B2.4.17

Release date: 2026-03-27

## Changes

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
9004374 fix: dashboard tab 未載入 allow_prerelease 設定導致 toggle 無法關閉
9cd5113 版本號更新至 B2.4.13
2f8ae8e feat: 修復終端機遮擋問題 + 新增獨立終端機視窗功能 (Web 新分頁 / Desktop 彈出視窗)
25f15fd fix: 提高 PWA workbox 檔案大小上限至 5MB
11d4ac9 版本號更新至 B2.4.12
c82837e feat: 新增 JWT token refresh 機制 (access token 1h + refresh token 30d + rotation)
2a0e7c5 版本號更新至 B2.4.11
5caf42a feat: 伺服器更新支援預覽版過濾
6916701 版本號更新至 B2.4.10
4eff7f8 fix: remove TWCC header extension that caused Chrome BWE to floor at 300kbps
2412fd3 版本號更新至 B2.4.9
d5612c2 fix: apply VP9 codec preference synchronously in auto mode to prevent H264 fallback
4e7ca1b fix: reset ExcludedCodecs on screen share restart for fresh codec negotiation
a233dcd fix: enlarge NACK buffer and re-enable TWCC for screen share reliability
938c0f6 版本號更新至 B2.4.8
92e8d46 fix: prevent voice kick when watching screen share with codec mismatch
