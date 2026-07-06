# HakoSpace B2.6.23

Release date: 2026-07-06 (UTC)

> Re-cut (2026-07-06): bundles the aspect-corrected hakoCap native screen-capture daemon so a capped native share keeps the source aspect ratio (a 1920×1080 source at 720p now downscales to 1280×720, not a squished 1920×720). No app-code changes vs the initial B2.6.23-pre — only the Windows desktop build changed; the Linux and server builds are byte-for-byte identical.

## Features

- feat(voice): unify screen-share quality into independent resolution/fps/bitrate + server caps (0440d6a)

## Bug Fixes

- fix(screen-share): the native (hakoCap) capture engine honors the resolution cap with an aspect-preserving downscale — the output width/height are derived from the source aspect ratio, so a capped share no longer squishes or stretches non-16:9 (ultrawide) displays
