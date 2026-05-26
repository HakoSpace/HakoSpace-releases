# HakoSpace B2.4.84

Release date: 2026-04-03

## Changes

b98d574 版本號更新至 B2.4.84
a387397 fix: H264 不送 cached keyframe 避免 seq gap 導致 jitter buffer 凍結
b8bc31e 版本號更新至 B2.4.83
299645e fix: 使用 OnTrack 時的實際 codec 而非 SDP renegotiation 後的值
7fadc36 版本號更新至 B2.4.82
d66eac8 fix: server 端鎖定 video transceiver codec 為 publisher 實際 codec
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
