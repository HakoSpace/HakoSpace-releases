# HakoSpace B2.6.8

Release date: 2026-06-04 (UTC)

> 自 B2.6.7-pre 起的累積更新：新增連線中斷時的非侵入式重連提示、telemetry「請求刪除已上傳資料」功能，並修復語音加入卡頓問題。

## Features

- feat(frontend): 連線中斷時顯示非侵入式重連提示 pill (7926653)
- feat(telemetry): 加入「請求刪除已上傳資料」功能 + DB integrity guard (83bdb35)

## Bug Fixes

- fix(voice): 消除語音「加入卡住、要進出 2-3 次」的 churn (b2f4df1)
