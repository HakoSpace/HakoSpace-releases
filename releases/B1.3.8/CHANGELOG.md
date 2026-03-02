# HakoSpace B1.3.8

Release date: 2026-03-02

## Changes

42e8719 修復Desktop右鍵選單亂碼/重複與分享視窗顯示程式碼：reuse視窗、移除transparent、加loadFile失敗重試
4e56d43 修復Desktop連線卡在「連線中」：await loadURL防止race condition，新增連線防重複與錯誤處理
21141ad 修復Desktop連線問題：新增GET /api/me端點與token自動恢復機制
8b4ab8b 完善git-release-rule.md：補充完整release流程、repo結構、tag格式、部署步驟、快速參考
ef6d364 統一release命名規則：server-hakospace-{os}-{arch}-{version}，對齊git-release-rule.md與release-plan.md
0744555 修正SEMVER轉換：保留patch版本號（B1.3.6→1.3.6），不再一律歸零
eed4acc 修復release腳本：只複製當前版本的desktop檔案，避免包含舊版exe/AppImage；統一通知音量由audioSettingsStore控制
8b0fc12 統一通知音量：soundManager從audioSettingsStore讀取notificationVolume，所有音效（播放+試聽）共用同一音量設定
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
