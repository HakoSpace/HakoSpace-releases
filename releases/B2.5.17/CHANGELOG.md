# HakoSpace B2.5.17

Release date: 2026-04-10

## Changes

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
b4ce44a fix: 補齊 IO subtype 型別定義（api.ts, ws.ts）
350c3c1 feat: HakoIO 互動應用頻道系統
e12976b 版本號更新至 B2.4.96
b5d0f9e fix: codec 切換時重建 TrackLocal + 恢復 SetCodecPreferences
cded1a8 版本號更新至 B2.4.95
1988918 fix: 移除 SetCodecPreferences 修復 codec 切換時 viewer 被踢出
9f9e25f 版本號更新至 B2.4.94
761e4e8 fix: 偵測 mid-stream codec 切換並自動重新協商
965cdd6 版本號更新至 B2.4.93
468308c feat: 新增 VOICE_CLIENT_STATS — 每 5 秒上報 WebRTC stats 到 server log
39dc95a 版本號更新至 B2.4.92
0200aed fix: 停用 keyframe cache serving 修復所有 codec 的畫面卡住
