# HakoSpace B1.5.8

Release date: 2026-03-05

## Changes

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
292fa1d 修正系統更新通知重複推送與無法已讀刪除問題
b182914 修正收件匣通知按鈕 tooltip 與系統更新提示多國語言支援
71da061 紀錄碑：累計時間即時跳動修復 + 成員人數顯示修正
d5ac3d5 移除 Note 多功能頻道的 text chat 設定與廢棄 chatTab i18n key
e948a6a 主視窗分頁重構：多功能頻道獨立為 multi 分頁，與語音/文字平級
b44826a 紀錄碑 UI：累計時數統一改為日時分秒即時格式
c67171f 桌面版版號同步至 1.5.4
b6b8a1e 紀錄碑 UI：面板日期/計時器格式改善 + 新增統計卡片 + 齒輪設定按鈕修復
f586411 紀錄碑前端基礎：MonumentStats 型別更新 + 日期格式工具 + 中英翻譯
16f40b6 紀錄碑 API：新增 bot_count、total_online_seconds、peak_voice/screen_share_participants 欄位
c5eeedb 紀錄碑統計緩衝區：新增總體在線時間累計 + 語音/螢幕分享峰值追蹤
8eec4c2 修正紀錄碑頻道設定：僅保留公開/私人切換，隱藏不相關的權限與保留設定
