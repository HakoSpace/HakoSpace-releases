# HakoSpace B2.6.43

Release date: 2026-09-21 (UTC)

## Features

- feat(desktop): tell the game HUD when the signed-in user changes, and validate action request ids (e9a3e37)
- feat(desktop): HUD opacity has no floor, background defaults to 50%, first-enable notice matches Privacy 2026-09-18 (f0ab59a)
- feat(desktop): package hakoHUD into the Windows build (P2.7) (dbf503d)
- feat(desktop): hakoHUD settings page, i18n and WebView2 probe (P2.6) (fb09ade)
- feat(desktop): hakoHUD picture-in-picture (P2.5) (f4e7d88)
- feat(desktop): hakoHUD media cache (P2.4) (93c78d8)
- feat(desktop): hakoHUD renderer bridge (P2.3) (d3e33c6)
- feat(desktop): hakoHUD pipe server and child supervisor (2a24948)

## Bug Fixes

- fix(desktop): run HUD watch-share and in-game disable even when the request id is malformed (3886e76)
- fix(desktop): HUD first-enable notice says messages sent from the HUD go to your server (7266eb9)
- fix(legal): version the consent embed URL so a policy bump never shows cached old text (b9bb991)
- fix(desktop): stop logging which key the hook delivered (8274cbc)

## Docs

- docs(desktop): record that HUD messages are trimmed like composer messages (0cfed09)

## Chore

- chore(release): sync THIRD_PARTY_NOTICES into HakoSpace-releases (a639455)

## Test

- test(i18n): fail if the Chinese HUD notice says messages are not sent to your server (0513a87)

## Other

- legal: bump PrivacyVersion to 2026-09-18 (game HUD disclosure) (76672e4)

