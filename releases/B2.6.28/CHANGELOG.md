# HakoSpace B2.6.28

Release date: 2026-08-03 (UTC)

## Features

- feat(message): a message now carries up to 10 attachments instead of exactly one — the composer takes several files together, and every attachment is rendered on the message (#88)
- feat(desktop): a silent fallback to software video decoding is now diagnosable — Chromium's hardware-acceleration status, GPU model and driver are written to the desktop diagnostics log at startup and whenever the GPU process changes state, and the tray menu gained an item that opens the diagnostics folder (#91, aa06fa2)
- feat(voice): during screen sharing, the desktop app adds that GPU and decoder snapshot to the 5-second screen-share statistics it already reports to the server you are connected to, so an operator can tell a hardware-decode fallback apart from a network problem (#91, aa06fa2)

## Bug Fixes

- fix(server): attachment and upload handling hardened — a message can only reference files its own sender uploaded, the orphan-file cleanup no longer offers files that are still in use, and the upload type filter was tightened. Updating is recommended for every server (#89)
- fix(frontend): a send the server refuses, and a cleanup that fails, are now reported in the interface instead of failing silently (#89, c29ddf4)
- fix(desktop): a file dropped outside a valid drop target is no longer handed to the operating system to open (ebc9fae)
- fix(i18n): the theme-management heading in server settings showed a raw translation key instead of its label (4732488)
