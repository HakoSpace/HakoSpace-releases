# HakoSpace B1.3.6

Release date: 2026-03-02

## Changes

6631f78 版本號更新至 B1.3.6
a631402 B1.3.6：Inbox通知音改為可上傳自訂音檔（與其他音效一致），移除preset tone選擇器，統一使用soundManager
bfaaf24 版本號更新至 B1.3.5
debb738 B1.3.5：音訊設定重新排版（輸出移至輸入後方）、新增通知提示音選擇器（5種預設音效）與音量滑桿、重構audioSettingsStore統一saveAll()
6d061f7 Inbox改進：新增未讀/全部分頁、單則刪除功能（後端DELETE /notifications/:id + 前端UI）；版本B1.3.4
3b7e550 移除更新後版本輪詢判斷邏輯：更新結果改由inbox通知呈現，避免前端誤判為rollback
a4f01c3 版本號更新至 B1.3.2
35af001 修復更新後版本檢測誤判為rollback：axiosInstance已有baseURL=/api，get路徑不應重複前綴
77563fe 版本號更新至 B1.3.1
5d062a0 通知鈴鐺UI改進：靜音切換移至inbox彈窗header右側，鈴鐺圖示依靜音狀態變更外型（bell-slash）
e2ebd32 修復更新下載SHA256校驗失敗：SHA256SUMS.txt使用相對路徑但比對時用扁平檔名，改用filepath.Base()容錯；同步修正release.sh產生扁平檔名
20d3197 修復Windows交叉編譯：將syscall.Setsid/Kill抽離為平台檔案
34aa17b 版本號更新至 B1.3
8486324 新增通知/收件匣系統：@mention通知、系統通知、鈴鐺圖示下拉面板、已讀管理、FIFO保留上限、通知提示音
aefea72 新增伺服器自動更新機制：檢查GitHub Releases新版本、下載並SHA256驗證、套用更新含自動回滾；設計通知/收件匣資料格式
516d3ad 桌面應用版本號更新至 1.1.0 (B1.1)
8ddf375 新增螢幕分享 WebRTC 診斷面板：即時顯示編碼器/解碼器、FPS、bitrate、凍結、丟包等統計
a798794 版本號更新至 B1.1
47d2110 方案B：桌面應用改為從伺服器載入前端，解決多伺服器版本不匹配問題
186f4a0 修正舞台區篩選邏輯：改為只顯示已訂閱的螢幕分享，修復彈出視窗缺少多國語言
60db770 提高螢幕分享bitrate上限：依業界VP9高標調整遊戲串流品質
c45afa3 修復drainSenderRTCP語法錯誤：修正大括號縮排並加入RTCP轉發日誌
e6520c0 修正PLI策略：改為一次性延遲PLI，徹底消除週期性卡頓
eec3af2 加回安全網PLI：recoveryTick使用節流PLI確保新觀看者取得關鍵幀
2a26738 修復螢幕分享訂閱後長時間無畫面：在 SDP Answer 完成後補發 PLI
adcfd60 修復螢幕分享卡頓：移除盲目3秒PLI，改為觀看者RTCP回饋驅動關鍵幀請求
ae45498 新增單一實例鎖定：防止同時開啟多個 HakoSpace 桌面應用程式
a9b4b0b 配置 GORM logger 忽略 RecordNotFound 並降低日誌等級，消除啟動時的無害錯誤訊息
a85c83e 舞台彈出視窗新增隱藏非視訊分享者切換按鈕與參與者計數工具列
479c1ed 修復舞台彈出視窗未遵循隱藏非分享者切換的問題
