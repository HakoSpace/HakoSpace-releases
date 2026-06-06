# HakoSpace B2.6.11

Release date: 2026-06-06 (UTC)

## 🔧 Hot-fix（B2.6.11）

- fix(ws): break hub self-deadlock that froze all WebSocket after a stale-session cleanup (ba72247)

本版其餘內容沿用 **B2.6.10**（原文未改動，僅附上方修復）：

---

# HakoSpace B2.6.10

Release date: 2026-06-06 (UTC)

## 🔧 Hot-fix（B2.6.10）

- fix(acl): CanPublishWHIP 用對 user_group_members.group_id 欄位 (39a6610)

本版其餘內容沿用 **B2.6.9**（原文未改動，僅附上方修復）：

---

# HakoSpace B2.6.9

Release date: 2026-06-04 (UTC)

## 🔧 Hot-fix（B2.6.9）

- feat(release): 新增 --hotfix 模式,changelog 沿用前一版 + 附加修復段 (ede4fcc)
- fix(telemetry): 既有實例升級不再誤判 DB integrity tampered (aa6fed8)
- fix(release): cleanup-prev 排除當前 tag 改用 fixed-string grep (170ef79)
- feat(release): GA changelog 涵蓋自上一個 latest 的累積變更 (a7b8659)

本版其餘內容沿用 **B2.6.8**（原文未改動，僅附上方修復）：

---

# HakoSpace B2.6.8

Release date: 2026-06-04 (UTC)

> 自 B2.6.7-pre 起的累積更新：新增連線中斷時的非侵入式重連提示、telemetry「請求刪除已上傳資料」功能，並修復語音加入卡頓問題。

## Features

- feat(frontend): 連線中斷時顯示非侵入式重連提示 pill (7926653)
- feat(telemetry): 加入「請求刪除已上傳資料」功能 + DB integrity guard (83bdb35)

## Bug Fixes

- fix(voice): 消除語音「加入卡住、要進出 2-3 次」的 churn (b2f4df1)
