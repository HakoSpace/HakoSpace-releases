# HakoSpace B2.6.40

Release date: 2026-09-06 (UTC)

## Features

- App-wide right-click context menus. Right-click behavior is now consistent across the whole app (desktop, browser, and PWA): a native-feeling context menu opens at the cursor, while the browser's own menu is kept only in text inputs and on selected text. On touch devices, long-press opens the same menu as a bottom sheet, and tap works like left-click. Menus support keyboard navigation (arrow keys, Escape). (#111)
- Member interactions are unified: left-clicking or tapping a member in the voice list or the member list opens their profile card, while right-click or long-press opens a member menu with a per-user volume slider (when you share a voice room) and a view-profile action. (#111)
- The DM section header in the sidebar now shows a total unread badge (capped at 99+), visible even when the section is collapsed. (#112)
- Incoming DM messages now play a notification sound. Admins can upload a custom sound in the Notifications settings tab (server-level, like other custom sounds). The sound respects the existing notification mute switch and the system volume setting, and stays silent for your own messages and for the conversation you are currently viewing. (#112)

## Bug Fixes

- Custom notification sounds now load at app start, so users who never join voice channels hear admin-uploaded sounds too. (#112)
- Fixed a ghost unread that could appear (and refuse to clear) when a stranger messaged you for the first time. (#112)
- Messages you send from another device no longer count toward your own unread badge. (#112)
