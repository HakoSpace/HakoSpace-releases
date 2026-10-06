# HakoSpace B2.6.51

Release date: 2026-10-06 (UTC)

The first stable release since B2.6.39, covering twelve pre-release cycles: the
game HUD for the Windows desktop app, a granular permission system, an AI
assistant with OpenRouter, a model list and a usage log, separate message and
file space for channels, and updates delivered from HakoSpace's own release
source.

## Important: updated Privacy Policy

- The Privacy Policy moves from 2026-06-16 to a new effective date, 2026-09-26. After a server is updated to this version, from the binary or the Docker image, every user of that server is asked to read and accept the updated Privacy Policy the next time they connect, including people who use HakoSpace in a web browser. The EULA is unchanged (2026-07-08).
- What changed in the policy:
  - **Game HUD.** It describes the foreground window information the desktop app reads while the HUD is on (title, process identifier, executable path, window identifier, on-screen position and size, and the display it is on with that display's scaling factor), what it is used for, and that it is processed only on your device. It also covers the list of programs you disable the HUD for, how keyboard input reaches the HUD panel, the HUD's media cache, which is deleted when the voice session ends, and notes that the Microsoft Edge WebView2 Runtime that draws the HUD is an operating-system component whose diagnostic data is governed by Microsoft's privacy statement.
  - **The desktop app as a whole.** It discloses that the app receives keyboard events at the system level to match the global shortcuts and push-to-talk key you configure, without intercepting or changing what other applications receive, and that it may cache received images, avatars and stickers locally.
  - **Updates.** Desktop and server update checks and downloads now go to HakoSpace's own release source, `dl.hakospace.com` (run by HakoSpace on Cloudflare's storage and delivery services), with GitHub as the fallback. A server checks for updates only when an administrator checks for or downloads one in the server settings, and servers running the official Docker image do not use this feature. HakoSpace's web servers and CDN provider temporarily log the public IP address of the device or server that checks for or downloads an update.
  - **Consent screen.** The text has to be scrolled to the end before it can be accepted.

## Features

### Game HUD (Windows desktop app)

