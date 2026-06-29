# HakoSpace B2.6.15

Release date: 2026-06-29 (UTC)

This stable release rolls up everything user-facing since B2.6.0. Highlights include seamless desktop auto-updates, smoother screen sharing, a faster messaging experience, a reworked soundboard volume system, and broad security and reliability improvements. Updating is recommended for all servers and clients.

## Desktop App

- Seamless automatic updates: the app checks for updates on launch and applies them in the background (download, silent install, and relaunch). The manual "Check for Update" button is now one-click seamless too.
- Per-user installer that no longer requires an administrator prompt, plus native update notifications from your operating system.
- Multi-server tabs in the sidebar now stay alive in the background like browser tabs, so switching servers is instant and your calls and messages keep flowing while you're away.
- Server logos now show a colored halo when a server has active voice or an incoming DM call. The old "favorite" star was removed.
- New standalone settings window with the full settings UI (replacing the old in-app settings tab), opened from the sidebar gear. The settings page now scrolls properly and there's a dedicated tools area in the sidebar.
- Fixed desktop global shortcuts (push-to-talk, mute, and others) being disabled by background server tabs.
- Fixed the portable Windows build occasionally rendering incorrectly after a second launch, with added automatic recovery after an unexpected shutdown.

## Voice & Screen Share

- Screen sharing is now much smoother with significantly lower CPU usage. The obsolete manual quality selector was removed, since the best option is now chosen automatically.
- The microphone now follows your operating system's default device, including switching microphones during a call, and the speaking indicator tracks whichever mic is active.
- Voice sensitivity and per-user volume now apply instantly. Fixed the per-user volume slider not displaying.
- Fixed needing to rejoin voice several times to connect, fixed push-to-talk problems after rejoining, and fixed people appearing twice or lingering in voice after reconnecting.
- Voice now connects more reliably on restrictive or firewalled networks.
- Screen sharing no longer minimizes on its own, and the voice source picker now closes automatically.

## Messaging

- New live preview in the composer for fonts, stickers, and markdown that you can toggle on or off.
- Much faster, smoother scrolling in messages, DMs, and forums, with older and newer messages loading smoothly as you scroll.
- File attachments now download properly instead of opening a blank tab.
- Fixed personal stickers not showing to other members in shared channels.
- Moved the DM list from the left sidebar to the bottom of the right-hand member panel.
- Fixed the channel-creation dialog not resetting its fields between uses.

## Soundboard

- New Volume settings tab with independent sliders for system, voice, and soundboard, plus a volume bar in the sound picker popup.
- Smoother volume control that better matches what you actually hear, with a complete mute at the lowest setting and a comfortable default level, applied consistently including settings previews.
- Sound uploads and trimming now enforce the size limit with clear, specific error messages.

## Interface

- Consolidated notifications, settings, and logout into a persistent tab bar.
- The background now crossfades smoothly when switching tabs instead of flashing, each tab shows the correct theme, and the global background shows through the monument panel again.
- Added subtle motion and clearer feedback throughout: member-list enter and leave animations, fade transitions, success and error cues, and clearer voice-control states.
- Added a non-intrusive reconnect indicator that appears when the connection drops.
- Fixed custom theme colors not saving.

## Self-Hosting

- Official multi-architecture (amd64 and arm64) Docker image, published to GHCR with a hardened build.
- In-app self-update is disabled inside containers, so updates are managed through your image.
- You can now request deletion of telemetry data you have already uploaded.
- Fixed a false-positive integrity warning during upgrades.
- HakoIO embedded apps can now show pop-up messages, enter fullscreen, respond to app open and close events, and upload images through the host.

## Security & Reliability

- Strengthened permission and visibility enforcement across the app and self-hosted server, and tightened credential handling throughout. Updating is recommended.
- Added a safety warning in the developer console to protect users from scams that try to trick them into pasting malicious code.
- Improved the stability of real-time connections as sessions reconnect.
- Improved interface resilience so an isolated display error stays contained instead of blanking the whole app.
