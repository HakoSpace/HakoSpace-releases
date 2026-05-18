# HakoSpace B2.5.89

Release date: 2026-05-18

## Changes

49eb314 版本號更新至 B2.5.89
e68f7ee fix(rebuild): 加 --deploy gate 與 production guard 防誤部署
0f6caba fix(voice): 修舞台區幽靈 tile 殘留與離開音遺漏
c661247 fix(io): 白板首次開啟 race — 等 manifest 再 mount iframe
0331ca4 版本號更新至 B2.5.88
91cf511 settings: 修 admin 主題編輯器 TOKEN_LABELS i18n + 抽單一來源
69d190b 版本號更新至 B2.5.87
baa6302 settings: 補齊主題編輯預覽區 i18n（方案 C 通用化 demo 文案）
33bcca0 版本號更新至 B2.5.86
3cc4cc2 settings: 補齊主題設定 i18n 缺漏
69adf04 版本號更新至 B2.5.85
d25846b channel: 加入/切換 voice channel 時自動切到 voice tab
8f4f7ea 版本號更新至 B2.5.84
85a6fbc channel: 移除 sticky default + 補 enterChannel 對等清理 + 全空 empty state
8cf0b37 版本號更新至 B2.5.83
f1cdb4b channel: 統一進入 dispatcher + sticky default tab + activeChannelId 不變量
c7aa07f channel: 修正 multi 類型 default channel 進入後 fallback 到 MessageArea
ca03a97 版本號更新至 B2.5.82
0fd4a28 log: application 自寫 hako.log + tail 演算法 + viewer 狀態列
3abdbc5 channel: server 預設 channel 同源化（registry metadata + AI tool 補 validation）
35bed8b voice: 修補舞台區生命週期 — camera/screen 卡片殘留 + 媒體資源洩漏
1ed54fe ci(frontend): GitHub Actions vitest workflow + coverage + typecheck（ADR-0023 C）
bb319cb i18n: 行動版 tab 走 i18n + sidebar.disconnect 中文改「離開頻道」（I-0006, I-0007）
a24fd63 版本號更新至 B2.5.81
1e64fca test(frontend): 加入 vitest infra + messageParser 首批 12 case（I-0004）
58b8b23 NotePanel: toolbar 刪除線按鈕 label 改 S+line-through，對齊 B/I 字母風格（I-0005）
057c577 messageParser: 加 strikethrough 3+ tilde 行為註解（I-0003）
5d4fb1d messageParser: strikethrough 對齊 GFM ~~text~~（保留 ~text~ legacy fallback）
e376e21 voice: 統一 leave 廣播路徑，修復非主動離線殘留 voice/screen badge
72bddaa presence: auto-idle 偵測 (5min threshold) + race-safe pushSeq/manualOverride
