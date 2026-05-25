# HakoSpace B2.6.3

Release date: 2026-05-25

## Changes

a2cc439 版本號更新至 B2.6.3
9be28ad feat(devx): contrib/cloudflared.service systemd unit + doc 加 cloudflared 提示
dee0504 新增 composer 即時預覽（字型／貼圖／markdown，可開關）
a8a744b fix(ui): 從 browser/voice tab 切到 DM/多功能頻道時正確切換畫面
8e07a65 fix(ui): 各 tab 解析自己的 theme，修復背景跨 tab 繼承
571fe7c fix(ui): monument 面板恢復全域背景透出 + 修復長內容捲動
65f5132 refactor(ui): DM 區塊從左側 sidebar 移到右側成員面板底部
7773857 feat(devx): vite allowedHosts + systemd unit 給 CF Tunnel demo daemon
7597063 feat(devx): frontdevhost.sh 接 first-server real-data 流程 + CORS origin rewrite
7fa11f5 版本號更新至 B2.6.2
3fb769a refactor(voice): VAD source 從 AnalyserNode 改讀 inbound-rtp.audioLevel (stage A)
420d645 feat(devx): 加入 frontdevhost.sh 前端 dev server lifecycle 工具
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
