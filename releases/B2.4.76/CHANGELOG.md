# HakoSpace B2.4.76

Release date: 2026-04-02

## Changes

b1286c8 版本號更新至 B2.4.76
af88cf2 diag: 加入 offer sent / answer received 診斷 log
650dfb0 版本號更新至 B2.4.75
0bb0324 fix: isVideoTransceiver 誤判 audio transceiver 為 video
2bdb99d 版本號更新至 B2.4.74
3347316 fix: keyframe cache 競爭條件 + H264 recvonly codec 協商 + 啟用 TWCC
b1f8919 版本號更新至 B2.4.73
d0580e7 fix: 修復主題編輯器 alpha slider 拖動範圍異常 & 預覽反映透明度
86e686b 版本號更新至 B2.4.72
467a9b2 feat: 主題系統新增全顏色透明度設定 (per-color alpha)
2dc31e5 版本號更新至 B2.4.71
f1f8eb8 feat: 上傳檔案改用可識別命名格式 {type}_{hex}_{originalName}.ext
1ed2b58 fix: 修復上傳檔案生命週期管理，防止孤兒檔案產生
72d6ad0 版本號更新至 B2.4.70
b014cff 清理 .env 模板：移除已遷移至 runtime 設定的 AI 與 Email 區塊，同步 desktop 版本號
3e5dc37 版本號更新至 B2.4.69
9464101 fix: recvonly transceiver 使用 publisher 的實際 codec，而非用戶自己的偏好
6e3e53f fix: 統一 token refresh 路徑，消除 race condition 導致的 stolen token detection 誤判
30a9244 Voice ICE 診斷 log 強化：連線時記錄 candidate pair、ICE 狀態變化、每 30 秒連線品質快照
0d01d71 版本號更新至 B2.4.67
3b550ce refactor: bot 改用 role="bot" 查找，名稱設定同步更新 username + nickname
e6a2ab3 版本號更新至 B2.4.66
9beac0c fix: DM 和 Channel 訊息區域加入 overflow-x-hidden 防止水平捲動
0c39b41 fix: bot 名稱變更後廣播 USER_UPDATE 讓前端即時更新
faf5df4 版本號更新至 B2.4.65
ebaad57 AI 設定從 .env 遷移至前端可編輯的 Runtime 設定
8f17c31 fix: ? 按鈕圖示尺寸統一 24x24 + 送出按鈕垂直置中
5880c06 mention 搜尋欄位 + 彈窗捲動修正 + 格式說明按鈕
b313d43 擴展語言專用字型支援至 17 種獨立字母系統
55a2308 fix: 語言專用字型正確載入 + 字型預覽改用多語言範例文字
