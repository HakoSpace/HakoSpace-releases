# HakoSpace B2.6.51

Release date: 2026-10-06 (UTC)

## Features

- Game HUD: the Windows desktop app now offers the HUD the first time you join a voice channel. If you have never turned the HUD on, joining a voice channel from the HakoSpace window opens desktop settings at Game HUD with the "Before you turn on the game HUD" notice. The notice now starts with "You just joined a voice channel. Want to turn on the game HUD now? You can switch it on or off on this page at any time." (#163)

  - "I understand — turn on the HUD" turns the HUD on and takes you back to the server you were on. "Cancel" or Esc leaves it off and also takes you back. You are asked only once, whatever you choose; after that, use "Enable the game HUD" under Game HUD in desktop settings.
  - You are asked only while the HakoSpace window is in the foreground, not minimized and not in fullscreen. If you join voice while you are in a game, for example with a shortcut, the notice does not come up, and the question is kept for a later join.
  - People who already turned the HUD on are not asked. People who never turned it on are asked once after updating.
  - The HUD still stays off until you accept the notice, and the notice's own text is unchanged.

- Desktop app: its own screens now follow your language. The server sidebar and its right-click menu, the add and edit server dialogs, the title bar, the tray menu, the welcome, connecting and connection-failure screens, the error pages, the startup-failure dialog, and the screen-share options and source picker used to be in Traditional Chinese only. They now use English or Traditional Chinese, following the language you use in HakoSpace, and are in English until a server has reported your language. Most of them switch as soon as you change the language; a few one-time screens use the new language the next time they appear. (#162)

  - The welcome screen shows the HakoSpace logo instead of a large "A".
  - In desktop settings the title bar reads "HakoSpace — Desktop App Settings", in the same language as the rest.
  - The title bar's minimize, maximize and close tooltips now have Chinese text too.
  - The screen-share options window is taller, so everything fits in both languages.

## Bug Fixes

- Desktop app: the page shown when a server can't be reached no longer comes up blank when the server's name contains an apostrophe, such as "Kim's Server". Server names on that page are now always shown as plain text. (#162)
- Game HUD: the first time you open the HUD panel, a Windows title bar and frame no longer appear around the HUD. The frame could stay until the panel had been opened a second time. B2.6.49 listed a fix for a title bar flash, but this frame could still appear after it.
- Four messages now match what the app does (#162):
  - Deleting a sound pack now warns only that "{count} sounds will be permanently deleted." The extra line about broken references was wrong.
  - The AI usage log's custom range message now says the start may be on or before the end; a one-day range was always allowed.
  - The TURN setting now tells you to remove `TURN_URL`, not disable it, to use the built-in TURN server.
  - The forum settings hint no longer shows the internal name `forum_admin`, in English or in Chinese.

## Notes

- The HUD question and the desktop app's own screens are part of the desktop app, so updating the desktop app is enough for them. The four corrected messages are part of the web client each server provides, so they appear once the server is updated.
- The game HUD program bundled with the Windows desktop app was rebuilt for this release. Its fix comes from its own repository, so it has no pull-request number here. The native capture engine is the same build as in B2.6.48.
- The Privacy Policy and the EULA are unchanged in this release (still effective 2026-09-26 and 2026-07-08), so no new acceptance is required.
- No Docker image is published for this pre-release. The stable release B2.6.51 is built from the same code and comes with the Docker image.
