# HakoSpace B2.6.28

Release date: 2026-08-03 (UTC)

## Features

- feat(voice): make a silent hardware-decode fallback diagnosable from the server log (aa06fa2)
- feat(frontend): send up to ten attachments on one message (76328a3)
- feat(frontend): render every attachment on a message, not just the first (a881c6f)
- feat(server): carry every attachment on the read path, not just the first (86bf372)
- feat(server): add message_attachments child table and the write path for it (8a71749)

## Bug Fixes

- fix(frontend): make a refused send and a failed sweep visible (c29ddf4)
- fix(server): stop the orphan sweep from offering live files for deletion (f224238)
- fix(server): let a sender attach only the files they uploaded (ae5eca4)
- fix(server): make every delete path see all N attachments, not just the first (f1d8d5d)
- fix(server): close the upload blacklist gap the extension sanitizer widened (a8863e1)
- fix(desktop): guard stray file drops from opening in the OS (ebc9fae)
- fix(i18n): add missing settings.themeManagement key (4732488)

## Chore

- chore: ignore root session scratch (handoff notes, syslog) (cb81cf5)

## Test

- test(server): pin fail-closed on every attachment read, and derive the last mirror (5f650c4)

