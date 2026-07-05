# HakoSpace B2.6.23

Release date: 2026-07-05 (UTC)

> Re-cut (2026-07-05): bundles an updated hakoCap native screen-capture daemon so the new screen-share resolution cap works end-to-end on the native path. No app-code changes vs the initial B2.6.23-pre — only the Windows desktop build changed; the Linux and server builds are byte-for-byte identical.

## Features

- feat(voice): unify screen-share quality into independent resolution/fps/bitrate + server caps (0440d6a)

## Bug Fixes

- fix(screen-share): the native (hakoCap) capture engine now honors the resolution cap with an aspect-preserving height downscale, so a capped share no longer stretches non-16:9 (ultrawide) displays
