# HakoSpace B2.5.74

Release date: 2026-05-01

## Changes

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
4b348cc 版本號更新至 B2.5.64
cf390ba fix(forum): root post uses MessageArea renderer; composer disabled UX
8f62b9d 版本號更新至 B2.5.63
7ae6e42 feat(forum): reuse MessageArea for thread + composer (full text-channel rendering)
08a73f6 版本號更新至 B2.5.62
ff859b1 fix(forum): WS forum-aware enforcement — close R10 5 blockers
9a23186 版本號更新至 B2.5.61
98bdc3b feat(forum): reuse text channel WS message path — full reply/reaction/edit/delete
