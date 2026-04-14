# HakoSpace B2.5.23

Release date: 2026-04-14

## Changes

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
7388798 feat(whiteboard): 無限畫布 + 視窗控制 + 快速選色 + 取色 + Undo/Redo
719aa1c fix(hakoIO): 移除白板 debug log + 阻擋目錄路徑存取
ec696f5 debug: 白板加入 onMessage debug log + 容錯處理
065436c fix(hakoIO): 手機版點擊多功能頻道自動切到主視窗
8e934cc fix(hakoIO): 側邊欄點擊文字頻道時清除 multi tab focus
37aa4b0 fix(hakoIO): tab 跳轉、多開替換、IO 切換重置
25b7a4b fix(hakoIO): 多功能頻道 tab 系統重構 + storage 修復
9203896 fix(hakoIO): 圖示風格、tab 共存、群組權限、白板持久化
cc1ca5c fix: IO app 列表載入改用 axiosInstance + 建立時驗證 app 已選擇
