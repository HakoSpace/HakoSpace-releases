# HakoSpace B2.6.14

Release date: 2026-06-18 (UTC)

## Features

- feat(soundboard): add volume bar to the sound picker popup (9487356)
- feat(settings): add Volume tab with system / voice / soundboard sliders (4afe265)
- feat(audio): add independent soundboardVolume setting (data layer) (5186480)
- feat(forum): wire keyset cursor into infinite scroll (e62eb94)
- feat(dm): virtualize DMChatArea with react-virtuoso + fix Crossfade height (dd37cfa)
- feat(messages): virtualize MessageArea with react-virtuoso (5aed201)
- feat(messages): bidirectional (after_id) pagination + store windowing foundation (79db3f9)
- feat(release): add --skip-docker to skip the Docker image dispatch (dd98eae)
- feat(docker): multi-arch image + disable in-app self-update in containers (5862034)
- feat(docker): official GHCR publish flow + hardened image (b97bdb8)

## Bug Fixes

- fix(voice): TURN-over-TCP fallback + ICE candidate logging for IPv6 / UDP-blocked voice joins (#29) (8d94870)
- fix(voice): apply input mode on (re)join + kill leave/rejoin session leak (a897c47)
- fix(desktop): safety net for chrome views + unclean-shutdown self-heal (ef855d0)
- fix(soundboard): perceptual volume taper + default 70 (9d5660b)
- fix(soundboard): honour soundboard volume in settings previews + hard 0 (f2d2686)
- fix(messages): fold buffer into newest-reaching setMessages (close round-4 race) (c425103)
- fix(messages): tri-review round 3 — buffer live msgs during load-around fetch (f63d1be)
- fix(messages): tri-review round 2 (609ac49)
- fix(messages): tri-review round 1 — re-entry, send-in-history, forum races (33b4a82)

## Docs

- docs(reorg): extract CLAUDE.md into rules/ + docs/ + plans/ (Phase 1) (fb286fa)
- docs(docker): native ARM runner matrix supersedes the QEMU note (b50028e)

## Chore

- chore(legal): bump EULA/Privacy to 2026-06-16, redact unreleased PRO/MAX names (84099e2)

## Other

- ci(docker): native ARM runner matrix instead of QEMU emulation (d163fef)
- ci(docker): fetch legal embed from public archive, drop hakofront token (fb6c484)
