# HakoSpace B2.6.22

Release date: 2026-07-03 (UTC)

## Bug Fixes

Fixes for native (hardware) screen sharing:

- **Multiple people can now screen-share at once.** A second person in a voice channel couldn't start a native screen share while someone else was already sharing (it silently failed until the first person stopped). Concurrent per-user shares now work.
- **The Stop button no longer gets stuck.** When another person in the channel stopped their share, your own share button could lose its state and become un-stoppable while you were still sharing. Each person's share now tracks its own state.
- **You no longer hear your own shared audio.** The self-preview looped your own screen's system audio back to you (doubled/echoed); self-preview is now video-only.
- **Your mic and camera no longer drop when you stop sharing.** Stopping a native screen share could remove your microphone and camera from everyone else in the channel until you rejoined; now only the screen is removed.
