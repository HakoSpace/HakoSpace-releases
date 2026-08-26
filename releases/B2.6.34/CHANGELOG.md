# HakoSpace B2.6.34

Release date: 2026-08-26 (UTC)

## Features

- The desktop app can now zoom server tabs, the desktop counterpart of browser page-zoom on the web build. Pick a level from the new display-zoom card in the desktop settings window, step with Ctrl+= / Ctrl+- (Ctrl+0 returns to 100%), or hold Ctrl and scroll the mouse wheel — the wheel gesture has its own on/off switch. The ladder follows Chrome's familiar stops (50%–200%), a small corner pill shows the level as it changes, and shortcuts you have bound yourself — push-to-talk included — always take priority over the zoom keys. (#103)

## Bug Fixes

- In direct messages, your own right-aligned message bubbles were clipped at the right edge. The entire message list was silently shifted 16px to the right — the same layout fault that once made the list permanently scrollable sideways — which swallowed the right-hand gutter. Direct messages and channel views now keep their intended side gutters on both edges. (#102)
