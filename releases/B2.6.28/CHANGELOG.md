# HakoSpace B2.6.28

Release date: 2026-08-05 (UTC)

The first stable release since B2.6.15, covering thirteen pre-release cycles: a
rewritten desktop shell (persistent server tabs, its own settings window, seamless
updates), the hakoCap native screen-capture engine, and a long run of voice,
screen-share and message fixes.

## Features

### Desktop

- **Server tabs stay alive.** Each server in the sidebar is a persistent tab that keeps its connection open in the background, so switching servers no longer reloads the app or drops you offline.
- **Settings in a window of their own.** Desktop settings moved out of the in-app tab into a standalone window, and are now owned by the main process — global hotkeys can no longer be clobbered by whichever tab happens to be in the foreground.
- **Automatic updates.** The app checks for a new version on launch, downloads it, installs silently and relaunches. Manual updating is a two-step "check, then update now", installs are per-user (no administrator prompt), and the pre-release channel can be opted into from settings.
- **Window position and size are remembered**, with guardrails for a monitor that is no longer attached.
- **Notifications, settings and sign-out** moved into a persistent tab bar, and sign-out asks for confirmation.
- **A halo on the server logo** shows where a direct-message call or voice session is active. The old "favorite" toggle was removed.

### Voice and screen sharing

- **hakoCap, a native screen-capture engine (Windows).** Screen sharing selects hardware capture and hardware H.264 encoding automatically when the machine supports it, and falls back to the built-in Chromium path otherwise. A read-only badge shows which engine is in use.
- **Screen-share quality is one control group** — resolution, frame rate and bitrate set independently, with server-side caps.
- **The voice channel's text chat can sit in a companion dock** beside the stage instead of covering it.
- **Voice activity moved from channel-list banners to a corner pill**, and is fully translated.

### Messages

- **A message carries up to 10 attachments** instead of exactly one — the composer takes several files together, and every attachment is rendered on the message.

### Diagnostics

- **A silent fallback to software video decoding is now diagnosable.** Chromium's hardware-acceleration status, GPU model and driver are written to the desktop diagnostics log, and the tray menu gained an item that opens that folder. During screen sharing the same snapshot rides along with the statistics the app already reports to the server you are connected to, so an operator can tell a decode fallback apart from a network problem.

## Bug Fixes

### Security and data safety

- **Attachment and upload handling hardened** — a message can only reference files its own sender uploaded, the orphan-file cleanup no longer offers files that are still in use, and the upload type filter was tightened. Updating is recommended for every server.
- **Credentials are isolated from remote server-tab content**, so a page loaded from a server cannot reach the desktop app's credential channels.

### Desktop

- **A portable build could show raw source code after a second launch.** Root cause fixed: each launch unpacks into its own directory instead of two instances deleting each other's files.
- **Push-to-talk works on both rails again** — foreground focus and the background keyboard hook — which fixes both a microphone stuck open and a dead global push-to-talk.
- **Automatic updating no longer reinstalls a version you already have**, and the update check now picks the highest version so the pre-release toggle behaves.
- A file dropped outside a valid drop target is no longer handed to the operating system to open.
- The sidebar's tools region and add button moved into the list, and the settings page scrolls.

### Voice and screen sharing

- **Screen share uses hardware H.264.** The publisher side offers it first, so the sender stops falling back to software VP9 encoding and the stutter that came with it.
- **A share you stopped watching can be watched again**, and the tile's controls collapsed into a single "stop watching".
- **Sidecar screen sharing fixed** for multiple viewers, state loss on reconnect, self-audio, and microphone or camera dropping out.
- **Stage tiles no longer ghost** — members who left disappear, and members reconnecting no longer flash in and out.
- **Fullscreen fills the video**, and controls stay reachable on a narrow tile.
- **The microphone follows the operating system's default device** when you change it, and the speaking glow follows the swap.
- **Voice-activity sensitivity applies live** instead of getting stuck off.
- **External (WHIP) streams render on the stage**, and are now opt-in — they load when you click, not automatically.
- The video-codec selector was removed from voice settings; the server decides the codec.

### Other

- Whiteboard sync no longer churns or leaves ghost players across reconnects.
- A send the server refuses, and a cleanup that fails, are now reported in the interface instead of failing silently.
- The theme-management heading in server settings showed a raw translation key instead of its label.

## Legal

- The EULA was updated to 2026-07-08 for the section 14 open-source carve-out, and THIRD_PARTY_NOTICES now ships with the app.
