# HakoSpace B2.5.27

Release date: 2026-04-14

## Changes

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
80cf68e fix(hakoIO): iframe sandbox 加上 allow-same-origin
bc84d8c fix(hakoIO): IO asset serving 改為獨立 top-level route
86f8e6d debug: IOPanel console.log channelId/config/appUrl
140d10b debug: IOServeAppAsset 加入詳細 log 追蹤 404 問題
e360e3e fix(hakoIO): IOPanel iframe 不再依賴 manifest 載入
6a66be1 fix(hakoIO): IO app list/manifest 端點改為 public
