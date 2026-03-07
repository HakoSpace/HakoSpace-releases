# HakoSpace B1.6.4

Release date: 2026-03-07

## Changes

594aa21 fix: 關閉 Windows 遮擋偵測 + 修復更新器 YAML 解析
8c65931 fix: 移除 WebRTC 桌面擷取 CPU 50% 上限 — webrtc-max-cpu-consumption-percentage=100 解除 Windows DXGI 擷取的 30fps 限制
09b6066 fix: 螢幕分享背景節流 — disable-renderer-backgrounding + backgroundThrottling:false 防止切換視窗後 FPS 降至 30
67266f5 fix: APP 版螢幕分享全螢幕按鈕無反應 — 補上 WebContentsView HTML fullscreen 事件處理
67ca573 螢幕分享 bitrate 上限提升：1080p60 10→20Mbps, 高動態內容不再撞天花板被砍 FPS
f809e21 螢幕分享品質優化：SFU REMB 取最大值 + 硬體加速 + contentHint 一律 detail + 移除自適應 FPS 監控
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
