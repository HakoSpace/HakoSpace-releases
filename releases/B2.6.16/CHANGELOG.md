# HakoSpace B2.6.16

Release date: 2026-06-29 (UTC)

This prerelease brings a reworked desktop app experience, smoother voice and screen sharing, cleaner in-app notifications, and connectivity and reliability fixes. Updating is recommended for testers.

## Desktop App

- Seamless automatic updates: the app checks for updates on launch and applies them in the background (download, silent install, and relaunch), and the manual "Check for Update" button is now one-click seamless too.
- Per-user installer that no longer requires an administrator prompt, plus native update notifications from your operating system.
- Multi-server tabs in the sidebar now stay alive in the background like browser tabs, so switching servers is instant and your calls and messages keep flowing while you're away.
- Server logos now show a colored halo when a server has active voice or an incoming DM call. The old "favorite" star was removed.
- New standalone settings window with the full settings UI (replacing the old in-app settings tab), opened from the sidebar gear. The settings page now scrolls properly and there's a dedicated tools area in the sidebar.
- Consolidated notifications, settings, and logout into a persistent tab bar.
- Fixed desktop global shortcuts (push-to-talk, mute, and others) being disabled by background server tabs.
- Fixed the portable Windows build occasionally rendering incorrectly after a second launch, with automatic recovery after an unexpected shutdown.
- Fixed the sidebar voice glow not being visible.

## Voice & Screen Share

- Screen sharing is smoother, with less stutter and lower CPU use, now that it uses your device's hardware video encoder when one is available.
- The microphone now follows your operating system's default device, including switching microphones during a call, and the speaking indicator tracks whichever mic is active.
- Voice sensitivity now applies instantly.
- Fixed members briefly appearing twice in a voice channel, or lingering in it after leaving, when reconnecting, and reduced tile flicker as members reconnect.

## Messaging

- File attachments now download directly instead of opening a blank tab.

## Interface

- Voice notifications (such as joining or leaving a call and connection messages) now appear as a subtle corner pill instead of inline banners in the channel list.
- Screen sharing no longer minimizes on its own, the voice source picker now closes automatically after a selection, and the server status indicator is no longer cut off.

## Self-Hosting

- Voice now connects more reliably on restrictive or firewalled networks (TURN-over-TCP fallback).
- Corrected the TURN firewall guidance in settings to note that both UDP and TCP ports are used.

## Security

- Hardened credential handling for content loaded in remote server tabs.
- Added a safety warning in the developer console to protect users from scams that try to trick them into pasting malicious code.
