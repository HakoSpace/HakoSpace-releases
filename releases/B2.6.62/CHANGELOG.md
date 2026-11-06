# HakoSpace B2.6.62

Release date: 2026-11-06 (UTC)

The first stable release since B2.6.51, covering eleven pre-release cycles. Most
of it is security work: private channels, voice rooms, IO apps, page channels and
server settings now reach only the members allowed to see them. It also brings
personal and server themes with a new Themes tab, encrypted sign-in storage in
the desktop app, password changes and bans that take effect everywhere at once,
failed messages you can restore, the "Make my server public" page for the
upcoming hakoHub directory, and a new HakoSpace logo.

We recommend updating every server. Read "Before you update" first: several
changes affect who can see what.

## Important: updated EULA and Privacy Policy

- The EULA (from 2026-07-08) and the Privacy Policy (from 2026-09-26) both move to a new effective date, 2026-10-16. Both are material changes, so after a server is updated to this version, from the binary or the Docker image, every user of that server is asked to read and accept them again the next time they connect, including people who use HakoSpace in a web browser. Server administrators may want to let their users know before updating.
- The main change is hakoHub, an optional public server directory that is off by default and can only be turned on by a server administrator. The documents also describe the software's current behavior in more detail.
- Read them: [EULA](https://hakospace.com/legal/archive/2026-10-16/eula/) · [Privacy Policy](https://hakospace.com/legal/archive/2026-10-16/privacy/)
- From this release on, the server tracks two versions of each document: the current text and the version that last required acceptance. A future editorial revision (a typo or wording fix that does not change the meaning) can then take effect without asking everyone to accept again, while a substantive change still asks everyone.

## Before you update

### Who can see what

- **Private channels linked to a user group:** members of the linked user group can now read and post in the channel and view page channels. Before, the channel appeared in their list but showed no content. Check which user groups are linked to private channels, including page channels, before updating.
- **Assigned Groups on private channel groups now take effect:** members of a user group assigned under **Assigned Groups** see the channel group and the channels in it that are not private, including page channels, right away. Before, assigning had no effect. Check your assignments before updating. Making a group public removes its individual members but keeps its assigned user groups; they are hidden in Settings while the group is public and apply again if the group is made private.
- **"Manage content" for page channels:** linking a page channel to a user group, changing a page channel's privacy or moving it into or out of a group, and, for a channel group that holds page channels, making it public or private, changing its parent group, deleting it, adding members to it or assigning a user group to it now also need the "Manage content" permission. So do adding or removing members of a user group assigned to such a group, deleting that user group and changing what it grants. This includes group owners and members with "Manage channels". Removing members and unassigning user groups do not need it. Existing memberships and links are kept.

### Server behavior

- **Themes are sorted out on first start.** Themes are now personal or server themes (see Features). The first time the server starts this version, a personal theme used as the server's default or by a channel becomes a server theme, so what everyone sees does not change. Members and channels set to someone else's personal theme go back to following the server's theme, personal themes whose author no longer exists are deleted, and custom fonts become server fonts. The server logs one `[themes] ownership migration: …` line when it has themes or fonts to change. A theme background that is not an image uploaded to this server is no longer shown; upload it again in the theme editor.
- **AI assistant bash tool:** the Confirm mode is removed. Servers that used Confirm, including servers that never changed the setting, now use Whitelist, so some commands that ran before may be refused. In Whitelist mode each call runs one plain command without a shell: chaining, pipes, redirection, `$`, quotes and wildcards are refused (write values such as times as `--since=-1h`), and an empty whitelist refuses every command. If your whitelist was still the old default, `cat` and `grep` are removed from it; an edited whitelist is kept, but any command on it that reads files lets the AI read any file the server account can read, including `.env` and the database. Proxy settings are no longer passed to commands. To keep the old permissive behavior, an Administrator can switch to Blacklist, which is not a security boundary.
- **`OWNER_USERNAME`:** if it is set (in `data/.env` or the environment), every start now makes that account the only owner and demotes any other owner to admin (recorded in the Audit Log). Without it, the earliest registered account is promoted only when the server has no owner at all. Remove the setting once ownership is where you want it.
- **IO apps:** an app ID must be lowercase letters, digits, `-` and `_`, start with a letter or digit, be at most 64 characters, and match the app's folder name. An installed app that does not meet this is not loaded after updating, and the server log says which one and why; change the `id` in its manifest and upload it again. An app may be at most 50 MB uncompressed with at most 200 entries. The built-in apps are not affected; on a server that already has Snake.io or Whiteboard installed, their new thumbnails appear after you reset the app in Settings, which discards any custom modifications to it.
- **Page channels** now run in a sandbox. Page scripts can no longer use `localStorage`, `sessionStorage`, IndexedDB or cookies, read the parent window, call the HakoSpace API as the viewer, start Web Workers, change the URL path with `history.pushState` (query and hash still work), show `alert` or `confirm` dialogs, start downloads, or embed another page channel. A members-only page that stays open for more than 30 minutes cannot load anything more until it is reopened from the channel. After updating, ask members to reload HakoSpace once.
- **WHIP:** turning WHIP on now always requires a token. If a channel has WHIP on but no token (this should not happen), streams to it are refused after updating; regenerate the token.
- **Link previews:** links to addresses on your server's own network, or to its own public IP address, no longer get a preview card.
- **Passwords:** changing your password, confirming a password change by email or resetting a forgotten password now signs out every device and tab signed in to the account.
- **Custom mute sounds:** a custom sound uploaded for the former Mute or Unmute now plays for Deafen and Undeafen. Muting the microphone plays the built-in Mic Mute sound unless you upload one under **Mic Mute** and **Mic Unmute**.
- **Telemetry:** if you share telemetry, `total_uploads` now counts uploaded files instead of messages with files, so the number goes up once after updating.

### Updating from the admin panel

- **systemd:** before you apply this update from the admin panel, make sure the unit has `Restart=always`, as in the README's example unit, and reload systemd if you change it. The update to this version is still applied by B2.6.51, which does not check this: with any other `Restart` setting the server stops after the update and does not start again, so you would have to start it by hand. From this version on, applying an update or restarting from the panel with a different setting is refused with an explanation, and the server keeps running.
- **Binary servers not run by systemd or Docker:** the update to this version is still carried out by B2.6.51's restart script. If you set `DATA_DIR`, `PORT` or `TLS_PORT` through environment variables, put them in `data/.env` first, or restart the server by hand this time. Likewise, if you changed `PORT` or `TLS_PORT` in `data/.env` since the server started, restart it once before applying the update. From this version on, a restart or update from the panel keeps settings given through environment variables.
- **Windows single executable:** B2.6.51 cannot restart itself on Windows. After you apply this update, stop the server and start it again by hand to run B2.6.62; until then the panel may keep showing "Updating server..." and the previous version keeps running. From this version on, Server Actions › Restart shows "Restart the server by hand", and after an update is applied the panel says the server must be restarted by hand.

### Docker

- This release is tagged `:B2.6.62` and `:latest`. `:B2` is no longer updated and no `:2.6.x` tags are published any more, so a server that follows `:B2` stays on B2.6.51; switch it to `:latest`. Preview releases are published as `:pre`.
- The `docker-compose.yml` in this repository now explains voice setup. On Linux with Docker Engine, use host networking. On Docker Desktop (Windows, macOS), keep the port mapping; other devices on your network need the page over HTTPS (publish 8443 and set `TLS_CERT` / `TLS_KEY` to a certificate they trust).

## Features

### Themes

- **Personal and server themes.** A theme you create or copy under Appearance in your own settings is personal: only you can see and apply it. Server themes are available to everyone and are the only ones that can be a server default or a channel theme. Built-in themes can now be copied too, and deleting a theme or font asks in an in-app dialog.
- **A Themes tab in server settings** for members with "Manage expressions":
  - **Server Themes:** create, edit and delete server themes, see where each is used (server default, number of channels and members), and see how many will go back to the server's theme before you delete one.
  - **Members' Themes:** lists the members who have personal themes, with their count and background size, and marks members over the limit. Adopt a member's theme as a server theme (a copy is made), delete one, or delete all of a member's personal themes; the member is notified.
  - **Fonts:** custom font upload and deletion moved here. Every custom font is a server font, and the font family is made from the font name with disallowed symbols removed.
  - **Settings:** "Let members create personal themes" (on by default), "Personal themes per member" (1 to 100, default 10) and "Theme background size limit (KB)" (default 5120).
- The server **Appearance** tab now holds only the server default theme. Under Appearance in your own settings, themes are grouped into Built-in, Server Themes and My Themes, with your count and the limit.
- **Faster theme backgrounds.** Uploaded backgrounds are resized to at most 2560 pixels on the long edge and compressed unless that would not make the file smaller; animated images are kept as uploaded. On a slow connection, the background no longer fills in from top to bottom: the loading screen waits up to 2.5 seconds for it, and switching themes keeps the current background until the new one is ready. Backgrounds uploaded before this version are not changed; upload them again to get the smaller file.

### Accounts and sign-in

- **Password changes and bans take effect everywhere at once.** Changing your password disconnects every tab and app signed in to the account, including ones already open, and they go to the login page with the "Your password was changed" message. Banning a member disconnects them at once, they cannot reconnect, and their devices can no longer renew their sign-in; removing (kicking) a member disconnects them too.
- **Clearer sign-in errors.** A failed sign-in says what went wrong: an incorrect username or password, too many attempts, or an IP address blocked by the server. Messages about a suspended account or an unverified email appear only after the correct password is entered, so write suspension reasons that are fine for that member to read.
- **Staying signed in is more reliable.** A short network outage, a server error, a temporary IP block or a proxy error page while your sign-in is renewed no longer signs you out; when the server is opened over HTTPS, two tabs renewing at the same moment no longer sign each other out; and a renewal that arrives after you sign out no longer signs you back in.

### Messages

- **Restore a failed message.** A message the server refuses is marked as failed instead of showing "sending" forever, with **Restore to composer** and **Delete** next to it. Restore puts the text, the uploaded attachments, the spoiler setting, the reply and the mentions back into the composer. Failed messages stay when you switch channels and come back, until you reload the page or sign out. A message blocked for a banned word stays on screen as "(Not sent: it contains a banned word)" instead of disappearing together with your draft.

### Voice

- **Mic Mute and Mic Unmute sounds.** Microphone mute and unmute now play their own sounds. The sounds formerly called Mute and Unmute are now named **Deafen** and **Undeafen**, which is what they are played for.
- **Clearer voice joins.** When joining fails, the message says why: the browser could not connect, voice did not connect in time, the join did not finish in time, or the server ended it. A refused join is reported right away, and while a join is stuck you can cancel it or switch to another channel.
- **Native screen sharing (Windows desktop app) saves bandwidth:** your own preview is no longer loaded automatically, which saves about 10 Mbps of download while sharing. Click it to see what viewers receive.

### Desktop app

- **Encrypted sign-in storage.** Sign-in tokens are stored encrypted with the storage your operating system provides, in a separate file from your server list. Tokens saved by earlier versions are moved the first time you open each server, so you stay signed in. If your system cannot provide encrypted storage (for example some Linux setups without a keyring), the app keeps you signed in only until it quits; it never falls back to saving tokens unencrypted. Removing a server, or changing its address, clears its saved sign-in.
- **New HakoSpace logo** on the installer, shortcuts, taskbar and tray, the sign-in pages, the browser tab icon (on servers without their own icon) and the home-screen icons. The Windows tray icon is drawn at the exact size for each display-scaling setting from 100% to 300%. On machines that already have the app, Windows may keep showing the old icon until it refreshes its icon cache.

### Server administration

- **Make my server public** (Settings, for members with "Manage system") prepares a server for hakoHub, the upcoming public server directory: generate a hub key, write a short description, choose whether to show member-count and online-count ranges, and preview the directory card. A new `/api/hub` address returns the card only to requests signed with that server's hub key, and only after an admin turns publishing on; setting `HAKO_HUB=off` on the host turns it off entirely. The server never connects to HakoSpace on its own for hakoHub. hakoHub is not open to the public yet: registering a server is currently limited to invited Official Accounts. The hakoHub Listing Policy is published at hakospace.com/legal.
- **TURN keeps trying.** When the DDNS hostname cannot be resolved as the server starts or as built-in TURN is turned on (for example right after a reboot), the server retries in the background and starts TURN once the name resolves, instead of staying off until a restart. The TURN Server tab shows **Retrying** with what the server is doing and the last error, and **Stopped** with the error of a failed start.
- **Dashboard:** a new **Forum Statistics** section. On a server running in Docker, the Restart button is replaced by "Managed by Docker" and the `docker compose restart` command to run on the host.
- **Audit Log** records many more admin and moderator actions: badges, channel settings (WHIP tokens are never logged), WHIP publishers, reordering, private channel and group members, forum settings and moderation, note editors, IO apps, TURN, telemetry, update downloads, invite codes (only their first characters) and moderators deleting or pinning other people's messages. Actions that change nothing are not recorded. Announcements, reordering, WHIP token regeneration and WHIP publishers, forum moderation, and message deletes and pins fail as a whole if their Audit Log entry cannot be written.
- **Settings › About** has a **Third-Party Notices** card. The Docker image now includes `LICENSE` and `THIRD_PARTY_NOTICES` in `/usr/share/doc/hakospace/`, and the desktop app ships `LICENSE` next to `THIRD_PARTY_NOTICES`.

### IO apps

- The built-in Snake.io and Whiteboard apps have thumbnails, and IO app settings show each field's translated name and follow the language setting.

## Bug Fixes

### Security

- **Private channels and channel groups:** creating, renaming, changing, reordering or deleting a private channel or group is no longer sent in real time to members who cannot see it, and the channel list, including what the AI assistant reads, no longer includes channels inside groups a member cannot see. Members who lose access (for example when removed from a private channel or group) see the channel disappear right away; members who gain access see it appear without reconnecting.
- **Voice rooms follow channel access:** members who lose access to a channel leave its voice room right away. Voice, screen sharing, camera and WHIP status in private and grouped voice channels and in direct calls, and private note channels, are sent only to members who can see the channel.
- **Before you sign in, a server sends only what its sign-in and registration pages need.** Server settings are sent according to permissions: members receive only what the interface needs, and admin settings go only to members with the matching permission. Secret settings such as AI API keys and the email (SMTP) password are always shown as `********`. If your server sends email, we recommend replacing the password or API key it sends with: create a new one with your email provider, enter it under Email Proxy → Password / API Key, then remove the old one at the provider.
- **IO apps:** app IDs are checked everywhere and an app's files stay inside the apps folder. Joining an IO channel requires being able to see it, only members who joined can send to it or use its storage, and an app's files opened directly in the browser run in the same sandbox as inside HakoSpace.
- **Uploaded files:** fields that store an uploaded file (avatars, banners, stickers, sounds, theme backgrounds, badge icons) accept only a file you uploaded yourself for that purpose. When a server runs behind a CDN such as Cloudflare, a deleted file stops being served from the CDN's cache within minutes.
- **Themes and fonts:** themes are saved and read exactly as the server checked them, a member can no longer apply another member's personal theme, custom font names can no longer change the app's styling, and `{font:Name}` in notes applies only valid font names.
- **Accounts:** after an account is deleted, its devices can no longer renew their sign-in and its unused reset, confirmation and verification links are invalid. Setting a new password cancels password-change confirmation links still waiting in email and unused reset links.
- **Server log:** it no longer contains sign-in tokens from requests that hit an internal error, or the values passed to database queries that fail or run slowly. Log files written by earlier versions are not changed.
- **Image uploads** work out how much memory an image needs before decoding it and share one decoding budget, so one file, or many at once, can no longer make the server use a large amount of memory. An image over the limit is stored without a preview.
- **Invite codes created by the AI assistant** are now 12 random characters, like those created in Settings. If the assistant has created invite codes on your server, we recommend deleting them and creating new ones.
- **WHIP** token checks were hardened, and turning WHIP off or regenerating the token ends a stream in progress. Streams are accepted only in voice channels.
- **Server updates** started from the admin panel check the version and pass their parameters safely.
- **Page channels** run in a sandbox, isolated from the rest of HakoSpace. Members-only pages now load their scripts, styles and images, not only the HTML, and links on a page open normally in a new tab. Changes that affect who can see a page channel need "Manage content" (see "Before you update").
- **Link previews** are no longer created for links that point, or redirect, to private, loopback, link-local or other non-public addresses, to addresses on the server's own network, or to the server's own public IP address.

### Accounts and sign-in

- Registration says "This email address is already registered." or "This username is already taken.", and on a new server the first account always becomes the owner.
- An open Terminal or WebSocket Monitor closes as soon as its user is banned, removed or changes their password, or loses the access it needs.
- Signing out and then reloading the page no longer signs you back in. Password reset, confirmation and verification pages show a translated message when a link is invalid or has expired.
- If the server does not answer while the app starts, the loading screen ends after about a minute at most, and opening the app no longer sends you to the login page when only the cached copy of your profile is missing.
- When a profile or server settings change is rejected, your current avatar, banner or other image is no longer deleted.

### Messages and direct messages

- Typing with an input method editor (for example Zhuyin or Pinyin) on macOS: pressing Enter to pick a candidate no longer sends the message or confirms a field, and Esc during composition no longer closes the dialog you are in.
- Sending a direct message to someone whose account was deleted is refused with the reason.
- Direct message list: the BOT badge stays after a reload, the last-message preview no longer goes blank, conversations are sorted by their latest message, and messages you sent from another device are no longer counted as unread.
- Link preview cards in spoiler messages are hidden until you reveal them. Punctuation at the end of a link is no longer part of the link or its preview.
- Photos taken in portrait orientation on a phone get a correctly rotated preview, and avatars and banners made from them are no longer sideways.
- A refused upload shows "Upload failed" instead of `[object Object]`, there is space between the last message and the message box, and the title bar of text channels shows "#".
- Typing "s" in a voice channel's text chat no longer swaps the stage views.

### Forum channels

- Opening a post shows the post and its replies, and editing a post opens a full-height editor.
- Entering a forum always opens its post list, with the filter reset to "All". The post list no longer mixes in posts from the previous filter, and scrolling to the bottom loads more posts again.
- New post drafts keep what you typed, and a published post is no longer restored as a draft.

### Voice and screen sharing

- After a screen share restarts or switches video codec, viewers' requests for a fresh picture reach the sharer again, so a frozen picture recovers.
- Stopping a share while it is starting no longer leaves you stuck as sharing; starting twice quickly gives a single share; a share that fails to start is fully cleaned up.
- A rare voice connection reset no longer removes the member from the voice channel.
- Windows desktop app: with several servers open in tabs, only the tab that started a native screen share can stop it.
- The Audio Bitrate setting now says the default is 128 kbps.

### Server administration

- Admin screens match the server's permission rules: controls you cannot use are disabled with the reason, and hints name the permission involved.
- Channel groups: when a member with "Manage channels" who is not an administrator makes someone else's group private, the group's creator becomes its owner if they still have "Manage channels". Groups created before this version have no recorded creator, so the member making them private still becomes the owner. Members with "Manage channels" see private channel groups they are not in, and their members; the channels inside stay hidden unless they have access.
- Reordering channels or groups applies fully or not at all.
- Orphan Files checks again just before deleting that each file is still unused, and deletes nothing if any source cannot be read.
- DM Statistics load when you open the tab, with a Retry button if loading fails, and file counts include every attachment of a message.
- IO apps: a failed upload no longer breaks the installed app, uploads, deletions and resets say what went wrong, and **Reset All Built-in Apps** reports apps it could not reset.
- TURN: with `TURN_URL` set, built-in TURN cannot be turned on or off, saving TURN settings no longer starts it, and turning it on when it is already on no longer shows an error.
- Telemetry: a failed change shows the reason and leaves the setting unchanged.
- Saving the email settings again without retyping the password no longer replaces an SMTP password of 8 characters or fewer.
- With a manual or self-signed certificate (`TLS_CERT` / `TLS_KEY`), the server sends `Strict-Transport-Security: max-age=86400` without `includeSubDomains`. With TLS on, `http://[IPv6 address]:8080/` redirects to a valid HTTPS address.
- On servers behind Cloudflare with Email Address Obfuscation, the consent dialog shows `legal@hakospace.com` instead of "[email protected]".

### Updates and restarts

- When applying an update is refused, the panel shows why and lets you try again instead of staying on "Updating server...".
- After the ports in `.env` are changed, restarting or updating is no longer mistaken for a failure and rolled back, and an update that fails partway can simply be tried again.
- If `HAKO_UPDATE_MANIFEST_URL` has a value the server cannot use, the update section says so; the server then uses GitHub only.

### Desktop app

- Add / Edit Server window: Enter activates only the focused button, Enter during a connection test no longer adds the server, and Enter and Esc wait for the input method to finish composing.
- Share Screen window: Enter on "Cancel" no longer starts sharing.
- The desktop app compares versions so that it will recognize future releases.

### AI assistant

- Testing an Anthropic connection with the model field empty tests the default model, and a message with only attachments gets a normal reply.
- Turning the AI on or off updates the bot's status for everyone at once, its status dot is grey when it is not running, and a reply that is only whitespace is no longer posted.

## Notes

- What to update: most changes are in the server and the web client it provides, which the desktop app also shows. Encrypted sign-in storage, the new icons, the Add / Edit Server and Share Screen fixes and native screen sharing with several tabs need the desktop app updated, so update both.
- Desktop apps and servers on B2.6.51 find this update at dl.hakospace.com, with GitHub as the fallback.
- Desktop sign-in tokens from earlier versions: older copies can stay in the app's storage files on disk until those files are rewritten. The old refresh token stops being accepted the first time the app refreshes that sign-in.
- A device that is not connected when a password is changed is signed out at its next action or reconnect.
- Database: the first start adds new tables and columns and sorts out themes as described above. We recommend backing up the server's data folder before updating.
- Terminal: pasting about 3 MiB or more into the Terminal at once closes the Terminal connection.
- Known limit: a 16-megapixel (4608×3456) progressive JPEG attachment is over the decoding limit and is shown at full size without a preview.
- Browsers and desktop apps that opened the EULA or Privacy Policy in the last 24 hours may keep showing the old text until their cache expires.
- The game HUD program and the native capture engine bundled with the Windows desktop app are the same builds as in B2.6.51.
