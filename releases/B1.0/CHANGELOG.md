# HakoSpace B1.0

Release date: 2026-02-28

## Updates (post pre-release)

18ee95b Integrate new logo: update desktop icons, tray icon, login/register/about pages
840edbb Fix EnsureDotEnv base64 slice out-of-bounds panic on first startup
e56bf7b Fix three issues found during Windows testing: auto-generate .env template on first start, first registered user immediately becomes Owner, fix desktop context menu/modal path resolution
## Changes

b9abf4c Fix desktop build script: convert version to semver format for electron-builder compatibility
486c8f1 Add backup management tool and orphan file cleanup utility
91701c8 Fix file orphan bug, add DM statistics and upload size settings, clean up legacy branding files
14c101b Overhaul backup to archive full data/ directory as zip, remove unimplemented server update feature
f549960 Fix desktop titlebar version: read VERSION file instead of package.json semver in dev mode
956f6d6 Merge settings page license info and about tabs, fix license URL, show version in desktop titlebar
42f652f Add release scripts and Electron About window (D14-D16, D19-D21)
694ef0d Add AI experimental feature flags: admin panel experiment badge, DM bot indicator, quick AI chat button
df0d740 Add telemetry infrastructure and About page legal documents (T1-T4, A1-A4)
78fd943 Update Privacy Policy: add opt-in telemetry disclosure and license verification connection notice
397224f Fill in official contact info and GitHub org links, update license label to Community Edition
d79c98d Harden release build: strip symbols from binaries, add EULA and Privacy Policy
598fa2e Add voice channel switch confirmation dialog to prevent accidental leave/join
2dc3677 Add version infrastructure and frontend branding display (D1-D13)
736742d Add release-plan.md: full release architecture plan (versioning rules, artifacts, task checklist)
224825a rebuild.sh: add --pull flag for deployment server sync via git reset --hard, avoid force push conflicts
e0ccf3d Refactor voice chat UI: unify stage area components, align screen share with avatars, add stage popout window
ea544ab Refactor voice chat UI: unify stage area components, align screen share with avatars, add stage popout window
eb59ed1 Fix Windows desktop: WSS connection, screen share audio separation, file:// compatibility, tray icon
caa01e8 Add dev-setup.sh: one-command full dev environment setup (core + Rust cross-compile + Wine + Docker)
5037a93 Add build-desktop.bat: Windows desktop one-click build (env check + winget auto-install + portable exe)
b3d762a .gitignore: restore data/ rule
673d8ec Remove data/ from git tracking (already in .gitignore)
a694420 init.sh: auto-install missing dependencies (supports pacman/apt/brew)
5866aff Improve build scripts: add init.sh environment bootstrap, rewrite rebuild.sh
cb0d882 Migrate server codebase
68ab501 Windows desktop: WASAPI exclude self audio capture, icon generation, cross-platform build scripts
d21b577 Tune voice parameters: VAD gate, mono channel, independent EC toggle, compressor threshold
f9f50b1 Fix three issues: invite code copy, registration page avatar, desktop process name
