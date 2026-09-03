# HakoSpace B2.6.39

Release date: 2026-09-03 (UTC)

The first stable release since B2.6.28, covering eleven pre-release cycles: a
reworked desktop startup (splash-gated launcher, staged updates, launch at
login), an image pipeline for message attachments, screen-share pop-out windows
rebuilt around true fullscreen, and viewer boost for Windows.

## Features

### Desktop

- **Starting up got a splash screen — and updates happen behind it.** Update checks and installs run before the main window exists, so the app never opens on a stale version, and a startup that fails now shows a diagnosable error window instead of nothing.
- **Updates are staged in the background.** The app periodically pre-downloads the next version while you use it; installing happens when you choose to restart, not when the download finishes.
- **Launch at login and start minimized.** A new startup settings card can register the app to start with the system (Windows and Linux) and optionally start minimized to the tray.
- **Per-server display zoom.** Each server tab keeps its own zoom level — set it from the settings card, Ctrl+scroll, or keyboard shortcuts, with a corner indicator while it changes.
- **Viewer boost (Windows).** An opt-in setting that keeps a screen share you are watching smooth while the machine is under heavy GPU load (for example, while gaming). On current Windows builds enabling it needs no administrator prompt (older systems may still ask); while a boost is active the title bar shows a persistent badge, with a brief toast when it starts.

### Messages and media

- **Images now ship with previews and dimensions.** The message list loads lightweight previews instead of full-size originals, image-heavy scrollback stops shifting because image space is reserved up front, existing history is backfilled, and photos taken sideways display upright.
- **The image viewer learned touch.** Pinch and swipe gestures, zoom anchored to the cursor or fingers, and controls that clear notches and rounded corners on modern screens.

## Bug Fixes

### Security and data safety

- **The screen-share pop-out window was hardened against script injection.** Updating is recommended.

### Voice and screen sharing

- **Screen-share pop-out windows were rebuilt.** The video fills a frameless window edge to edge, the whole surface drags, the stage tile hands the stream to the pop-out and restores it on close, and double-click (or the new control-bar button) enters true fullscreen with Esc to leave.
- **A voice connection that fails while being set up is now readable.** Errors that used to vanish silently are surfaced by name, and a stalled setup recovers through a timeout instead of hanging.
- **Mobile users are told screen sharing is unavailable there** instead of the button failing silently.

### Messages

- **Chat works in narrow layouts.** The composer adapts instead of being crushed, the message list no longer scrolls sideways, and your own direct messages no longer clip at the right edge.
