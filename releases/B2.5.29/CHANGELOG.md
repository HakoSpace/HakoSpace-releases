# HakoSpace B2.5.29

Release date: 2026-04-15

## Changes

675f334 版本號更新至 B2.5.29
447ad6a fix(update): 下載 context 改用 Background，避免 proxy 斷線截斷下載
95e5c50 版本號更新至 B2.5.28
a73b20b fix(update): 驗證逾時、手動略過驗證、systemd 下改用 B1 重啟流程
6a8629b 版本號更新至 B2.5.27
049ec39 fix(whiteboard): 釘選圖片不可拖曳
61b32a2 版本號更新至 B2.5.27
51d64f2 fix(whiteboard): preserve image transparency on insertion
21256f1 版本號更新至 B2.5.26
9142cef fix(whiteboard): 橡皮擦時序渲染 + 釘選圖片可選取解除
47b06a9 fix: remove unused openIOSettings (merged into openChannelPerms)
75723e5 版本號更新至 B2.5.25
11652b6 feat(io): Settings SDK + 雙層橡皮擦 + per-channel quota + SDK 文件
0878643 版本號更新至 B2.5.24
7ccd5e0 fix(io): admin IO app 管理 API user_id context key 錯誤
56451e2 版本號更新至 B2.5.23
c1cfb9f fix: restore VERSION before bump
d69cafc feat(whiteboard): v3.0 — 六項新功能 + SDK 擴展 + Admin IO 容量
c450096 版本號更新至 B2.5.22
f97af2e feat(snake): 動態速度 + 移除時間限制 + 初始長度 3
6fec1f5 版本號更新至 B2.5.21
38b4522 fix(hakoIO): host-authoritative mode 從 manifest 讀取而非 client
f556d79 版本號更新至 B2.5.20
497118b feat(hakoIO): IO App 管理面板 + contentHash 自動重載
74a0e41 docs: 更新 hakoIO.md 實作狀態 + handoff（管理面板計劃）
bc9bcec fix(hakoIO): 內建 app 每次啟動都重新解壓
54e5dac fix(whiteboard): localStorage 在 sandbox iframe 中的 SecurityError
465999a fix(hakoIO): iframe URL 加 cache buster 避免瀏覽器快取 301 redirect
bdf347d fix(hakoIO): 修正 Go http.ServeFile 自動 redirect index.html → / 的問題
cb8fc44 fix(hakoIO): SDK inline 到 app HTML + sandbox 移除 allow-same-origin
