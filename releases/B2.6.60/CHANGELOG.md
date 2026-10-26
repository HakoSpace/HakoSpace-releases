# HakoSpace B2.6.60

Release date: 2026-10-26 (UTC)

## Features

- Messages the server refused now have **Restore to composer** and **Delete** next to the failure label. Restore puts the text, the attachments already uploaded (they are not uploaded again), the spoiler setting, the reply and the mentions back into the composer and removes the failed message; if the composer already has a draft, the restored text is added after it. If the composer has no room for the attachments, nothing is changed and the reason is shown. Delete only removes the failed message from your screen. Failed messages now also stay when you switch channels and come back, jump to the latest messages or the message list is reloaded, and a message sent while you were reading older messages is no longer lost. They are kept until you reload the page or sign out. (#267)
- Dashboard: a new **Forum Statistics** section shows Total Forum Messages, Total Forum Files and Total Forum File Size. (#231)
- Settings › About: a new **Third-Party Notices** card links to the list of open-source components in HakoSpace with their licenses and copyright notices. (#242)

## Bug Fixes

### Security

- Private channels and channel groups: creating, renaming, changing, reordering or deleting a private channel or channel group, or one inside a private group, is no longer sent in real time to members who cannot see it. Members who lose access now see the channel or group disappear right away, and members who gain access (for example when added to a private channel or group) see it appear without reconnecting. After a reload, the channel list no longer includes channels inside groups the member cannot see, including public groups inside a private group, and the same applies to the channel list the AI assistant reads. Looking up which user groups are linked to a channel or channel group now requires access to it. We recommend updating every server. (#265, #270)
- IO apps: app IDs are now checked everywhere they are used, and an app's files always stay inside the apps folder. Joining an IO channel now requires being able to see the channel, and only members who joined can send to it or use its storage. When an IO app's files are opened directly in the browser instead of inside HakoSpace, they now run in the same sandbox as inside HakoSpace. We recommend updating every server. (#259, #262, #268)
- Link previews are no longer created for links to addresses on the server's own local network (including IPv6 addresses on the same network), or to the server's own public IP address as known from the TURN settings or public IP detection. As a result, links to your own server no longer get a preview. We recommend updating every server. (#254)
- Invite codes created by the AI assistant are now 12 random characters, like invite codes created in Settings, and the Audit Log and the AI Usage Log keep only their first characters. If the AI assistant has created invite codes on your server, we recommend deleting them and creating new ones. (#237)
- Themes: a background image saved by an earlier version is now shown only if it is an image uploaded to this server; otherwise the background is left out and the rest of the theme still applies. (#232)
- Image uploads now share one memory budget for decoding, so many large images uploaded at the same time can no longer make the server use a large amount of memory. When the server is busy, an upload waits briefly and is then stored without a preview instead of failing. (#240)

### Accounts and sign-in

- After a password change, a sign-in from before the change can no longer be used: other tabs and devices are sent to the login page at their next action or reconnect. Before, they could keep using the server until their sign-in expired (up to an hour). (#245, #263)
- A banned member is now signed out at their next action. Before, until their sign-in expired they could still, for example, reply in forums or change their profile. (#244)
- After an account is removed, its unused password reset, password change confirmation and email verification links now show as invalid instead of working. (#233)
- Registration: an email address that is already in use now shows "This email address is already registered.", and a username that is already in use shows "This username is already taken." On a new server, the first account always becomes the owner, also in email mode and when two people register at the same moment. (#233)
- Forgot password: after the reset link is sent, or when the server has no email set up, the page now shows a single "Back to Login" button instead of a button and a link. (#229)

### Messages and direct messages

- A message the server refuses (for example because you cannot post in the channel, or the person you are messaging no longer exists) is now marked as failed instead of showing "sending" forever. (#234)
- A message blocked for a banned word now stays on screen as a failed message marked "(Not sent: it contains a banned word)", with its text and attachments, instead of disappearing together with your draft. (#253)
- Error banners in the composer now follow the language setting. (#234)
- Direct message list: the BOT badge stays after a reload, the preview of the last message no longer goes blank after new messages (including AI bot replies), conversations are sorted by their latest message after a reload, and messages you sent from another device are no longer counted as unread after reconnecting. (#241)
- Spoilers: link preview cards in spoiler messages, or in messages with `||…||` in the text, are now hidden until you click to reveal them. To be safe, any message containing `||` hides its preview card until clicked. (#241)
- The title bar of text channels now shows "#" instead of "@". (#241)

### Voice and screen sharing

- Joining voice: when joining fails, the message now says what went wrong: the browser could not establish the connection, the connection to the server worked but voice did not connect in time, the join did not finish in time, or the server ended the join. While a join is stuck, clicking a voice channel now lets you cancel it or switch to another channel instead of waiting. (#238)
- Screen sharing in the browser and the desktop app's built-in sharing: stopping a share while it is starting no longer leaves you stuck as sharing, or leaves a share that others still see. Starting twice quickly gives a single share, and a share that fails to start is fully cleaned up, including app audio capture on Windows. (#249)
- Native screen sharing (desktop app): your own preview is no longer loaded automatically, which saves about 10 Mbps of download while sharing. Click it to see what viewers actually receive, and use "Stop watching" to close it. (#266)
- After a screen share is stopped and started again, or switches video codec, viewers' requests for a fresh picture now reach the sharer again, so a frozen or blurry picture recovers quickly. (#235)
- A rare voice connection reset no longer removes the member from the voice channel. (#247)

### Server administration

- Audit Log: more admin and moderator actions are now recorded: badges (create, edit, delete, icon, grant, revoke), channel settings (WHIP tokens are never logged), WHIP publishers, channel and group reordering, private channel and group members, forum settings and rate limits, moderator actions on other people's forum posts, note editors, IO apps (upload, delete, reset), turning TURN on or off, telemetry opt-in and data deletion, starting an update download, forum statistics recompute, moderators deleting or pinning other people's messages, and dismissing the announcement. Actions that change nothing are not recorded. (#246, #250, #252, #256, #257, #258)
- Server ownership: with several owners and no `OWNER_USERNAME`, the startup log now shows a warning. When `OWNER_USERNAME` demotes another owner, the Audit Log records it as `change_role` by `boot`. (#233)
- Members with "Manage channels" now see private channel groups they are not in, in the group list, and can see their members; the channels inside stay hidden unless they have access. (#261)
- Dashboard and the Direct Messages tab: DM Statistics now load when you open the tab and update each time you come back to it. While loading, a spinner is shown; if loading fails, both places show "Couldn't load the server statistics." with a Retry button instead of showing "Loading..." forever or nothing at all. (#230)
- Monument: "Uploaded Files" now counts every file of a message with several attachments, not just one. (#246)
- WebSocket Monitor: pausing, resuming or scrolling no longer clears and reloads the list. (#239)
- Terminal: when the server closes the Terminal, it now says why (for example "Terminal closed: your terminal access was withdrawn."). (#239)
- AI assistant: turning the AI on or off now updates the bot's online status for everyone at once, and a reply that is only whitespace is no longer posted. (#237)
- Uploads: large progressive JPEG photos from phones (around 12 megapixels) now get a preview and thumbnail, and a 4608×3456 progressive JPEG avatar gets a thumbnail. (#240)
- Reordering channels or channel groups now applies fully or not at all. (#252)
- Renewing a sign-in now has a generous limit per IP address (600 per minute); going over it only returns an error and never blocks the address. (#243)
- With a manual or self-signed certificate (`TLS_CERT` / `TLS_KEY`), the server now sends `Strict-Transport-Security: max-age=86400` without `includeSubDomains`, so a browser forgets it a day after you stop using HTTPS. With automatic certificates (ACME) it stays at one year with `includeSubDomains`. (#248)

## Notes

- IO apps: an app ID must now be lowercase letters, digits, `-` and `_`, start with a letter or digit, be at most 64 characters, and match the app's folder name. An installed app that does not meet this (for example an ID with capital letters or a dot) is not loaded after updating, and the server log says which one and why. Change the `id` in its manifest and upload it again. The built-in apps are not affected.
- Link previews: links to your own server's domain or public IP address no longer get a preview (see Security).
- Themes: if a theme saved by an earlier version used a background image that is not an upload on this server, upload the image again in the theme editor.
- Telemetry: if you share telemetry, `total_uploads` now counts uploaded files (as the Monument does) instead of messages with files, so the number goes up once after updating.
- Database: the first start adds a column to the users table. Going back to an earlier version still works; it ignores the column.
- Known limit: a 16-megapixel (4608×3456) progressive JPEG attachment is still over the decoding limit and is shown at full size without a preview.
- Upgrading from a version before B2.6.59: the `OWNER_USERNAME` and systemd `Restart=always` notes of B2.6.59 still apply.
- What to update: all changes are in the server and the web client it provides, which the desktop app also shows. The desktop app has no changes of its own in this release. The game HUD program and the native capture engine bundled with the Windows desktop app are the same builds as in B2.6.59.
- Docker: this pre-release is published as `:B2.6.60-pre`, and `:pre` follows it. `:latest` stays on B2.6.51.
