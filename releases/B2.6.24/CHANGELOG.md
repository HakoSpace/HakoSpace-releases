# HakoSpace B2.6.24

Release date: 2026-07-07 (UTC)

## Bug Fixes

- Native screen sharing: fixed static and low-motion screens (game menus, paused games, idle desktops) that could fail to load, or appear frozen for viewers, until on-screen movement resumed. The native capture engine now keeps the stream alive, so the picture stays live and newly-joined viewers load it immediately.
