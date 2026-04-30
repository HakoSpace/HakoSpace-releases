# HakoSpace B2.5.64

Release date: 2026-04-30

## Changes

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
4783ffe fix(channel-type): close reviewer R3 drift gaps in ws.ts + import hygiene
5f2698c refactor(channel-type): single source of truth for channel.type values
255c30b fix(forum): backend channel type validation accepts 'forum'
04a30a8 版本號更新至 B2.5.56
4aba6cf fix(forum): create channel type buttons layout — remove double prefix + responsive grid
1c1a331 版本號更新至 B2.5.55
a66d590 fix(forum): add Forum option to Create Channel dialog (PR-D follow-up)
7bb01c4 版本號更新至 B2.5.54
6ed7c95 fix(desktop): remove sharp from devDeps to unblock Windows cross-compile
567acaa 版本號更新至 B2.5.53
72dccec fix(forum): PR-H 補完 reviewer suggestions + nits + spec gaps
5e9e950 fix(forum): PR-G hotfix 5 reviewer blockers (ADR-0015 code-review-gate)
610c66b ops(hooks): code-review-gate Stop hook for Agora cwd (ADR-0015)
