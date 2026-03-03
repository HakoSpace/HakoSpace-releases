# HakoSpace B1.5.1

Release date: 2026-03-03

## Changes

bcd8207 移除嵌入網頁頻道 + 頻道類型改下拉選單 + 筆記頻道權限改善（403 顯示）
a7939ee 修復嵌入頻道建立錯誤顯示 + 筆記頻道設定顯示完整文字頻道選項
1e414d8 筆記頻道新增 Note/Chat 分頁 + 連結開新分頁 + 修復刪除頻道清理遺漏
881c843 修復多功能頻道建立 + 筆記權限改為成員/群組制
b782a2c 版本號更新至 B1.5.1
57e1901 新增多功能頻道系統（嵌入網頁 + 筆記）
c1d1775 更新檢查支援同版本重發偵測（SHA256 比對）
05ad368 巢狀資料夾統一排序：頻道與子資料夾可跨類型混合排列
8d70c57 版本號更新至 B1.4.2
2058f28 頻道群組支援巢狀子資料夾（兩層深度）
3551a21 移除 server action rebuild 功能
3b18294 版本號更新至 B1.4.1
bab4ad9 語音：無麥克風時純聽模式加入 + 裝置斷線自動恢復
407457f 版本號更新至 B1.3.9
56e00e2 rename hideNonSharing to hideUnwatched; add subscription state to debug overlay
2befc28 修復螢幕分享信令競態條件與隱藏成員過濾器bug
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
