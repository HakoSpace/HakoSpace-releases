# HakoSpace B1.0

Release date: 2026-03-01

## Changes

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
14c101b 備份功能改為打包完整 data/ 目錄為 zip、移除未實作的伺服器更新功能
f549960 修正桌面版標題列版本號：開發模式下讀取 VERSION 檔案取代 package.json semver
956f6d6 整合設定頁面授權資訊與關於分頁、修正授權連結、桌面版標題列顯示版本與版本別
42f652f 新增 Release 腳本與 Electron About 視窗（D14-D16, D19-D21）
694ef0d 新增 AI 試驗功能標記：管理介面實驗標籤、DM Bot 徽章、快速開啟 AI 對話按鈕
df0d740 新增遙測基礎建設與關於頁法律文件（T1-T4, A1-A4）
78fd943 更新隱私權政策：新增 opt-in 遙測說明與授權驗證連線揭露
397224f 填入正式聯絡資訊與 GitHub 組織連結，修正授權標示為 Community Edition
d79c98d 強化發行安全：編譯 strip 符號表 + 新增 EULA / 隱私權政策
598fa2e 新增語音頻道切換確認彈窗，防止誤觸離開或加入
2dc3677 新增版本基礎建設與前端品牌顯示（D1-D13）
736742d 新增 release-plan.md：完整 release 架構規劃（版本規則、產物、任務清單）
224825a rebuild.sh：新增 --pull 旗標，部署 server 用 git reset --hard 同步，避免 force push 衝突
e0ccf3d 重構語音聊天 UI：統一舞台區元件，螢幕分享與頭像同級排列，新增舞台彈出視窗
ea544ab 重構語音聊天 UI：統一舞台區元件，螢幕分享與頭像同級排列，新增舞台彈出視窗
eb59ed1 修復 Windows 桌面版：WSS 連線、螢幕分享音訊分離、file:// 相容性、tray icon
caa01e8 新增 dev-setup.sh：完整開發環境一鍵設定（core + Rust cross-compile + Wine + Docker）
5037a93 新增 build-desktop.bat：Windows 桌面版一鍵建置（環境檢查 + winget 自動安裝 + portable exe）
