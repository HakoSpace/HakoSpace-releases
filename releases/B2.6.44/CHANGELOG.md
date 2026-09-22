# HakoSpace B2.6.44

Release date: 2026-09-22 (UTC)

## Features

- feat(desktop): pick the HUD content size in desktop settings (cc4b8c9)
- feat(desktop): store a global HUD content size (small / medium / large) (3d7670d)

## Bug Fixes

- fix(hud): stop watching a share when the game overlay ends for good (d9e458f)
- fix(hud): keep a screen share you loaded yourself when a HUD window closes (3ab6d51)
- fix(desktop): stop receiving a share when the game HUD ends and its window closes (fc09a11)
- fix(hud): closing a picture-in-picture window opened from the HUD stops watching that share (cab9071)
- fix(desktop): close HUD picture-in-picture windows when the HUD exits and revoke their authorization on close (e1835c3)
- fix(desktop): picture-in-picture fullscreen fills the screen on monitors larger than 1080p (f9f2274)
- fix(hud): show yourself in the HUD voice widget while you are speaking (8888047)
- fix(desktop): picture-in-picture windows opened from the HUD no longer steal focus from the game (6fa6948)

