# HakoSpace B2.4.57

Release date: 2026-03-30

## Changes

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
df4c4f8 fix: restart/update script 用 env -i 啟動新 process，確保 .env 變更生效
06bdb20 版本號更新至 B2.4.48
2950f5a fix: DM 已讀直接通知後端 — 不再完全依賴 IntersectionObserver
b1f32b5 版本號更新至 B2.4.47
942ef23 fix: DM 已讀 fallback — IntersectionObserver 未觸發時手動偵測可見訊息並通知後端
8013d34 版本號更新至 B2.4.46
25dd865 feat: Theme 繼承系統 — inherit_background / inherit_colors / inherit_fonts
d73362e 版本號更新至 B2.4.45
2232ccf fix: tab 切換時同步 channel theme — voice/text/DM 各自套用正確主題
9c06a54 版本號更新至 B2.4.44
45b57f6 feat: titlebar_opacity + channel theme debug logs
9fa6c50 版本號更新至 B2.4.43
eceae44 feat: 背景系統雙層改造 — theme wallpaper + channel background
a5e363e 版本號更新至 B2.4.42
3f370fe fix: Protocol version 統一為 B2，單一來源
2d1b5de 版本號更新至 B2.4.41
95e90e7 feat: WS protocol version gate + token refresh 不再觸發 WS 重連
6cf0102 版本號更新至 B2.4.40
6285180 fix: token refresh 觸發 WS disconnect/reconnect 無限循環
