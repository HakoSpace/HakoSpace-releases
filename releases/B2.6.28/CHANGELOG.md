# HakoSpace B2.6.28

Release date: 2026-08-05 (UTC)

## Features

- feat(voice): make a silent hardware-decode fallback diagnosable from the server log (aa06fa2)
- feat(frontend): send up to ten attachments on one message (76328a3)
- feat(frontend): render every attachment on a message, not just the first (a881c6f)
- feat(server): carry every attachment on the read path, not just the first (86bf372)
- feat(server): add message_attachments child table and the write path for it (8a71749)
- feat(voice): companion-dock treatment for the voice-channel text chat (Lens B) (39abf76)
- feat(voice): unify screen-share quality into independent resolution/fps/bitrate + server caps (0440d6a)
- feat(desktop): route hakoCap screen share to the per-user sidecar ingest (c76b230)
- feat(desktop): wire hakoCap V2 daemon for screen sharing + auto engine badge (5471ba6)
- feat(desktop): remember window position & size with display guardrails (95653c9)
- feat(voice): replace channel-list voice banners with corner transient pill + i18n (6cce4c7)
- feat(release): add release-note review gate — en-US machine guard + checklist (ef0b356)
- feat(desktop): seamless one-click "Check for Update" (9f6f859)
- feat(desktop): seamless auto-update on launch (check → download → silent install → relaunch) (ad62bde)
- feat(desktop): drop server "favorite" + add DM-call halo on the server logo (34a088c)
- feat(desktop): D2b Phase 2 — full settings UI in standalone window + remove old tab (4f86c89)
- feat(desktop): standalone desktop-app settings window (D2b phase 1 — shell + build pipeline) (2581867)
- feat(ui): consolidate notifications/settings/logout into a persistent tab bar (34cfb2d)
- feat(desktop): keep-alive multi-server tabs in the server sidebar (3ea5e84)

## Bug Fixes

- fix(frontend): make a refused send and a failed sweep visible (c29ddf4)
- fix(server): stop the orphan sweep from offering live files for deletion (f224238)
- fix(server): let a sender attach only the files they uploaded (ae5eca4)
- fix(server): make every delete path see all N attachments, not just the first (f1d8d5d)
- fix(server): close the upload blacklist gap the extension sanitizer widened (a8863e1)
- fix(desktop): guard stray file drops from opening in the OS (ebc9fae)
- fix(i18n): add missing settings.themeManagement key (4732488)
- fix(desktop): stop spurious auto-update on an already-latest install (4302851)
- fix(voice): screen share re-watchable after unload + merge tile controls to one "stop watching" (68aab67)
- fix(voice): stage tile fullscreen fills the video + keep controls reachable on narrow tiles (dd14a0d)
- fix(voice): sidecar screen-share — multi-user, state-loss, self-audio, mic/camera-drop (ba1d1bf)
- fix(desktop): let hakoCap probe's cold GStreamer registry build finish + persist (c2dcc00)
- fix(desktop): name the daemon file in win.extraResources `to` (hakoCap must be a dir) (9f2bdb4)
- fix(voice): gate WHIP external streams behind ScreenSubs (opt-in click-to-load) (6cfb037)
- fix(voice): correct stage empty-state copy + robust WHIP clipboard copy (6b33301)
- fix(desktop): dual-rail push-to-talk (focus + hook) — fixes stuck-open mic and dead global PTT (5f0b876)
- fix(build): ship uiohook-napi N-API prebuilds instead of rebuilding natives (824e151)
- fix(desktop): global push-to-talk via passive keyboard hook (real keyup, no key swallowing) (c316707)
- fix(voice): render WHIP screen-share tile on stage (c2425e9)
- fix(desktop): split manual update into two steps (check → "Update now") (bcdb675)
- fix(io): stop whiteboard sync churn + ghost players across WS reconnects (a1da8ea)
- fix(update): select highest-version release so the prerelease toggle works (8ba1de4)
- fix(voice): keep self speaking-glow following a mic device swap + strip follow diagnostics (c712101)
- fix(desktop): client-side update notifications + per-user install (UAC-free) (769b218)
- fix(voice): follow OS default mic by polling enumerateDevices + explicit-id re-acquire (f60460d)
- fix(desktop): sidebar tools region + add-btn into list; scrollable settings page (6c61dde)
- fix(desktop): isolate credential IPC from remote server-tab content (1d76897)
- fix(desktop): portable double-launch ROOT CAUSE — unique unpack dir per launch (3d560ce)
- fix(desktop): detect + auto-heal double-launch "raw source" chrome render (01c7e97)
- fix(desktop): hard-exit the losing 2nd instance to stop double-launch cache corruption (0bb1669)
- fix(desktop): About popup → settings + stamp protocol in the Windows release build (71e12d5)
- fix(desktop): pre-release r1 — double-launch cache corruption + restore settings update UI (08f1227)
- fix(desktop): own desktop settings in main so global hotkeys can't be clobbered (0f0b34c)
- fix(voice): follow OS default mic change by groupId, not the constant 'default' alias (6a4a6de)
- fix(desktop): make the sidebar in-voice glow actually visible (1a230b3)
- fix(release): copy the newest desktop build, not the oldest (ls -t) (2eb1f4e)
- fix(voice): grace the stage presence gate so reconnecting members don't flash (d4fbfaf)
- fix(voice): live VAD sensitivity (OFF-stuck) + mic follows OS default device (7320fa9)
- fix(voice): register H.264 Constrained Baseline (42e01f) first so Chrome uses hardware encode (2591ed0)
- fix(release): generate latest.yml before checksums so SHA256SUMS self-verifies (4a71c0a)
- fix(voice): gate stage tiles on presence so departed users stop ghosting (6aca756)
- fix(voice): offer H.264 first on publisher-ingest transceiver so screen share uses hardware H.264 (092dfa5)

## Refactor

- refactor(voice): remove dead frontend video-codec selector (server now forces the codec) (53275aa)

## Docs

- docs(release): codify pre/latest dual-line model — no-coexistence is intra-line (472e86e)

## Chore

- chore: ignore root session scratch (handoff notes, syslog) (cb81cf5)

## Test

- test(server): pin fail-closed on every attachment read, and derive the last mirror (5f650c4)

## Other

- legal: bump EULA to 2026-07-08 for §14 OSS carve-out + ship THIRD_PARTY_NOTICES (aa46e41)
- spike(desktop): seamless install — silent + auto-relaunch on both update paths (050c794)

