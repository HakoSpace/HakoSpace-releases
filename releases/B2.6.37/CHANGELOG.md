# HakoSpace B2.6.37

Release date: 2026-09-03 (UTC)

## Features

- Viewer boost (Windows) graduates from its experimental preview: enabling it no longer triggers an administrator (UAC) prompt — the helper now attempts the boost directly and only falls back to elevation when actually needed — and clear on-screen indicators are always shown while a boost is active. (#107)

## Bug Fixes

- Screen-share pop-out windows have been reworked: the video now fills the window edge to edge, the window is frameless, and the stage tile hands the stream off to the pop-out and restores correctly when the pop-out closes. (#108)
