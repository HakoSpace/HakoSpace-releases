# HakoSpace B2.6.15

Release date: 2026-06-24 (UTC)

## Features

- feat(desktop): standalone desktop-app settings window (D2b phase 1 — shell + build pipeline) (#49) (2581867)
- feat(ui): consolidate notifications/settings/logout into a persistent tab bar (#42) (34cfb2d)
- feat(desktop): keep-alive multi-server tabs in the server sidebar (#41) (3ea5e84)
- feat(security): devtool 護欄 — 鎖桌面 DevTools + 網頁 console 自我XSS守衛 (6afc30d)

## Bug Fixes

- fix(desktop): own desktop settings in main so global hotkeys can't be clobbered (#48) (0f0b34c)
- fix(voice): follow OS default mic change by groupId, not the constant 'default' alias (#46) (6a4a6de)
- fix(desktop): make the sidebar in-voice glow actually visible (#45) (1a230b3)
- fix(voice): grace the stage presence gate so reconnecting members don't flash (#43) (d4fbfaf)
- fix(voice): live VAD sensitivity (OFF-stuck) + mic follows OS default device (#40) (7320fa9)
- fix(voice): register H.264 Constrained Baseline (42e01f) first so Chrome uses hardware encode (#39) (2591ed0)
- fix(voice): gate stage tiles on presence so departed users stop ghosting (#37) (6aca756)
- fix(voice): offer H.264 first on publisher-ingest transceiver so screen share uses hardware H.264 (#36) (092dfa5)
- fix(ui): unclip server status dot, stop screen-share auto-minimize, auto-close voice source popover (b3814b1)
- fix(voice): prefer hardware H.264 over software VP9 for screen-share encode (00b3c62)
- fix(voice): fence stale peer-close to stop ghost tiles & duplicate channel presence (f6c2f0b)
- fix(uploads): download file attachments instead of opening a blank tab (01b2aec)
- fix(settings): TURN firewall note says UDP+TCP, not UDP-only (c9a184c)
- fix: TURN-over-TCP fallback + ICE candidate logging for IPv6/UDP-blocked voice joins (8d94870)

## Refactor

- refactor(voice): remove dead frontend video-codec selector (server now forces the codec) (#36) (53275aa)
