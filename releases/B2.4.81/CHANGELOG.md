# HakoSpace B2.4.81

Release date: 2026-04-02

## Changes

b6ac087 版本號更新至 B2.4.81
6d3787c diag: log screen track add/skip in syncPeersActor
a682503 版本號更新至 B2.4.80
b7acaa6 fix: 重新啟用 TWCC 加速 VP9 bitrate ramp-up
88c6a53 版本號更新至 B2.4.79
2ee86ae fix: H264 explicit mode 改為優先而非排他 + 移除錯誤的 SDP fallback
b23b384 版本號更新至 B2.4.78
664b6ee fix: 移除 TWCC 修復 H264 screen share encoder 無輸出
af13f1f 版本號更新至 B2.4.77
9b462cb diag: log answer SDP m-lines for screen share debugging
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
