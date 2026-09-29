# HakoSpace B2.6.48

Release date: 2026-09-29 (UTC)

## Features

- Channel settings: message space and file space are now separate. The retention settings of a text or voice channel are split into two sections, each maintained on its own terms, so files no longer push a channel's messages out. (#151)

  - **Message space** is how much of the conversation the channel keeps: the existing "Message limit", plus a new "Keep messages for (days)" setting (0 means no limit). Messages beyond either limit are removed oldest first, together with their files. Pinned messages are never removed.
  - **File space** covers the files posted in the channel: "Allow uploads", "Per-file limit (MB)" (0 follows the server's limit; it cannot be larger than the file space), "File space (MB)" — the setting previously named "Storage limit (MB)" — and "When the file space is full": "Refuse new uploads" (the default; nothing is removed automatically) or "Remove the oldest files". The settings page shows the per-file limit currently in effect, which is the smallest of the server's limit, the channel's per-file limit and the file space.
  - With "Remove the oldest files", the server's automatic cleanup, which runs every ten minutes, removes the oldest files until the rest fit. Their messages stay and show "Removed by this channel's file space rules" with the date. Files of pinned messages, and files another channel still uses, are never removed; if pinned files alone fill the space, new uploads are refused instead.
  - **Behaviour change on upgrade:** a channel that already had a storage limit used to remove its oldest messages, files included, whenever its files went over the limit. When the server is updated, such channels are switched to "Remove the oldest files", which removes only files and leaves their messages in place. Channels without a limit are not changed.
  - A refused upload now says why: uploading files is turned off in the channel, the file is over the channel's per-file limit, or the channel's file space does not have enough room. Files over the per-file limit are not added when you pick them. With "Allow uploads" off, the attach button is disabled and pasting or dropping a file explains why; people who can moderate messages can still attach files, but the per-file limit and the file space apply to everyone.
  - Automatic removals are now visible. When retention has removed a channel's earlier messages, the start of its history reads "Earlier messages were removed by this channel's retention rules", with how many and when. Every automatic removal is also written to the audit log with "System" as the actor; these entries are hidden until you tick "Show automatic cleanup". Nothing is announced to people who are online at the time.
  - These settings apply to text and voice channels only. Forum channels are not affected, and direct messages keep using the server-wide setting — their automatic removals are now recorded in the audit log too.
  - All of this is part of the server and the web client it provides, so it takes effect once the server is updated; the desktop app does not need to be updated for it.

## Bug Fixes

- Screen sharing from the Windows desktop app, including the game HUD's "Share this game" button, could silently do nothing after you had been in a voice channel for a long time, until you left and rejoined the channel. The app now renews your sign-in before it starts a share, and if the server still refuses the share, it renews your sign-in and tries once more. If that fails too, you see "Screen sharing could not start (HTTP 401)." instead of a share that never appears for anyone. The native capture engine also reports a share as started only once the server has accepted it, so a share the server refuses no longer looks live. (#150)

  - For the full fix, update both the desktop app and the server: the sign-in renewal is part of the web client each server provides, while the retry and the capture engine's reporting are part of the desktop app. Updating the server alone already prevents the expired sign-in; with only the desktop app updated, a refused share falls back to the app's built-in screen sharing.

- Text spoilers (`||…||`) now hide everything inside them. Links, mentions, inline code and emoji used to show through the cover, and on some themes so did the text. A spoiler can now be focused with Tab and revealed with Enter or Space, and once revealed it stays revealed. (#151)
- An image whose file can't be loaded now shows "Couldn't load this file" instead of an empty box. (#151)
- A channel or direct message with only a few messages now shows them right above the text box, instead of leaving empty space between the messages and the text box. (#151)
- The text chat in a voice channel's panel now follows that voice channel's own settings. It used to follow the settings of whichever text channel was open. (#151)

## Notes

- The native capture engine bundled with the Windows desktop app was rebuilt for this release. Its part of the screen-sharing fix comes from its own repository, so it has no pull-request number here. The game HUD program is the same build as in B2.6.47.
- In the game HUD panel, an image refused by a channel's file rules shows the general "The image wasn't attached" rather than the reason (the image stays in the text box, so pressing Enter tries again), and an image removed by a channel's file space shows as "Image can't be shown".
- The Privacy Policy and the EULA are unchanged in this release (still effective 2026-09-26 and 2026-07-08), so no new acceptance is required.
- No Docker image is published for this pre-release. Servers running the Docker image stay on their current version.
