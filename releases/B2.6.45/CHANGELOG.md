# HakoSpace B2.6.45

Release date: 2026-09-24 (UTC)

## Important: updated Privacy Policy

- The Privacy Policy has a new effective date, 2026-09-24. After a server is updated to this version, every user of that server is asked to read and accept the updated Privacy Policy the next time they connect. The EULA is unchanged (2026-07-08). (#143)
- What changed in the policy: the section about the foreground window information the desktop app reads while the game HUD is on now also covers the new "Share this game" button described below — the window identifier is used to identify which window to share, and the shared content itself is handled as the policy's screen-sharing section describes. That section also now names two pieces of information the desktop app already read but the policy did not list: the window identifier, and the display the window is on together with that display's scaling factor. Nothing else in the policy changed.
- Everyone on an updated server is asked to accept it, including people who use HakoSpace in a web browser. The game HUD itself is part of the Windows desktop app and does not appear in a browser.

## Features

- Game HUD: share the game you are playing straight from the HUD panel. "Share this game" is a fourth button in the panel's own controls row, next to muting your microphone, deafening yourself and leaving the channel. (#142)

  - Pressing it sends the request and closes the panel back to the game right away — there is no confirmation dialog — and the outcome appears in game as a brief hint in the same style as the startup hint: "Sharing", followed by your HUD shortcut and how to stop, when it starts, or the reason it could not ("Something is already being shared", "Can't find the window for the current game", that you are no longer in a voice channel, or that the desktop app is no longer reachable). If no confirmation has arrived after about 45 seconds the hint reads "Didn't get confirmation that sharing started" — the share may still have started, and if it does show up within another 45 seconds you get the "Sharing" hint then. Stopping shows "Sharing stopped". The button also stops a share that is still starting up, not only one that is already live.
  - What gets shared is the window the HUD is currently drawn over, together with the audio of that window's process tree. There is no separate audio choice for this button, and the HUD sends no window information of its own: the desktop app resolves which window to capture on your device, and that resolution is used once and expires after 90 seconds if the share never gets that far.
  - While the HUD panel is open, a share you started this way is marked by a solid red border around the HUD that breathes slowly, a "● Sharing" chip in the status row, and a small button to stop it. If your system asks for reduced motion the border stays steady instead of breathing.
  - The share list in the panel now shows your own share as "Your share" instead of repeating your name.
  - This needs both the desktop app and the server you are connected to on B2.6.45 or later: the half of the feature that actually starts the share is part of the web client each server provides.

- Game HUD: everyday desktop software is left alone by default. The HUD now has a built-in list of just over two hundred programs across ten categories — office suites, browsers, code editors, chat and meeting apps, media players, system tools, design tools, game stores, their fullscreen front-ends, and remote desktop clients — that it does not draw over even when one of them fills the screen. The list is built into the HUD program, is separate from your own "Disabled games" list and does not use up space in it; desktop settings explains this under Disabled games. Borderless-fullscreen games are unaffected.

## Bug Fixes

- A screen share is now marked as starting the moment you ask for one, instead of only after the check for a usable capture source finishes. That check can take a while, and during it the app still considered itself idle, so a second request arriving in that window — one from the HUD's new share button and one from the app, or two presses of either — could get through as well and publish a second share. This fix is part of the web client, so it needs the server updated. (#142)

## Notes

- The HUD program bundled with the desktop app was rebuilt for this release. Its changes are listed above without pull-request numbers because they come from the HUD's own repository.
- The HUD's diagnostic logging was tightened: it records the process identifier and the window's boundaries, and no longer the window title or the executable path. The desktop app's window-audio log no longer records the window identifier either. (#142)
- No Docker image is published for this pre-release. Servers running the Docker image stay on their current version: their users are not asked to accept the 2026-09-24 Privacy Policy yet, and the HUD's "Share this game" button does not work against them until they run B2.6.45 or later.
