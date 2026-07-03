# HakoSpace B2.6.20

Release date: 2026-07-03 (UTC)

## Features

- **Native hardware-accelerated screen sharing (Windows).** Screen sharing can now use a native zero-copy hardware H.264 engine when a supported GPU encoder is present — lower CPU use and smoother capture that keeps streaming even while the shared window is minimized or covered. The engine is chosen automatically (native when available, otherwise the built-in Chromium capture), and Settings shows a read-only badge for which engine your machine will use. (#75, #79)
- **Multi-user native screen sharing.** Native screen shares now attach to your own user tile, and several people can share in the same voice channel at once — matching how browser-based sharing already works. (#79)

## Bug Fixes

- **Push-to-talk (desktop):** fixed a microphone that could stay open after release and a global PTT hotkey that could stop responding. (#76)
- **Voice stage:** corrected the empty-state text, and made the "copy stream link" button work reliably in the desktop app. (#77)
- **External streams (OBS / WHIP):** forwarded external streams are now opt-in — click to load a stream instead of it playing automatically. (#78)
