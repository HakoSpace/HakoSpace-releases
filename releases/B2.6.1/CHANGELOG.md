# HakoSpace B2.6.1

Release date: 2026-05-22

## Changes

648435d 版本號更新至 B2.6.1
5d73b87 fix(api): rollback forum rate limit on dedup-hit (I-0028 Thread 3)
580204f fix(api): propagate IsForumAdmin/IsServerAdmin/canEditNote errors (I-0028 Thread 2)
867c71a fix(api): split banned-word title/body check (I-0028 Thread 1)
dd05bbf fix(acl): extend CanSeeChannel to channel-scoped write paths + err-handling sweep (I-0027 Thread 1-4)
1a0c2d2 fix(ai): SendChannelMessageTool 加 caller CanSeeChannel gate (I-0027 Thread 6)
0555640 fix(acl): WS broadcast filter use per-recipient CanSeeChannel (I-0027 Thread 5)
54e1952 fix(acl): CanSeeChannel composite gate closes public-channel-in-private-group leak (I-0026 Thread 2)
e8f7ed9 fix(ai): tools_server.go DB error swallow → fail-closed across admin tools (I-0026 Thread 1)
ea0322b fix(api): channel_handler Pluck/IsServerAdmin error swallow fail-closed (I-0023 子議題 1+2)
bcb983a fix(ai): SendChannelMessageTool 私有 channel broadcast Pluck fail-closed (I-0022)
a3048cf docs(channels): 補 I-0024 channel-create reset comment 指向（dual-review fold-in）
c6177e7 fix(channels): channel 建立 modal 統一 reset via useEffect (I-0024)
2412fb2 fix(channels): Channel 建立 modal cancel / type-switch 補 reset IO/Page id (I-0018)
296b6ad fix(channels): UpdateChannel 私有↔公開切換 ChannelMember ops 包進 transaction (I-0020)
698dcb6 fix(ai): AI tool read-path 套用 per-user visibility filter (I-0019)
37c99a0 fix(ai): 補齊 AI tool 與 REST handler 5 處行為漂移 (I-0008)
b2069af chore(ws): 補註解標示 useChannelSwitch page guard 已是 fast-path
4c50537 fix(ws): page channel guard 集中於 wsService.subscribe（I-0014）
6945d21 fix(pages): /p/<slug> 加 EvalSymlinks，擋 runtime 建立的 symlink 路徑穿越（I-0017）
9ee05c2 fix(pages): PageViewBuffer retry cap + DeletePage race 修正（I-0015 / I-0016）
2a0ece6 版本號更新至 B2.6.0
e57b3c5 版本號更新至 B2.5.100
3f6c407 fix(pages): SW navigateFallback 漏排除 /p/<slug> → iframe 看到 SPA shell 而非 page HTML
87ca2fb 版本號更新至 B2.5.99
a5e1c4c fix(pages): /p/<slug> 加 trailing-slash redirect（不加則 relative asset path 全 404）
1cdecca 版本號更新至 B2.5.98
a91de42 fix(pages): iframe sandbox 加 allow-same-origin（不加則 CSP self 永不匹配 → page 空白）
310cb98 fix(i18n): 雙括弧 placeholder 顯示殘留 brace 文字（{15}/{43.8} 等）
1fde6dc 版本號更新至 B2.5.97
