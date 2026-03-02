# HakoSpace B1.3

Release date: 2026-03-02

## Changes

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
cbc21a8 桌面版 titlebar 移除版本號，僅保留社群版字樣
6c7259c 修正 icon.ico 格式：從 PNG 轉換為正確的多尺寸 ICO
18ee95b 整合新 Logo：更新桌面圖示、托盤圖案、登入/註冊/關於頁面
840edbb 修復 EnsureDotEnv base64 切片越界導致首次啟動 panic
e56bf7b 修復三項 Windows 測試發現的問題：.env 自動產生、首位用戶立即成為 Owner、桌面版右鍵選單路徑
19c456c release.sh 新增 --publish 透過 GitHub Releases 上傳 binary assets
c570bee 重構 release 目錄結構：依角色/平台分層，build-server.sh 新增 Windows 交叉編譯
94e6851 移除 Linux deb 打包目標，僅保留 AppImage
b9abf4c 修正桌面版建置腳本：版本號轉換為 semver 格式以相容 electron-builder
486c8f1 新增備份管理工具與孤兒檔案清理功能
91701c8 修復檔案孤兒問題、新增 DM 統計資料與上傳大小設定、舊品牌檔案清理
