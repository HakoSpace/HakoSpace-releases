# HakoSpace B2.6.31

Release date: 2026-08-14 (UTC)

## Features

- Message lists now load a scaled preview of each image attachment instead of the full-resolution file — typically tens of KB in place of a multi-megabyte screenshot. The original is fetched only when you open the image. Animated GIFs always load the original so they keep playing. (#97, #98)
- Images uploaded before this release are upgraded on their own. After the server starts, a rate-limited background job fills in the stored dimensions and previews of existing attachments; there is nothing to configure and no admin action to take. (#97, #98)

## Bug Fixes

- Image-heavy scrollback no longer jumps while you are reading it. Attachments reserve their space before the image data arrives, so text channels, the voice-channel side chat and DMs stop reflowing as images decode. Attachments uploaded before this release use a placeholder shape until the background job records their real dimensions. (#96, #98)
- A link preview that fails to load no longer hides every later preview image on the same message. (#96)
