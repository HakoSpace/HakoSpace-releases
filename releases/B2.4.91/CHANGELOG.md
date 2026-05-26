# HakoSpace B2.4.91

Release date: 2026-04-03

## Changes

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
