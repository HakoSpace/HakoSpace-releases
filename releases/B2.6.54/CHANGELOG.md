# HakoSpace B2.6.54

Release date: 2026-10-13 (UTC)

## Features

- New admin page, "Make my server public" (Settings, for admins), that prepares a server for the upcoming hakoHub directory. An admin can generate a hub key (shown only once, and it can be regenerated), write a short description, choose whether to show a member-count range and an online-count range, and preview the card that would appear in the directory. The page also shows the registration status once the central service has read the server. (#174, #176)
- A new `/api/hub` address on the server lets the HakoSpace central service read the public card of a server that has registered. It returns the card only to requests signed with that server's hub key, and reports "disabled" until an admin turns publishing on. Setting the environment variable `HAKO_HUB=off` on the host turns it off entirely. (#174)

## Bug Fixes

- Typing with an input method editor (for example Zhuyin or Pinyin) on macOS: pressing Enter to pick a candidate no longer sends the message, saves a settings field or confirms an edit, and pressing Esc during composition no longer closes the dialog or popup you are in. This covers the text chat and DM boxes, the message edit box, the @ mention menu, the search boxes, and the settings fields that save on Enter. (#177)
- Typing the letter "s" in a voice channel's text chat no longer swaps the main and secondary stage views while you have both camera and screen share on, and Ctrl/Cmd+S no longer swaps them either. In the sticker and sound pickers, typing "/" in the message box while a picker is open now types the character instead of jumping to the picker's search box. (#178)
- Windows tray icon: the tray now loads a multi-size icon file, so it is drawn at the exact size for each display-scaling setting from 100% to 300% instead of being resized from one image. The installed app icon and shortcuts use the same file. (#171)

## Notes

- hakoHub: the directory is not open yet. Until its terms are published, only HakoSpace internal accounts can register a server at auth.hakospace.com, and the page's link to the hakoHub Listing Policy does not lead to a published policy yet. This server never connects to HakoSpace on its own: nothing is sent anywhere until an admin registers the server, and registering is done on the HakoSpace site, not from this page.
- The new admin page and the `/api/hub` address are part of the server, so they take effect once the server is updated. The input method and stage-key fixes are in the web client the server provides. The desktop app's only change is the Windows tray icon; the game HUD program and the native capture engine it bundles are the same builds as in B2.6.53.
- The Privacy Policy and the EULA are unchanged in this release (still effective 2026-09-26 and 2026-07-08), so no new acceptance is required.
- Docker: this pre-release is published as `:B2.6.54-pre`, and `:pre` follows it. `:latest` stays on B2.6.51. The sample `docker-compose.yml` in this repository now has a comment on the image line about the `:pre` option.
