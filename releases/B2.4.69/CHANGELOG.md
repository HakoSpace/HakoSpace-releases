# HakoSpace B2.4.69

Release date: 2026-04-02

## Changes

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
a226636 新增語言專用字型設定 — 主題可為中文、日文、韓文指定獨立字型
3b15375 版本號更新至 B2.4.60
a45cc03 版本號更新至 B2.4.59
d94d6c8 版本號更新至 B2.4.58
4a2b636 版本號更新至 B2.4.57
4985b53 版本號更新至 B2.4.56
956ca39 版本號更新至 B2.4.55
8a43950 版本號更新至 B2.4.54
84f846f 版本號更新至 B2.4.53
8a33ec8 版本號更新至 B2.4.52
5dbc2e2 版本號更新至 B2.4.51
8460886 feat: 新增日誌設定功能 — runtime 控制 HTTP/Voice log 開關
242d48b 版本號更新至 B2.4.50
13f93a7 fix: H264 螢幕分享修復 — 延遲 PLI + keyframe 快取 + throttle 優化
94ac4fa 版本號更新至 B2.4.49
