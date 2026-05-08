# HakoSpace B2.5.81

Release date: 2026-05-08

## Changes

a24fd63 版本號更新至 B2.5.81
1e64fca test(frontend): 加入 vitest infra + messageParser 首批 12 case（I-0004）
58b8b23 NotePanel: toolbar 刪除線按鈕 label 改 S+line-through，對齊 B/I 字母風格（I-0005）
057c577 messageParser: 加 strikethrough 3+ tilde 行為註解（I-0003）
5d4fb1d messageParser: strikethrough 對齊 GFM ~~text~~（保留 ~text~ legacy fallback）
e376e21 voice: 統一 leave 廣播路徑，修復非主動離線殘留 voice/screen badge
72bddaa presence: auto-idle 偵測 (5min threshold) + race-safe pushSeq/manualOverride
8d18bd0 版本號更新至 B2.5.80
96610c9 dm-call: 跨 DM busy 檢查 + voice channel 接聽/撥打 prompt
d2fd713 chore: rename Agora/ → hakoApp/ + sync internal references
51fb69f 版本號更新至 B2.5.79
3ffb4d0 desktop(shortcuts): per-binding focus/global scope to stop key swallowing
da11d5f 版本號更新至 B2.5.78
31b6bf6 auth: 改寫忘記密碼流程，提供具體錯誤碼與雙層 rate limit
5512fb5 版本號更新至 B2.5.77
f48b05a legal(ADR-0022): strip hakofront chrome + inject dark-theme CSS for srcDoc render
969e54b 版本號更新至 B2.5.76
505846b legal: ADR-0022 embed-from-archive — binary-local EULA/Privacy + scroll-lock
b646980 版本號更新至 B2.5.75
df81d0f legal: email 路由 hsun@→legal@ + Privacy §8 語言優先權 + PrivacyVersion bump 2026-05-03 (ADR-0021)
5a40e53 版本號更新至 B2.5.74
2721eb4 chore(desktop): sync package version to 2.5.73
04f3f9f fix(content-zone): restore server theme wallpaper inheritance for follow_server channels
a73d56c 版本號更新至 B2.5.73
ae58699 fix(forum): author self-delete is hard delete + edit mode full-screen
78d3b7f 版本號更新至 B2.5.72
65fc431 fix(forum): bridge root post CUD to text-chat WS + ACL-gated broadcasts
126dac1 版本號更新至 B2.5.71
702f717 fix(whiteboard): unblock peer broadcast + toolbar single-row scroll
99a1afb 版本號更新至 B2.5.70
