# HakoSpace B2.5.2

Release date: 2026-04-10

## Changes

25b7a4b fix(hakoIO): 多功能頻道 tab 系統重構 + storage 修復
9203896 fix(hakoIO): 圖示風格、tab 共存、群組權限、白板持久化
cc1ca5c fix: IO app 列表載入改用 axiosInstance + 建立時驗證 app 已選擇
b4ce44a fix: 補齊 IO subtype 型別定義（api.ts, ws.ts）
350c3c1 feat: HakoIO 互動應用頻道系統
e12976b 版本號更新至 B2.4.96
b5d0f9e fix: codec 切換時重建 TrackLocal + 恢復 SetCodecPreferences
cded1a8 版本號更新至 B2.4.95
1988918 fix: 移除 SetCodecPreferences 修復 codec 切換時 viewer 被踢出
9f9e25f 版本號更新至 B2.4.94
761e4e8 fix: 偵測 mid-stream codec 切換並自動重新協商
965cdd6 版本號更新至 B2.4.93
468308c feat: 新增 VOICE_CLIENT_STATS — 每 5 秒上報 WebRTC stats 到 server log
39dc95a 版本號更新至 B2.4.92
0200aed fix: 停用 keyframe cache serving 修復所有 codec 的畫面卡住
18891c0 版本號更新至 B2.4.91
a082563 fix: SetCodecPreferences 鎖定同 codec 所有 profile 而非單一 profile
29f60bb 版本號更新至 B2.4.90
1e72131 diag: log offer SDP video codecs to verify SetCodecPreferences effect
e1ca564 版本號更新至 B2.4.89
e5e4522 fix: rollback 失敗 3 次後關閉 PC 避免無限循環
806224e 版本號更新至 B2.4.88
bff3ae1 fix: 從臨時 PeerConnection 取得正確的 codec params 修復 SetCodecPreferences
de3e312 版本號更新至 B2.4.87
9f1f6f5 fix: SetCodecPreferences 改為 SDP munging 確保 codec lock 生效
5d1bd82 版本號更新至 B2.4.86
fbe3745 refactor: 重新設計 codec 協商機制 — server 為唯一權威
aa6aab2 版本號更新至 B2.4.85
cdff731 fix: codec lock 使用 publisher 的精確 profile 而非所有 H264 profiles
b98d574 版本號更新至 B2.4.84
