# HakoSpace B2.6.61

Release date: 2026-11-01 (UTC)

## Features

- The built-in Snake.io and Whiteboard apps now have thumbnails (see Notes for servers that already have them installed). (#299)
- IO app settings now show each field's translated name and follow the language setting. A few buttons and titles in screen sharing, the user panel and the update section also follow the language setting now. (#290)
- Microphone mute and unmute now play the **Mic Mute** and **Mic Unmute** sounds. The sounds formerly called Mute and Unmute in Settings are now named **Deafen** and **Undeafen**, which is what they are played for. (#300)

## Bug Fixes

### Security

- Page channels now run in a sandbox, isolated from the rest of HakoSpace. Members-only pages now load their scripts, styles and images, not only the HTML, and links on a page open normally in a new tab. Page authors should read the Page channels note. We recommend updating every server. (#274, #288)
- Voice rooms now follow channel access: members who lose access to a channel (removed from a private channel or group, demoted, or the channel is deleted) leave its voice room right away. We recommend updating every server. (#281, #292)
- Voice, screen sharing, camera and WHIP status in private and grouped voice channels and in direct calls, and the locking and updates of private note channels, are now sent only to members who can see the channel. Members added to a channel see its current voice and sharing status right away. We recommend updating every server. (#287)
- Private channels linked to a user group: the group's members can now read and post in the channel. Before, the channel appeared in their list but showed no content and sent them no updates. Linking, unlinking and changes to the group's members take effect immediately. Linking a page channel to a user group requires the "Manage content" permission. Check your existing links before updating (see Notes). (#291)
- Server settings are now sent according to permissions: members receive only the settings the interface needs, and admin settings go only to members with the matching permission, also in real-time updates and when the AI assistant reads settings. Members whose only admin permission is "Manage server" no longer see the telemetry card on the Overview. We recommend updating every server. (#289)
- AI assistant bash tool: the Confirm mode is removed and Whitelist is now the default. In Whitelist mode each call runs one plain command without a shell, in an empty working directory; chaining, pipes, redirection, `$`, quotes and wildcards are refused, and commands are matched by whole words (listing `ls` allows `ls -la` but not `lsblk`). In all modes, commands get a minimal environment and their output is capped at 8000 bytes. Options of the default commands are restricted. Blacklist mode is now labeled as not a security boundary. See Notes for what changes on your server. We recommend updating every server. (#285, #296)
- WHIP: turning WHIP on now always requires a token, turning WHIP off or regenerating the token ends a stream in progress, and streams are accepted only in voice channels. Token checks were hardened. We recommend updating every server. (#288, #292)
- Server updates started from the admin panel now check the version and pass their parameters safely. We recommend updating every server. (#282, #286)

### Accounts and sign-in

- An open Terminal page now always signs out after a password change or ban, even if its shell exits at the same moment. (#297)
- In some cases, signing out and then reloading the page signed you back in. This no longer happens. (#288)
- Password reset, confirmation and verification pages now show a translated message when the link is invalid or has expired. (#273)

### Messages and direct messages

- Sending a direct message to someone whose account was deleted is now refused, and the message says why: "the other person's account no longer exists." This also applies when the account is deleted while the message is being sent. (#288, #300)
- Punctuation at the end of a link, and `||` right after it, are no longer included in the link or its preview. (#276)

### Voice and screen sharing

- When joining a voice channel is refused, "Failed to join voice channel." now appears right away instead of after about 15 seconds. When you switch or cancel a voice channel, a late reply to an earlier join is no longer mistaken for the current one. Starting a screen share while not in a voice channel no longer leaves a stray LIVE badge. (#279)

### IO apps

- A failed IO app upload no longer breaks the app that was already installed. (#272)
- Uploading, deleting or resetting an IO app now shows what went wrong when it fails, and **Reset All Built-in Apps** reports an error when some apps could not be reset instead of showing success. (#278)

### Server administration

- Announcements, channel and group reordering, WHIP token regeneration and publishers, forum post moderation, and message deletes and pins now fail as a whole if their Audit Log entry cannot be written. Deleting the same forum reply twice lowers the reply count only once, and reordering channels or groups refuses missing or duplicate items. (#293)
- Admin screens now match the server's permission rules. Deleting a user group or changing its members is disabled, with the reason shown, when you cannot manage that group. A page channel's privacy, **Move to Group** and user group links are shown only to members with "Manage content". Admins assigned in a forum's settings can reply to and edit locked posts. A refused action now shows the reason, and hints name the permission involved (for example "Moderate messages") instead of "admin" or "forum admin". (#295)
- Telemetry: when turning telemetry on or off fails, the reason is shown and the setting stays unchanged. The first-time telemetry question stays open after an error and offers **Decide later**. (#278)
- Themes: saving a theme whose keys differ only in letter case (for example `Primary`) no longer fails. (#300)
- Turning TURN on when it is already on no longer shows an error. (#276)
- When a bot is renamed and then goes offline, the member list shows the new name right away. (#276)
- WebSocket Monitor: the `Subs` counter is now labeled `Subs at connect`. (#297)

### Updates and restarts

- Binary servers not run by systemd or Docker: restarting or applying an update from the admin panel no longer loses settings given through environment variables (for example `DATA_DIR`). Settings in `.env` still apply. (#286)
- systemd: when the server runs as a systemd service with `Restart=always`, restarting or applying an update lets systemd start it again. Restarting this way no longer writes a script, so it also works when the server's folder is read-only. If the service has a different `Restart` setting, restarting is now refused with an explanation, as applying an update already was. When the server cannot confirm how systemd runs it, it uses a restart script. (#286, #294)
- Windows single executable: Server Actions › Restart now shows "Restart the server by hand" and does nothing else. After an update is applied, the panel says the update is downloaded and the server must be restarted by hand, also after reloading the page, and checking for updates no longer reports that the server is up to date. (#286, #294)
- After the ports in `.env` are changed, restarting or updating is no longer mistaken for a failure and rolled back. If applying an update fails partway, you can now simply try again. (#294)

## Notes

- **AI assistant bash tool:**
  - Servers that used Confirm, including servers that never changed the setting, now use Whitelist, so some commands that ran before may be refused.
  - Quotes and wildcards are not supported; write values such as times as `--since=-1h`.
  - An empty whitelist now refuses every command instead of falling back to the defaults. Whitelist changes apply without a restart.
  - If your whitelist was still the old default, `cat` and `grep` are removed from it automatically. A whitelist you edited is kept as it is, but any command on it that reads files lets the AI read any file the server account can read, including `.env` and the database; the settings page explains this.
  - Proxy settings are no longer passed to commands, so commands that download (for example `curl`) may fail on a server that needs a proxy.
  - To keep the old permissive behavior, an Administrator can switch to Blacklist, which is not a security boundary.
- **Private channels and user groups:** before updating, check which user groups are linked to private channels, including page channels. After updating, members of those groups can read and post in those channels and view those pages.
- **WHIP:** if a channel has WHIP turned on but no token (this should not happen), streams to it are refused after updating. Regenerate the token.
- **Page channels:** page scripts can no longer use `localStorage`, `sessionStorage`, IndexedDB or cookies, read the parent window, call the HakoSpace API as the viewer, start Web Workers, change the URL path with `history.pushState` (query and hash still work), show `alert` or `confirm` dialogs, start downloads, or embed another page channel. A members-only page that stays open for more than 30 minutes cannot load anything more until it is reopened from the channel. After updating, ask members to reload HakoSpace once.
- **IO app uploads:** an app may now be at most 50 MB uncompressed with at most 200 entries. A ZIP with more than one `manifest.json` at the same level, or with file names that differ only in case, is refused. The manifest's `name` may be at most 100 characters and `version` at most 50.
- **Built-in app thumbnails:** on a server that already has Snake.io or Whiteboard installed, the thumbnail appears after you reset the app in Settings. Resetting discards any custom modifications you made to that app.
- **Custom mute sounds:** if you uploaded a custom sound for the former Mute or Unmute, it now plays for Deafen and Undeafen. Muting the microphone plays the built-in Mic Mute sound unless you upload one under **Mic Mute** and **Mic Unmute**.
- **Terminal:** pasting about 3 MiB or more into the Terminal at once now closes the Terminal connection.
- **Binary servers not run by systemd or Docker:** the update to this version is still carried out by the previous version's restart script. If you set `DATA_DIR`, `PORT` or `TLS_PORT` through environment variables, put them in `data/.env` first, or restart the server by hand this time.
- Database: no changes in this release.
- What to update: almost all changes are in the server and the web client it provides, which the desktop app also shows. The desktop app's only change is how it compares versions when checking for updates, so it will recognize future releases. The game HUD program and the native capture engine bundled with the Windows desktop app are the same builds as in B2.6.60.
- Docker: this pre-release is published as `:B2.6.61-pre`, and `:pre` follows it. `:latest` stays on B2.6.51.
