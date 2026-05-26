# HakoSpace B2.5.57

Release date: 2026-04-30

## Changes

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
2aba86a feat(forum): PR-E forum settings modal (server admin+ only)
454734e feat(forum): PR-D frontend forum panel V1.1 (list / detail / composer)
5443598 feat(forum): PR-F forum_post_count daily aggregation + admin endpoints
ea40ab5 feat(forum): PR-C rate limit subsystem (in-memory sliding window)
f20bfbf feat(forum): PR-B backend API + storage / admin handler 對接 V1.1
21c210b feat(forum): PR-A schema migration for forum channel V1.1
cb6e1ed 版本號更新至 B2.5.52
4463099 build(release) 加 --bump/--cleanup-prev/--no-preflight 自動化 release 流程
6ea2d1d 版本號更新至 B2.5.51
7d36dff fix(auth) 抽 AuthLayout 解決窄螢幕 auth 頁面無法 scroll 的 bug
dfacc2f chore(desktop) 移除 ffmpeg bundle extraResources 條目（ADR-0014 Option A）
61e1758 fix(legal) Clear-Site-Data 不清 storage，避免清掉 auth_token 導致 /legal/sign 401
acb7772 chore(desktop) 同步 package.json 版本至 2.5.49
6e45367 版本號更新至 B2.5.49
