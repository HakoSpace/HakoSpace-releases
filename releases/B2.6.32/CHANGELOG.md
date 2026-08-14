# HakoSpace B2.6.32

Release date: 2026-08-14 (UTC)

## Features

- The image viewer now works with touch. Pinch to zoom around the point between your fingers, drag to pan, double-tap to switch between fit and 2x, swipe down to dismiss, and swipe sideways to move between images. On touch the top bar keeps only download and close, while the side arrows and the image counter stay where they were. (#99)
- Zooming with a mouse or trackpad now comes with panning. Drag with the left button to move a zoomed image, double-click to toggle zoom, and scroll anywhere over the viewer — not only over the image itself — to zoom around the cursor. A trackpad pinch (ctrl+scroll) zooms the image instead of the whole page. Keyboard controls were added as well: `+`, `-` and `0` for zoom, shift+arrow keys to pan. (#99)

## Bug Fixes

- The image viewer's controls no longer sit under a phone's notch, status bar or gesture bar. All four edges now respect the device's safe area, which also clears the side arrows in landscape and the counter along the bottom. (#99)
- A zoomed image could not be moved on any device — zooming clipped the image with no way to reach the rest of it. Zoom and pan now work together everywhere. (#99)
