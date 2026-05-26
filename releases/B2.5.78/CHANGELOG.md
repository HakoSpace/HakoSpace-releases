# HakoSpace B2.5.78

Release date: 2026-05-06

## Changes

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
d751be8 feat(io): write-behind storage cache bound to RoomActor lifecycle (ADR-0020)
a329e82 fix(whiteboard): help button center + fitAll defensive resize on retry
78b2a7d 版本號更新至 B2.5.69
6c87d0d fix(io): persistence race — bridge wireSeq isolation + load-success gate + ready dedup
20292ab 版本號更新至 B2.5.68
f49bb69 fix(whiteboard): block input until storage restore + Material Symbols icon set
b8ccd81 版本號更新至 B2.5.67
2e1e78c fix(forum): R15 closure — popup scroll-container ref + thread CTE deleted_at + reaction guard + reply_count recompute
91df9fb 版本號更新至 B2.5.66
c570ef7 fix(forum): soft-deleted reply persists after reload + reaction popup hidden under sticky header
a3635c5 版本號更新至 B2.5.65
61c1cb9 fix(forum): 4 实测 issues — list dedup / no pin reply / forum reply delete / 2-step post delete
