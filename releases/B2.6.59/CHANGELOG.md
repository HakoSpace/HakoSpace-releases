# HakoSpace B2.6.59

Release date: 2026-10-23 (UTC)

## Features

- TURN: when the DDNS hostname cannot be resolved as the server starts or as built-in TURN is turned on (for example because the network is not up yet after a reboot), the server now keeps retrying in the background and starts TURN once the name resolves. Before, TURN stayed off until the server was restarted. The same retrying now also takes over when TURN cannot restart on a new DDNS address. (#207, #214)
- TURN Server tab: the status now shows **Retrying** with what the server is doing and the last error, and **Stopped** shows the last error when a start failed. Until the first status arrives it shows "Checking…", and if the status cannot be read it says so and tries again. The switch follows the setting saved on the server. Failed requests are shown under the switch and under the save buttons instead of in a pop-up, and "Run Diagnostic" is available only while TURN is actually running. (#210, #214)

## Bug Fixes

### Security

- Link previews are no longer created for links that point, or redirect, to private, loopback, link-local or other non-public network addresses. Links to such addresses simply get no preview. We recommend updating every server. (#206, #216)
- The server log no longer contains sign-in tokens from requests that hit an internal error, or the values passed to database queries that fail or run slowly. Log files written by earlier versions are not changed. We recommend updating every server. (#206, #208, #209)
- Theme colors, fonts and backgrounds are now saved exactly as the server checked them, and themes saved by earlier versions are read the same way, so what the app shows is always what the server checked. We recommend updating every server. (#225)
- Image uploads now work out how much memory an image needs before decoding it. An image over the limit is stored without a preview or thumbnail instead of being decoded, so a single small file can no longer make the server use a large amount of memory. Such an image is shown at full size in messages, and the original is used as an avatar. Some large progressive JPEG photos (around 12 megapixels and up) are over the limit. (#217)
- In notes, `{font:Name}…{/font}` now applies only valid font names; anything else is shown as typed. (#206)

### Accounts and sign-in

- Changing your password now disconnects every tab and app signed in to the account at once, including ones that were already open, and they go to the login page with the "Your password was changed" message. Setting a new password also cancels any unused password reset link. (#211)
- Banning a member now disconnects their open tabs and apps at once, they cannot reconnect, and their devices can no longer renew their sign-in. Removing (kicking) a member now disconnects them at once too. Banned members can no longer reply to forum posts, or edit or delete their own. (#211, #215)
- An open Terminal or WebSocket Monitor is now closed as soon as its user is banned, removed or changes their password, or loses terminal access or the "Manage system" permission. The Terminal shows `[Terminal access revoked]` when only its access was taken away. (#215)
- After an account is removed, the server settings and the pages linked from channels treat a sign-in from before the removal as signed out. (#212)
- Sign-in: a ban that takes effect while someone is signing in now stops the sign-in and shows the ban reason, and a password change that happens during a sign-in is treated as a wrong password. (#212)
- Staying signed in: a short network outage, a server error, a temporary IP block or a proxy error page while your sign-in is being renewed no longer signs you out; the request fails and is tried again later. When the server is opened over HTTPS, two tabs renewing at the same moment (for example after the computer wakes up) no longer sign each other out. A renewal that arrives after you sign out no longer signs you back in. If the server refuses to renew your sign-in, the app now signs you out instead of trying to reconnect forever. (#228)
- Login page: typing a wrong password after a failed automatic sign-in now shows "Incorrect username or password." instead of reloading the page. If the server does not answer while the app starts, the loading screen now ends after about a minute at most. (#228)
- Registration: if the account changes while it is being created, the page now says "The account changed while it was being created. Try logging in; if that doesn't work, please contact the administrator." Long error messages no longer overlap the button. (#224)
- My Account: the change-password form now resets when you leave the tab, so a half-typed password is not kept in the background. (#224)

### Voice and TURN

- Voice: after a screen share switches video codec, viewers' requests for a fresh picture reach the sharer again, so a frozen picture can recover. If the server fails to send a member an updated connection offer, it now tries again, so a new screen share or camera no longer stays missing for that member until something else changes in the room. (#213)
- Voice channels: the Audio Bitrate setting now says the default is 128 kbps (it said 96), which is the bitrate a channel uses when it was never changed. (#227)
- TURN: when TURN is configured with the `TURN_URL` environment variable, the server now refuses turning built-in TURN on or off, and saving TURN settings no longer starts built-in TURN. Clearing both the public IP and the hostname now stops built-in TURN. Turning TURN on or off now saves the setting first and changes TURN only if the save worked. (#207, #214)

### Images, themes and files

- Photos taken in portrait orientation on a phone now get a correctly rotated preview in messages, so the message list no longer loads the full original. Avatars and banners made from such photos are no longer sideways. Existing avatars are not changed. (#217)
- Theme backgrounds: uploaded background images are now resized to at most 2560 pixels on the long edge and compressed (opaque images are saved as JPEG, images with transparency stay PNG), unless that would not make the file smaller. Animated images are kept as uploaded. Backgrounds uploaded earlier are not changed; the theme editor suggests uploading them again to make them load faster. (#217)
- Themes: most themes look the same as before. In a theme saved by an earlier version, a value the server cannot read is now left out (that color or font goes back to the default, or the background is not shown) while the rest of the theme still applies; settings the app does not use are dropped the next time the theme is saved; and saving a theme that still holds two keys differing only in letter case is refused with "Duplicate color key" or "Duplicate font script". (#225)
- Orphan Files: deleting now checks again, just before deleting, that each file is still unused, and keeps any file that a message, note or other content started using after the scan. If any source cannot be read, nothing is deleted. Files linked with an unusual address (for example with `?…`, `#…` or percent-encoding) are now recognised as in use. (#218)

### Server administration

- Channel groups: when a member with "Manage channels" who is not an administrator makes someone else's channel group private, the group's creator now becomes its owner instead of them, as with channels. If they are not a member of the group, it then disappears from their channel list. Groups created before this version have no recorded creator, so the member making them private still becomes the owner. (#219)
- Server ownership: with `OWNER_USERNAME` set, every start now makes that account the only owner, demoting any other owner to admin. Without it, the earliest registered account is promoted only when the server has no owner at all, so removing the setting after moving ownership no longer gives the server two owners. The server now refuses to start if it cannot read or update the owner account at startup, instead of starting anyway. (#219)
- The permissions list loads faster on servers with many user groups. (#219)
- Dashboard: on a server running in Docker, the Restart button is replaced by "Managed by Docker" and the `docker compose restart` command to run on the host. A failed restart now shows an error. DM and forum file counts and sizes now include every attachment of a message, not only the first. (#221)
- Audit Log: creating and deleting invite codes is now recorded (only the first 6 characters of a new code are logged). (#221)
- WebSocket Monitor: pausing, resuming or scrolling no longer opens extra connections, a closed monitor no longer reconnects by itself, and two monitors opened at the same moment both receive entries. (#223)
- Server: a client that disconnects while its connection is still being set up no longer causes an internal error. A client that falls far behind is now disconnected so it reconnects and catches up, instead of silently missing replies it is waiting for. (#205)
- Legal: on servers behind Cloudflare with Email Address Obfuscation turned on, the EULA and Privacy Policy in the consent dialog now show the contact address `legal@hakospace.com` instead of "[email protected]". (#204)
- With TLS on, opening `http://[IPv6 address]:8080/` now redirects to a valid `https://[…]:8443/` address. With a manual certificate (`TLS_CERT` / `TLS_KEY`), the startup log now says `starting HTTPS server (manual certificate)`. The "broadcast dropped" log line is now written once when a member's connection starts dropping messages, then summarized at most every 10 seconds, instead of once per dropped message. (#216)

### Server updates

- On a binary install run by systemd, applying an update is now refused when the server's unit is not set to `Restart=always`, with an explanation and the command to reload systemd; the server keeps running the current version. Before, the server could stop after the update and not start again. (#227)
- When applying an update is refused for another reason, the panel now shows why and lets you try again, instead of staying on "Updating server...". After a failed verification, the "Open GitHub Release" link no longer disappears when the page is reloaded; it opens the list of releases. (#227)
- If `HAKO_UPDATE_MANIFEST_URL` has a value the server cannot use, the update section now says so: the server then checks for and downloads updates from GitHub only. (#227)

### Desktop app

- Windows: with several servers open in tabs, only the tab that started a native screen share can stop it, so another tab joining and leaving voice no longer ends it. If the sharing tab crashes, reloads or is closed, the share is released. (#222)
- Desktop settings: the keyboard zoom shortcuts are now described as not affected by the Ctrl + mouse wheel option, and the "File Size" row that never showed a value was removed from the Desktop App Update card. Game HUD output is now written to the diagnostic log line by line. (#222)

### AI assistant

- Testing an Anthropic connection with the model field empty now tests the default model instead of failing. When you switch to a provider without an API key, the previous provider's model list is cleared. (#220)
- A message to the AI bot that has only attachments and no text now gets a normal reply; the assistant is told the message had attachments it cannot see. (#220)
- The AI bot's status dot now uses the same colors as everyone else's, so it is grey when the AI is not running. The "Manage AI" permission description now says "the usage log". (#220)

## Notes

- `OWNER_USERNAME`: if your `data/.env` still sets it, every start makes that account the only owner, and any other owner (for example one added by editing the database) becomes an admin. Remove the setting once ownership is where you want it.
- systemd: if you update a binary install from the admin panel, make sure its unit has `Restart=always`, as in the README's example unit; otherwise the panel now refuses to apply the update.
- Legal: browsers and desktop apps that opened the EULA or Privacy Policy in the last 24 hours may keep showing the old text until their cache expires.
- Docker: the `docker-compose.yml` in this repository now explains voice setup. On Linux with Docker Engine, use host networking. On Docker Desktop (Windows, macOS), keep the port mapping; other devices on your network need the page over HTTPS (publish 8443 and set `TLS_CERT` / `TLS_KEY` to a certificate they trust).
- Upgrading from a version before B2.6.57: the theme changes on first start described in the B2.6.57 notes still apply.
- What to update: most changes are in the server and the web client it provides, which the desktop app also shows. The desktop app has changes of its own in this release (native screen sharing with several server tabs, and its diagnostic log), so update it as well. The game HUD program and the native capture engine bundled with the Windows desktop app are the same builds as in B2.6.58.
- Docker: this pre-release is published as `:B2.6.59-pre`, and `:pre` follows it. `:latest` stays on B2.6.51.
