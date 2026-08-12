# HakoSpace B2.6.29

Release date: 2026-08-12 (UTC)

## Features

- **Desktop: start with the system, and start minimized.** A new Startup card in desktop settings can register HakoSpace to launch at login — the Run key on Windows, an XDG autostart entry on Linux — and can have it open straight to the tray instead of a window. Both switches are independent, and the card reports honestly when the platform cannot support them (for example an AppImage whose filename a desktop environment could never launch). (#94)

## Bug Fixes

- **Screen sharing from a phone or tablet now says it is unavailable** instead of doing nothing at all. The button no longer flashes through "starting" and settles back to idle with no message, and a share that fails for any other unrecognised reason now reports the failure rather than staying silent. The camera control beside it is unaffected. (#93)
- **The tray menu restores a minimized window.** "Show" and "Desktop settings" in the tray menu left a minimized window minimized; every path that brings the window forward now behaves the same way. (#94)
- **A failed startup is diagnosable instead of invisible.** A crash on the startup path — a tray that cannot be created, an error thrown while the app initialises — used to leave a process with no interface and no trace; it is now written to the diagnostics log, and the app still tries to get a window on screen. (#94)
