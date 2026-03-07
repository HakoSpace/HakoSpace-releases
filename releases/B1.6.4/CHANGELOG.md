# HakoSpace B1.6.4

Release date: 2026-03-07

## Changes

cc6097b fix: server sidebar 右鍵選單空白 — 修正 renderMenu 遺失的 closing brace
2a53bc9 螢幕分享：繞過 Chrome VP9 SVC 30fps 硬限制 — scalabilityMode L1T1 + 自適應 contentHint 監控
0f0d161 feat: buildId-based 更新檢測 — 同版本熱修不需增加版號
619240f fix: server 右鍵選單窗口尺寸與內容不匹配 — 改用 IPC 動態 resize
f5f92b9 B1.6.4：Pre-release 更新選項 + 更新檢查錯誤處理改善
f266d1c B1.6.3：忘記密碼功能 + Email 系統優化 + 帳號 Email 管理
c493c6c fix: email verification not working — GORM zero-value bug + double-call guard
0fea639 修正 restart 按鈕無效 + .env SMTP 變數名稱錯誤
04b92a9 新增 Email 驗證註冊功能 + 版本號更新至 B1.6.2
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
