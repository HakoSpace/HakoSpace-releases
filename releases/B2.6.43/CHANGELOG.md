# HakoSpace B2.6.43

Release date: 2026-09-21 (UTC)

## Important: updated Privacy Policy

- The Privacy Policy has a new effective date, 2026-09-18. After a server is updated to this version, every user of that server is asked to read and accept the updated Privacy Policy the next time they connect. The EULA is unchanged (2026-07-08). (#134)
- What changed in the policy:
  - It now describes the new game HUD: the foreground window information the desktop app reads while the HUD is on (title, process identifier, executable path, and on-screen position and size), the list of programs you disable it for (kept as executable paths in your local desktop settings), how keyboard input reaches the HUD panel, and the HUD's own media cache, which is deleted when the voice session ends.
  - For the desktop app as a whole, it now discloses that the app receives keyboard events at the system level to match the global shortcuts and push-to-talk key you configure (this does not intercept or change what other applications receive), and that it may cache received images, avatars and stickers locally.
  - It notes that the HUD is drawn by the Microsoft Edge WebView2 Runtime, an operating-system component whose own diagnostic data is governed by Microsoft's privacy statement and the Windows "Diagnostics & feedback" setting, not collected by HakoSpace.
  - It discloses that the desktop app contacts HakoSpace's release source on GitHub when it looks for and downloads updates (automatic checks are on by default and can be turned off in desktop settings; a manual check still connects).
  - It states that the consent screen requires scrolling to the end of the text before it can be accepted.

## Features

- Game HUD (first release; Windows desktop app only). See who is speaking and read the voice channel's text chat on top of your game, and take part in voice chat by typing when you have no microphone. The HUD is off by default: turn on "Enable the game HUD" under Game HUD in desktop settings, and read the one-time notice that explains what it does on your device. It starts only after you join a voice channel and closes 30 seconds after you leave. It requires the Microsoft Edge WebView2 Runtime (built into Windows 11; the settings page tells you if it is missing). (#127, #128, #129, #130, #131, #132, #136, #137, #138)

  - In game, the HUD shows the members who are speaking (with mute, deafen and sharing badges, and join / leave badges) and new chat messages, then hides itself completely when there is nothing to show. While it is only showing information like this, it is click-through: your clicks and keystrokes go to the game. (Opening the HUD panel, below, switches focus to the panel until you go back to the game, and a picture-in-picture window is an ordinary window you can click and drag.)
  - Press the HUD shortcut (default Shift + `) in game to open the HUD panel: type in the message box (Enter sends and keeps the panel open, Shift+Enter starts a new line), scroll the recent chat, adjust each member's volume, mute your own microphone, deafen yourself or leave the channel, watch a screen share in an always-on-top picture-in-picture window (limit 2 by default, up to 4), drag the two widgets, resize the text area from its corner, and set the background and content opacity of each widget anywhere from 0% to 100%. Press Esc or the shortcut again to go back to the game.
  - "Disable HUD for this game" in the panel hides the HUD for that game from then on; manage the list under Disabled games in desktop settings. Privacy mode turns the text area off.
  - The HUD shows over borderless-fullscreen games and over any game window that fills the screen; it does not show over a smaller window. True exclusive fullscreen and games that run as administrator are not supported. When you share your entire screen or record it with other software, whatever the HUD shows is captured too. Games that read the keyboard state directly can also still register the keys you press while you type in the HUD panel.
  - The HUD needs both the desktop app and the server you are connected to on B2.6.43 or later, because the data it shows comes from the web client that each server provides.

## Bug Fixes

- The full-text reader on the consent screen now always loads the version of the EULA or Privacy Policy you are being asked to accept. Previously, after a policy update, a browser or desktop cache could keep showing the earlier text for up to a day. (#135)
- The desktop diagnostics log no longer records which key arrived first when background keyboard shortcuts start up. (#126)

## Notes

- THIRD_PARTY_NOTICES now covers the open-source components of the game HUD. (#132)
- No Docker image is published for this pre-release. Servers running the Docker image stay on the previous version: their users are not asked to re-accept the Privacy Policy yet, and the game HUD will not work against them until they run B2.6.43 or later.
