# HakoSpace B2.6.15

Release date: 2026-06-21 (UTC)

## Features

- feat(security): devtool 護欄 — 鎖桌面 DevTools + 網頁 console 自我XSS守衛 (6afc30d)

## Bug Fixes

- fix(ui): unclip server status dot, stop screen-share auto-minimize, auto-close voice source popover (b3814b1)
- fix(voice): prefer hardware H.264 over software VP9 for screen-share encode (00b3c62)
- fix(voice): fence stale peer-close to stop ghost tiles & duplicate channel presence (f6c2f0b)
- fix(uploads): download file attachments instead of opening a blank tab (01b2aec)
- fix(settings): TURN firewall note says UDP+TCP, not UDP-only (c9a184c)
- fix: TURN-over-TCP fallback + ICE candidate logging for IPv6/UDP-blocked voice joins (8d94870)

