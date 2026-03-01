# HakoSpace B1.0 Pre-Release

Release date: 2026-03-01

## Changes

### New Features
- Add comprehensive documentation page to the official website (`/docs` and `/zh-tw/docs`) — 12 sections covering all app features with sticky sidebar navigation and i18n support
- Add "Docs" link to the website header navigation
- Add hide non-sharing participants toggle button and participant count toolbar to the stage popout window
- Integrate new logo across website, desktop icons, tray icon, and app login/register/about pages
- Full Astro 5 website with landing, features, download, editions, legal, contact, and docs pages (EN + zh-TW)

### Bug Fixes
- Fix stage popout window not respecting the "hide non-sharing" toggle from the main panel
- Configure GORM logger to suppress harmless "record not found" messages on server startup
- Fix desktop titlebar to show only edition label without version number
- Fix proper multi-size ICO format for Windows desktop icon (6 sizes: 16–256px)
- Fix Footer legal links to use hash fragments for EULA/Privacy tab switching
- Fix EnsureDotEnv base64 slice out-of-bounds panic on first startup
- Fix registration username/nickname field swap, first-user Owner assignment, desktop context menu paths