- **See who is speaking and read the voice channel's chat on top of your game.** The HUD shows the members who are speaking, with mute, deafen, sharing, join and leave badges, and new messages from the voice channel's text chat, then hides itself completely when there is nothing to show. While it only shows information it is click-through, so your clicks and keystrokes go to the game.
- **It stays off until you accept a one-time notice.** The first time you join a voice channel from the HakoSpace window, desktop settings opens at Game HUD with the "Before you turn on the game HUD" notice; you are asked only once, and "Enable the game HUD" under Game HUD in desktop settings turns it on or off at any time. The HUD starts after you join a voice channel and closes 30 seconds after you leave. It needs the Microsoft Edge WebView2 Runtime, which is built into Windows 11.
- **The HUD panel.** Press the HUD shortcut (Shift + ` by default) in game to type in the voice channel's chat, paste an image (one per message, up to 8 MB), scroll the recent chat, adjust each member's volume, mute your microphone, deafen yourself or leave the channel. You can also watch a screen share in an always-on-top picture-in-picture window (2 by default, up to 4), drag and resize the widgets, and set each widget's background and content opacity from 0% to 100%. Press Esc or the shortcut again to go back to the game.
- **Share this game.** A button in the panel shares the window the HUD is drawn over, together with the audio of that window's process tree, and reports the outcome in game. While the panel is open, a red border and a "● Sharing" chip show that the share is live.
- **Sized for your screen.** The HUD scales with the game window's height: 1080 pixels is the baseline, and taller windows scale it up to 1.8 times. "Overall content size" (Small, Medium or Large) in desktop settings adjusts it further.
- **Where it shows.** It shows over borderless-fullscreen games and any window that fills the screen, but not over smaller windows, true exclusive fullscreen, or games that run as administrator. It also stays off a built-in list of about two hundred everyday programs, such as browsers, office suites and chat apps, even when one fills the screen. "Disable HUD for this game" in the panel adds a game to your own Disabled games list, and privacy mode turns the text area off.
- **Good to know.** When you share your entire screen or record it with other software, whatever the HUD shows is captured too. Games that read the keyboard state directly can still register keys you type in the HUD panel. The HUD needs both the desktop app and the server you connect to on this release, because the data it shows comes from the web client each server provides.

### Permissions

- **Granular permissions.** Twelve permissions, from Administrator to Manage AI, can be granted to user groups or to individual members, so moderation no longer depends on the owner, admin and member roles alone. Existing owners and admins keep exactly the behavior they had before.
- **A Permissions tab in server settings** lists every group and individually granted member with a toggle per permission, and offers a one-click "Moderator" preset. You can grant only permissions you hold yourself.
- **Changes apply immediately.** Granting or revoking a permission, changing a role or changing a group's members takes effect for the affected people without a reconnect, and the server settings sidebar shows only the tabs you can use.
- **The AI assistant follows the same permissions.** Its tools, such as creating channels or banning members, are offered to and run for only the people who hold the matching permission.

### AI assistant

- **OpenRouter is a fourth provider**, next to Anthropic, OpenAI and Google Gemini. When it is selected, "Reasoning effort (OpenRouter)" and "Deny data collection (OpenRouter)" appear in the settings.
- **The Model setting is a list** of the models the selected provider offers, with "Enter manually" for anything that is not listed. Leaving it empty uses the selected provider's default model.
- **A Usage Log** under AI → Usage Log shows who used the assistant, when, with which provider and model, how many tokens it took and whether it answered, with a chart, filters, CSV export and adjustable retention. It replaces the MCP Logs tab. What members send to the assistant is not recorded.

### Channels and messages

- **Message space and file space are separate.** A channel's retention settings are split into message space (message limit and a new "Keep messages for (days)") and file space (uploads, per-file limit, file space and what happens when it is full), so files no longer push a channel's messages out. Automatic removals are now shown at the start of the history and recorded in the audit log.
  - **Behavior change on upgrade:** a channel that already had a storage limit used to remove its oldest messages, files included, when its files went over the limit. Such channels are switched to "Remove the oldest files", which removes only files and keeps their messages.
- **Drag and drop files onto the chat** to attach them, and paste any file type from the clipboard, not only images.
- **Right-click menus across the app.** Right-click opens a consistent context menu in the desktop app, the browser and the installed web app, while text fields and selected text keep the browser's own menu. Long-press opens it on touch devices. Clicking a member opens their profile card, and right-clicking a member, including a tile on the voice stage, opens a menu with a per-member volume slider when you are in the same voice channel.
- **Direct messages** show a total unread badge on the sidebar section and play a notification sound. Admins can upload their own sound in the Notifications settings, and the sound follows the existing mute switch.
- **The forum is fully translated** into English, including dates and relative times.

### Desktop app

- **Keyboard shortcuts work in the background without capturing keys.** Every shortcut works whether or not HakoSpace is focused, and other applications still receive the same keys. The "foreground only / global" switch was removed, and each shortcut shows whether background use is active. A shortcut you had set to "foreground only" now also fires in the background. Background use needs a modifier key: a shortcut on a bare key works only inside the app, and Enter, Tab, Space and the arrow keys can no longer be bound on their own.
- **The desktop app's own screens follow your language.** The server sidebar, dialogs, title bar, tray menu, welcome and error screens, and screen-share options are now in English or Traditional Chinese instead of Traditional Chinese only.

### Updates

- **Updates come from dl.hakospace.com**, HakoSpace's own release source, with GitHub as the automatic fallback. How updates are verified is unchanged. Server administrators who want GitHub only can set `HAKO_UPDATE_MANIFEST_URL=off`.

## Bug Fixes

### Security and data safety

- **Access checks were tightened** so that private channel content stays visible only to the channel's members, and a permission check that hits a database error now fails with an error instead of treating the requester as a regular member. Updating is recommended.
- **The Google Gemini API key is now sent in a request header**, so it can no longer appear in error messages. If your server has used Gemini, we recommend replacing its API key.
- **Bans take effect immediately**, and banned members lose all permissions. Unbanning admins and changing groups linked to terminal access are now owner-only.

### AI assistant

- The daily token limit is now checked before each call, not only after it, and counts failed calls that are still charged.
- When the provider's moderation blocks a message or a reply, the member is told so and can rephrase. Timeouts, empty replies and used-up credits now produce a message instead of silence or a raw error.
- The member's latest message is sent once instead of twice, only messages that were actually saved get an answer, and the assistant is no longer pushed into repeating a tool it already ran.
- Messages the assistant sends go through the same banned-word filter and send lock as everyone else's.
- Switching to a provider whose API key is not saved yet now pauses the assistant until the key is saved, instead of running on the previous provider's connection.

### Voice and screen sharing

- Screen sharing from the Windows desktop app no longer silently fails after a long time in a voice channel; the app renews your sign-in before a share and retries once.
- Two quick share requests can no longer publish two shares at once.

### Messages

- The newest message in a direct message no longer sits against or under the text box. In channels and direct messages, it also stays fully visible when the text box grows.
- A conversation with only a few messages shows them right above the text box.
- Spoilers now hide everything inside them, including links, mentions and emoji, and work with the keyboard.
- An image that can't be loaded shows "Couldn't load this file" instead of an empty box.
- The text chat in a voice channel's panel follows that voice channel's settings.
- Selecting the same file twice no longer uploads it twice.
- DM unread counts no longer include your own messages from another device, and a first message from a stranger no longer leaves an unread that won't clear.

### Other

- The consent screen's full-text reader always shows the version you are being asked to accept.
- The desktop app's connection-failure page no longer comes up blank for a server name with an apostrophe.
- Deleting a user group is all-or-nothing, and converting a public channel to private keeps its original creator as owner.
- The desktop diagnostics log no longer records which key arrived first when background shortcuts start.
- Notification sounds uploaded by admins now also play for people who never join a voice channel.

## Notes

- Most of these changes are part of the server and the web client it provides. The game HUD, the background shortcuts and the desktop app's own screens also need the desktop app updated, so update both.
- Desktop apps and servers on B2.6.39 find this update on GitHub, as before. From this release on, their update checks go to dl.hakospace.com first.
- The Docker image for this release is published as `:latest`, `:B2`, `:2.6.51` and `:B2.6.51`.
- THIRD_PARTY_NOTICES now covers the open-source components of the game HUD.
