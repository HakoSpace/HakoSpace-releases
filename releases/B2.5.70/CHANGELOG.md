# HakoSpace B2.5.70

Release date: 2026-04-30

## Changes

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
94d9333 版本號更新至 B2.5.60
ab84bb5 feat(forum): nickname display + edit own post + picker UX (3 实测 issue)
4447385 版本號更新至 B2.5.59
7dc48c4 fix(forum): stable empty array ref in zustand selector — fix React error #185
4f9523d 版本號更新至 B2.5.58
c638fa3 fix(forum): mirror MessageArea pattern — h-12 tertiary header + explicit content bg
fbb4c91 版本號更新至 B2.5.57
6a519f2 fix(content-zone): black panel root cause + R5 follow-up cleanups
d37364f fix(forum): black panel on enter + missing settings sections explanation
