# HakoSpace B2.5.41

Release date: 2026-04-20

## Changes

5b39624 版本號更新至 B2.5.41
9ae7a07 fix(auth) 修復登入時 isRestoring race 導致黑屏
e95c7ee fix(i18n) 貼圖版/音效版 → 貼圖板/音效板 錯字修正
53e541c 版本號更新至 B2.5.40
e68d62d feat(sound-trim) C2 + C3: SoundTrimModal + admin/personal 整合
d75b2c1 feat(sound-trim) C1: 音訊 utils + Waveform 元件
0d9c05c docs(sound) 新增音效剪輯 (Sound Trim) 規格書 v1.0
3fa5ece 版本號更新至 B2.5.39
31de17e feat(sound) S7: QA — cooldown 倒數走 useState/setInterval
ab4929d feat(sound) S6: 孤立檔案 + 紀錄碑 7 檔接線
97da457 feat(sound) S5: WS SOUND_PLAY + 語音室廣播 + Sidebar picker
a00c467 feat(sound) S4: 使用者 API + 個人類別 + favorites + UserSettings UI
db6e9a9 feat(sound) S3: 管理員前端 UI（ServerSettings → Sounds）
5f32ec8 feat(sound) S2: 上傳擴充 + admin CRUD + WAV 純 Go 驗證
1d7af98 feat(sound) S1: DB 模型 + AutoMigrate + ServerSetting + user cascade
1b0ffaa fix(monument) 補上貼圖統計顯示 + 切換開關 + 版本號 B2.5.38
1a95158 fix(sticker) 使用者上傳貼圖黑底 + 版本號 B2.5.37
750dcf3 版本號更新至 B2.5.36
6a44376 fix(sticker) 透明區域黑色 + admin 刪除通知 NaN
8971337 版本號更新至 B2.5.35
a7a841e fix(sticker) 內建貼圖不渲染 + 個人類別 tab 黑畫面
d294387 版本號更新至 B2.5.34
5e371d1 feat(sticker) M8: 筆記本整合 + favorites 持久化 + 內建貼圖
7a87eff feat(sticker) M7: fallback 素材（nano-banana）與渲染完善
63deef6 feat(sticker) M6: 孤立檔案、Telemetry、WS 即時廣播
b78652e feat(sticker) M5: 輸入整合 + Picker popup + 訊息渲染 + 送出驗證
bc4d87a feat(sticker) M4: 使用者 API + 個人類別 + UserSettings UI
c5dfae1 feat(sticker) M3: 管理員前端 UI（ServerSettings → Stickers）
9029c8b feat(sticker) M2: 上傳 context 擴充 + 管理員 CRUD API
3afc74e feat(sticker) M1: DB 模型 + AutoMigrate + ServerSetting + user cascade
