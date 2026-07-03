# HakoSpace B2.6.21

Release date: 2026-07-03 (UTC)

## Bug Fixes

- **Native (hardware-accelerated) screen sharing could get stuck on the Chromium engine.** On some machines the hakoCap hardware-encoder detection timed out on first launch and never recovered — screen sharing fell back to the built-in Chromium engine, and Settings showed the "Chromium" badge, even on a GPU with a supported H.264 encoder. Detection now runs to completion and its result persists, so the native engine is used whenever the hardware supports it.
