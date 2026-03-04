# HakoSpace B1.5.3

Release date: 2026-03-04

## Changes

c13d780 修正隱私政策 Instance ID 揭露 + 修復遙測開關端點
a05d9cd 新增 EULA 同意流程與啟動通知（B1.5.3）
6f13c58 隱私權政策補強：網路日誌免責聲明、授權驗證細節、資料保留原則、官方網站隱私條款
6f58758 EULA 補強：第12條加入隱私權政策連結、新增第13條語言版本優先權條款
dc50d33 EULA 條款修訂：第11條 UGC 標題與用語精確化、新增第12條隱私與遙測條款
9d0e46c EULA 法律條款強化：放寬社群贊助定義、新增管轄法院/UGC免責/賠償上限、英文免責條款全大寫
6517d58 功能：筆記頻道編輯鎖定機制
02d5b92 修復：頻道類型改回按鈕選擇、修復筆記 Markdown 渲染
049d4e7 修復筆記頻道核心錯誤：READY 訊息遺漏 subtype/config + 頻道類型改雙層下拉選單 + 設定頁面顯示筆記圖示
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
