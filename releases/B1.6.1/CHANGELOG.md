# HakoSpace B1.6.1

Release date: 2026-03-06

## Changes

2977514 稽核日誌篩選改為動態 + 清除禁語紀錄寫入稽核日誌
aadafc7 修正 block 模式不記錄：移除 client-side 預檢查，由 server 統一處理 block + 記錄
fa514e6 禁用字紀錄改用帳號名稱與頻道名稱顯示
5d2f02c 修正禁用字即時同步：MSG_ACK 回傳替換內容、設定廣播、Save 按鈕 + 驗證回饋
6149704 版本號更新至 B1.6.1
e7b3143 新增禁用字管理功能：支援 replace/block 模式、大小寫不敏感匹配、管理員日誌
488d8a6 修正頻道名稱多位元字元限制 + 改善錯誤提示
4af538d 修正 EULA 首次啟動不顯示 + 需捲到底才能接受
3f86a63 修正 favicon 路徑：改用實際存在的 /logo.png
3f3e802 修正分頁標籤 favicon：無 server 頭像時顯示 HakoSpace logo 而非 Vite 預設圖示
bed8603 修正 electron-builder CI 環境自動發布問題：加入 --publish never
b2eaede 桌面端自動更新機制 + 版本號更新至 B1.5.9
6d30303 移除SFU的TWCC壅塞控制 改用REMB避免螢幕分享被降速至30fps
8999273 螢幕分享：修正 TS 型別錯誤與 JSX 結構
ffbb04c 版本號更新至 B1.5.7
4df3344 螢幕分享：新增編碼優先設定（解析度/幀率/平衡）
0cd25b3 螢幕分享：setParameters 加入 maxFramerate 確保 encoder 遵循幀率設定
ae7a33c 遙測發送器：開機即送 + 失敗 5 分鐘重試（修正開機紅燈問題）
15dfa73 版本號更新至 B1.5.6
70f1084 新增 auth.hakospace.com metadata 服務交接文件 + 標記 T5 完成
5d7cd7c 遙測設定：改善計劃開關旁新增連線狀態指示燈（🟢/🔴）
1eb9452 遙測 HTTP 發送器：定期匿名送出至 auth.hakospace.com + 連線狀態 API
ae919f2 遙測收集器：Snapshot 擴充至 30 欄位，對齊紀念碑資料集
76c2020 桌面版版號同步至 1.5.5
84d3b57 版本號更新至 B1.5.5
53ff377 紀錄碑 UI：新增 12 項統計卡片、峰值時間顯示、顯示開關設定面板
a4dd863 紀錄碑前端：擴充 MonumentStats 型別 + 新增統計項目中英翻譯
4af49a3 紀錄碑 API：擴充紀念碑端點回應欄位 + 新增 22 個頻道顯示開關設定
d3c0d80 紀錄碑後端：新增峰值時間戳、最長語音、每日訊息峰值、重啟計數統計
b93e58c 修復終端傳送門貼上內容重複顯示問題
