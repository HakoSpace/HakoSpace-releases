# HakoSpace B2.6.63

Release date: 2026-11-06 (UTC)

This pre-release builds on B2.6.62, which is now the stable release. It adds password reset links that admins can hand over, and fixes email verification, IO app rooms, forum posts, backups and built-in IO app updates. All changes are in the server and the web client it provides.

## Features

- **Password reset links from an admin.** In Settings › Members, a new **Generate password reset link** button (the key icon) appears on the rows of members you can generate a link for. A member with the "Administrator" permission can generate a one-time link for a member and hand it over through another channel; it works whether or not the server has an email service set up. (#324)
  - Admins can generate links for regular members, and the owner can also generate them for admins. Nobody can generate one for the owner, a bot or themselves, and only the owner can generate one for a member with terminal access.
  - A link is valid for 1 hour and works once. Generating another link makes the previous one stop working, and also cancels a password reset email sent earlier. After the password is changed with it, the account is signed out on every device.
  - When the link is used, the server checks again: if by then the admin who generated it no longer has the authority to, or the member is no longer within their reach (for example, they became an admin or got terminal access), the link is refused.
  - The link is shown only once, when it is generated, and is never written to the server log or the Audit Log. The Audit Log records who generated a link for whom.

## Bug Fixes

### Security

- **Email verification without an email service.** When registration is set to Email Verification but the server has no email service set up, registering is now refused with a message saying so, and no account is created. Before, an account was created and the page said a verification email had been sent when none was. **Resend Verification Email** on the login and registration pages no longer claims to have sent one, and Settings › Registration shows that new registrations are refused until you set up Email Proxy or choose another mode. See Notes. We recommend updating every server. (#309)
- **Changing your email address without an email service:** on a server with no email service set up, whatever the registration mode, changing your own email address is now refused, and your address and its verified status stay as they were. Before, the new address was saved as unverified, and the account could not sign in again until it was verified. Clearing the address still works. (#309)
- **The server log no longer contains links with a token** (email verification, password reset and password-change confirmation links). We recommend updating every server. (#309)
- **Email verification links are tied to the address they were sent to.** Once an account's email address changes, a verification link sent to the old address no longer works. With Open or Invite Only registration, an email address included in a registration request is no longer saved; add one in account settings, which sends a verification email (this needs an email service). When password changes need email confirmation and the server cannot read that setting, changing a password is now refused. We recommend updating every server. (#320)
- **IO app rooms follow channel access.** Members who lose access to an IO channel are removed from its room right away and no longer receive or send its content. Before, access was checked only when joining. This covers being removed from the channel, user group changes and unlinking, the channel being made private or moved into a private group, being demoted, the channel being deleted, and losing access while offline. The IO panel then says "You can no longer access this IO channel, so you've left its room. Ask an admin if you need access back." with a **Leave** button. Unlinking a user group from a channel now also removes members who lose access from its voice room. We recommend updating every server. (#310)
- **Forum posts:** several permission issues were fixed. An author can no longer edit a post that a moderator has deleted or locked, and a new post can no longer be based on a message from another channel or a direct message. A post can now be edited only in the post editor (editing it like a regular message is refused); replies can be edited as before. We recommend updating every server. (#321)
- **Link previews** are no longer created for links to the server's own host names: the built-in TURN hostname and the names in `ACME_DOMAIN` and `TLS_DOMAINS` (not case-sensitive; subdomains and parent domains are not affected). IP addresses listed in `TLS_DOMAINS` and the TURN public IPv6 address are not fetched either. In practice, a link to this server's own domain posted in a chat no longer gets a preview card. (#313)

### Channels and permissions

- **After gaining or losing the "Administrator" permission** (by a role change, joining or leaving a user group that has it, or a direct grant or revoke), the sidebar adds or removes the private channels and groups that only administrators can see, without a reload. A private channel you have open when you lose access is closed and another channel is shown. (#322)
- When a channel is taken away (by losing access or being deleted), the text and attachments half-typed in its message box are discarded instead of being sent to the channel shown next, and an open direct message is not closed. Switching channels yourself works as before. (#322)
- Deleting a channel now also removes its user group links, and deleting a user group returns an error when its member list cannot be read, instead of silently skipping notifications. (#322)

### Backups and settings

- Backups made from the admin panel now always contain a consistent snapshot of the database as `hako.db` at the root of the zip, wherever `DB_PATH` points. Before, a backup had no database at all when `DB_PATH` was outside the data folder, and copied the live file when it was not named `hako.db`. (#311)
- Backup files can now be read and written only by their owner (0600), and only one backup runs at a time. The Backup section in the admin panel notes that a backup contains the server's secrets and should be stored securely. (#311)
- The `JWT_EXPIRY_HOURS` setting, which never had any effect, was removed. Servers that set it behave the same after updating. (#311)

### Forum channels

- Pinning, reordering, locking or archiving a post that was just deleted now reports that the post does not exist. Before, when both happened at the same moment, the post could come back or be saved incomplete. (#312)
- Moderator actions change only the fields they are about, so they no longer overwrite a title the author changed, or a reply count that changed, at the same moment. (#312)
- Pinning several posts at the same moment no longer goes over the pin limit. (#321)
- Saving forum settings or post rate limits writes the Audit Log entry together with the settings; if the entry cannot be written, nothing is saved. (#312)

### IO apps

- The built-in IO apps (Snake.io and Whiteboard) are now updated with the server. An app that has not been changed is replaced with the new version automatically. An app that was changed (by editing its files or uploading an app with the same ID) is kept, and when the built-in version is newer, its card in Settings › IO Apps says "A newer built-in version is available. Reset to apply it; this discards any custom changes to this app." See Notes for the first update. (#315)
- **Reset to built-in** and **Reset All Built-in Apps** now take effect only when the whole app is replaced; if replacing fails, the existing app is kept as it was. (#315)

### Server administration

- **TURN Server tab** (Settings › Network): the status now updates by itself. While the tab is open and in the foreground it is read again every 45 seconds, and every 7 seconds while TURN is starting or retrying, the last read failed, or a switch failed and its result has not been confirmed yet (the switch stays locked until then); it stops when the tab is in the background or you leave it. Changes made by another admin, or caused by DDNS, show up without reopening the tab. While the hostname is being resolved, the status shows **Starting…** instead of briefly showing Stopped. (#319)
- TURN: turning TURN off no longer reports a failure when closing its listener returns an error, since TURN has already stopped. When the server reloads the TURN settings and cannot read the database, it now keeps TURN as it is instead of turning it off. (#319)
- The Audit Log API `GET /api/admin/audit-log` accepts `?limit=` (1–500, default 200); the admin panel is unchanged. (#312)

### Voice

- When the server has already removed you from a voice room but your screen still shows you in it, starting a screen share or the camera is refused; the reason is now shown and the local share or camera is stopped. Before, the reason appeared only in the console. (#323)

## Notes

- **Email Verification without an email service:** servers that used Email Verification without setting up email, and verified users with the link written in the server log, can no longer do this after updating. Set up Email Proxy, or choose another registration mode. Accounts that registered this way and are still waiting for verification cannot sign in until they verify, so they need an email service: choosing another mode applies only to new registrations. (#309)
- **Email verification links sent before updating** no longer work. Users can request a new one from the login or registration page. If you update and then go back to an earlier version, this protection goes away with it, and links sent before updating work again until they expire. (#320)
- **Restoring a backup:** stop the server first. Delete the old database and its `-wal`, `-shm` and `-journal` files: by default `hako.db`, `hako.db-wal`, `hako.db-shm` and `hako.db-journal` in the data folder, or the files at `DB_PATH` if you set it. If they are left there, SQLite applies the old WAL to the restored file. Then unzip the backup into the data folder; if you set `DB_PATH`, move `hako.db` from the backup to that path. (#311)
- **Built-in IO apps, first update:** at its first start on this version, the server compares Snake.io and Whiteboard with the copies built into this version. An app that is identical, or is only missing files (such as the thumbnails added in B2.6.61), is completed if needed and from then on updates automatically; you do not need to do anything. An app whose files differ is treated as changed and kept as it is; its card shows the notice only when the built-in version is newer. To have such an app update automatically from now on, press **Reset to built-in** (or **Reset All Built-in Apps**) once; this discards any custom changes to that app. (#315)
- **Database:** the first start adds an index to the messages table, which takes a moment on a server with many messages, and adds two columns to the table of email and password links. (#320, #321, #324)
- What to update: all changes are in the server and the web client it provides, which the desktop app also shows. The desktop app itself has no changes besides its version number. The game HUD program and the native capture engine bundled with the Windows desktop app are the same builds as in B2.6.62.
- Docker: this pre-release is published as `:B2.6.63-pre`, and `:pre` follows it. `:latest` is on B2.6.62.
