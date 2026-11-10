# HakoSpace B2.6.64

Release date: 2026-11-10 (UTC)

This pre-release builds on B2.6.63; B2.6.62 is still the stable release. A new server now asks for a one-time setup code before its first account (the owner) can be created, and the password rules change. It also has many security fixes around password reset and email links, sign-in limits and permission checks, and fixes for forum posts, replies and voice. The server is now built with Go 1.27.3. All changes are in the server and the web client it provides. Read **Before you update** first.

## Before you update

- **New servers need a setup code to create the owner account.** When a server that has no owner yet starts, it prints a one-time setup code in its log, and the registration page asks for it before the first account (the owner) can be created. With Docker, find it with `docker logs <container name>`; with the server binary, it is in the terminal output and in `data/hako.log`. The code stops working once the owner exists; until then, every restart prints a new one. Copy the code carefully: wrong codes count toward the server's limit on registration attempts from one address, and going over it blocks that address. Servers that already have an owner are not affected. (#347)
- **New password rules.** Passwords now need at least 8 and at most 128 characters, in any combination (letters and numbers are no longer required), and the most commonly used passwords are refused. This applies when registering, changing a password and resetting one. Passwords that are already set keep working, and nobody has to change theirs. (#347)
- **Email settings: some fields now need the "Administrator" permission.** The fields that decide how and where the server's emails are sent (the provider, SMTP host, port, user and password, the sender address, and the Base URL) can now be changed only by members with "Administrator". Members with only "Manage security" can still change the sender name and send test emails. If you relied on "Manage security" to manage email, ask an administrator to change these fields after updating. (#335)
- **Changing or removing your email address now needs your current password.** (#335)
- **Email links now carry their code after `#`.** Password reset, email verification and password-change confirmation links (in emails, and the ones an admin generates) now keep their code after `#`, so it is never sent to the server in the address. Links sent before updating keep working. If your email provider has click tracking turned on and drops the part after `#` when redirecting, recipients see a message that the link code is missing; turn click tracking off for these emails. (#337)

## Bug Fixes

### Security

We recommend updating every server.

- **Password reset emails go only to a verified address.** On an account whose email address is not verified yet, **Forgot password?** now shows the same message as for an account with no email ("This account has no verified email. Please contact the administrator to reset your password."); an admin can use **Generate password reset link** instead. (#328)
- **Links stop working when the email address changes.** Changing or clearing an account's email address makes its unused password reset, email verification and password-change confirmation links stop working, including links an admin generated. (#328)
- **Admin-generated reset links stop working** once the admin who generated them changes their own password or has it reset; generate a new one. (#328)
- **The reset, verification and confirmation pages** remove the link code from the address bar once they have read it, and no longer send it in the `Referer` header. Reloading such a page explains that you need to click the link in the email again. (#335)
- **Generate password reset link** now builds the link from the address you have the admin panel open at. (#335)
- **The Audit Log records when a password reset link that an admin generated is used** (`use_password_reset_link`), including when it is refused because it expired or the admin can no longer issue it. (#335)
- **Too many wrong current passwords.** When changing your password or changing or removing your email, 5 wrong current passwords within 15 minutes in the same sign-in pause these changes for up to about 15 minutes ("Too many incorrect current-password attempts, so changing your password or email is paused…"). Other sign-ins and other actions are not affected; you stay signed in and the account is not locked. (#337)
- **Password checks under heavy load.** The server now limits how many password checks run at the same time, so many sign-in or registration requests at once no longer use up its memory. A request that cannot be handled right away shows "The server is busy checking passwords right now, so your request wasn't processed and nothing was changed. Wait a few seconds, then try again." (#339)
- **Invite codes** can no longer be used more times than their limit, and a registration that fails (for example, because the username is taken) no longer uses up a use of the code. (#339)
- The email verification, password-change confirmation and password reset pages show success only when the server confirms it. (#339)
- **Permission and account checks after the request arrives.** Writes that need a permission, and writes by signed-in members (messages, uploads, notes, forum posts, channels, personal settings and more), now check the permission and the account again after the whole request has been received. If the permission was removed, or the account was banned, deleted or signed out by a password change in the meantime, nothing is written. (#340, #342)
- **Granting and revoking permissions** now checks the acting member's own permissions again at the moment of writing; if they lost them in the meantime, nothing is written. The same applies when the AI creates or edits a page channel. If the Audit Log entry for a grant or revoke cannot be written, the whole change is canceled. (#338)
- **Sign-in rate limits.** The per-IP limits for signing in, registering, forgot password and refreshing a session now count an IPv6 /64 network as one address, and each of these endpoints counts separately, so one of them being flooded no longer affects the others. Other members on the same /64 are only held back (429) while the limit applies, and are not banned. (#344)
- **Slow requests.** The server now closes connections that start a request but do not finish sending it within 10 seconds, and connections that take more than 30 seconds to send their headers or sit idle for 180 seconds between requests. Uploads and WebSocket connections are not affected. (#333, #344)
- **CSP violation log.** In the CSP violation reports the server writes to `csp-violations.log`, the query part of each URL is now replaced with `?<redacted>` and the part after `#` is dropped (including encoded `%3F` and `%23`). Before, full addresses were logged, so the one-time code of a password reset, email verification or password-change confirmation link that someone had open could end up in this log. See Notes. (#325)
- When **Password Change Verification** is on, an account with no verified email address now changes its password right away, since the confirmation email is sent only to a verified address. (#328)
- **Go and dependencies.** The server is now built with Go 1.27.3, and the libraries used for link previews, voice and TURN were updated to fix publicly known vulnerabilities. The web client's dependencies (axios and React Router) were updated as well; there is nothing different to see. (#345, #346)

### Channels and permissions

- The Audit Log entry for a role change now shows the old role and the new role; before, both sides showed the new role. (#330)
- When an admin changes user group or channel members at the same moment, members who were just added are also told when a channel disappears, so the sidebar no longer keeps a private channel they can no longer see. (#330)
- When the database cannot be read, channel and channel group changes now fail with an error instead of being saved. (#330)

### Forum channels and replies

- A reply can now only answer a message that still exists in the same channel or direct message. (#331)
- In a **locked** post, members can no longer edit their replies (forum admins still can). In an **archived** post, nobody can edit replies any more (replying was already closed). (#331)
- Members excluded by a forum's **Who can post** setting can no longer reply through the API either. (#331)
- **Editing a message** now waits for the server to confirm before the editor closes. If the edit is refused, your changes stay in the editor with the reason; if no answer comes back within 15 seconds, the editor says it is unclear whether the edit was saved and keeps your draft. (#331)
- Replies hidden (deleted) by a moderator keep their content and attachments for admins, even if the author later deletes the whole post or deletes that reply again. (#334)
- Deleting a forum channel now also deletes its posts and forum settings, and the forum statistics in the admin panel no longer count posts in deleted channels (including ones left from before updating). (#336)
- When the **Who can post** user group check cannot read the database, posting is now refused instead of allowed. (#336)
- A rejected forum post or reply (for example, because of a blocked word or an invalid attachment) no longer resets your posting interval in other forums. (#343)
- Sending the same post or reply again after no confirmation arrived (a retry with the same message ID) now returns the original one, even within the posting interval, instead of being refused or posting it twice. Retrying a forum reply sent through the API no longer counts it twice. (#334, #343)
- When a message ID that was already used for another message is sent again to a different place, the message is now refused and the message list explains that its ID was already used by another message you sent. A real retry still gets the original message. (#336)

### Voice

- Joining the same voice channel again from the same tab (for example by clicking it twice quickly) no longer drops you from the voice room. (#329)
- After stopping a screen share and immediately sharing again, viewers' first full frame is no longer delayed. (#329)
- When your camera fails to start, the voice panel now says so and the camera is turned off. (#332)
- Turning the camera off while it is still starting, or switching cameras while one is starting, no longer leaves the camera running (with its light on). (#332)
- A request to stop a camera or screen share that names a voice channel you are not in is now refused, so it no longer stops the camera or share in the room you are in. (#332)

### Server administration

- Resetting all built-in IO apps now writes an Audit Log entry (`reset_io_apps`, marked `incomplete`) even when some or all apps could not be reset; before, a failed reset was not recorded. (#333)
- Email subjects with non-ASCII characters are now encoded as RFC 2047. (#335)
- Large file uploads over HTTPS (HTTP/2) no longer leave temporary files in the system's temporary folder. (#345)
- Expired email verification links are now removed once a day and at startup. (#328)

## API changes

- **Registration while the server has no owner** needs `setup_code`, whatever the registration mode; scripts that create the owner through the API must send it. A missing or wrong code returns 403 `SETUP_CODE_REQUIRED` / `SETUP_CODE_INVALID`; if an owner was created in the meantime, 409 `SETUP_ALREADY_DONE`. `GET /api/registration-mode` now includes `setup_code_required`. (#347)
- **Password rule errors** still return 400, but the error code is now `PASSWORD_TOO_SHORT`, `PASSWORD_TOO_LONG` or `PASSWORD_TOO_COMMON` instead of `BAD_REQUEST`. This applies to `POST /api/auth/register`, `POST /api/users/me/password` and `POST /api/auth/reset-password`. (#347)
- **Email verification and password-change confirmation** moved to `POST /api/auth/verify-email` and `POST /api/auth/verify-password-change`, with the token in the body; the old `GET` requests return 410 `ENDPOINT_MOVED`. Access tokens have a new `fam` claim. The current-password limit returns 429 `RATE_LIMITED` with `details.reason: current_password` and `Retry-After`. (#337)
- **Email and reset links:** `PATCH /api/users/me` with `email` (including an empty one to remove it) now needs `current_password`: missing returns 400 with `details.field: current_password`, wrong returns 403. The `link` returned by `POST /api/users/:id/password-reset-link` is now a path (`/reset-password#token=…`) without the server address. A request whose account email changes while it runs may return 409 `EMAIL_CHANGED`, and nothing is saved or sent. (#328, #335, #337)
- New error `SERVER_BUSY` (503, `Retry-After: 5`, `details.retry_after_seconds`) when password checks are at their limit. A successful `POST /api/auth/reset-password` now includes `reset: true`. Unknown `/api/...` paths, and known paths with the wrong method, now return 404 JSON (`NOT_FOUND`) instead of the web page. (#339)
- **Body size limits.** Writes that need a permission and writes by signed-in members now accept JSON bodies up to 1 MiB (notes 8 MiB, the three orphan cleanup endpoints 8 MiB) and return 413 `PAYLOAD_TOO_LARGE` above that; this includes `PUT /api/settings` and channel `config`, which had no limit before. Page zip and IO app uploads have a transfer limit of their size limit plus 64 KiB. If the account is banned, deleted or signed out by a password change while such a request is being received, nothing is written, and the response is the same as for a request sent afterwards (403 `BANNED`, or 401). An upload to a channel that is full, closed or not visible is refused only after the whole file has been sent. (#340, #342)
- **Public endpoints** (sign in, register, verify email, resend verification email, confirm password change, forgot password, reset password, refresh, log out) accept bodies up to 64 KiB and return 413 `PAYLOAD_TOO_LARGE` above that (400 before). A request that declares a body but does not finish sending it within 10 seconds gets 408 `REQUEST_TIMEOUT` or has its connection closed. The 408 and 413 responses carry `Connection: close`. (#344)
- **Channels and channel groups:** creating or changing a channel (`POST /api/channels`, `PATCH /api/channels/:id`) with a `group_id` that names no channel group returns 400 `BAD_REQUEST` (`group_id does not exist`). Adding or removing members of a channel group (`POST` / `DELETE /api/channel-groups/:id/members`) without permission now always returns 403 `access_denied`, whether the group is public, private or does not exist (before: 400 `not_private_group` or 404 `group_not_found`). Database read failures return 500. (#330)
- **Replies and edits:** a reply whose `reply_to_id` is not a live message in the same channel or direct message is refused (WebSocket `VALIDATION_ERROR` with `details.reason: reply_target_invalid`; REST 422 `INVALID` with `reason: reply_to_outside_thread`). A top-level `MSG_SEND` in a forum channel is refused (`VALIDATION_ERROR`, `forum_top_level_via_rest`); create posts through REST. A REST reply from a member excluded by **Who can post** returns 403 `FORBIDDEN` (`who_can_post_denied`). Edit refusals now include `details.op`, `message_id` and the `edit_id` the client sent, and `MSG_EDITED` / `DM_MSG_EDITED` echo `edit_id`. (#331)
- **Message IDs:** over WebSocket, reusing a `client_msg_id` for a message in a different channel, thread, direct message or reply target is refused with `INVALID` and `details.reason: client_msg_id_reused`. Over REST, retrying a forum post with the same `client_msg_id` now returns the existing 422 with `existing_post` also within the posting interval (429 before), reusing one that belongs to another message returns 422 `client_msg_id_reused`, reusing a reply's `client_msg_id` on a different post returns 422, and retrying a reply returns 201 with the stored reply. A **Who can post** check that fails returns 500 over REST and `INTERNAL_ERROR` over WebSocket; a forum post's details return 500 on the same failure. (#334, #336, #343)
- **Voice:** a request to stop a camera or screen share whose `channel_id` is not the voice channel you are in is refused with `VALIDATION_ERROR`; a request that leaves out `channel_id` works as before. (#332)
- Granting and revoking permissions has no new error codes; refusals look the same as before. (#338)

## Notes

- **CSP violation log written before updating:** the `csp-violations.log*` files in the data folder (including rotated copies), and backup zips that contain them, may still hold full link addresses. Those links stop working within 24 hours at the latest; to clean up anyway, delete these files after updating. The JSON in each line is now compact, with keys in alphabetical order; reports over 64 KiB are cut short, and reports that are not valid JSON are kept only up to the first URL query. (#325)
- **Behind a reverse proxy:** if the proxy keeps idle upstream connections open for more than 180 seconds, its first request on such a connection may hit one the server has already closed (proxies normally retry it). Make sure the proxy is set up as a trusted proxy so the server sees the real client IP; otherwise everyone shares one rate-limit count, as before this update. IPv6 users on the same /64 network now share sign-in attempts. If your proxy logs request bodies, note that the link codes are now sent in POST bodies. (#333, #337, #344)
- **Automatic TLS certificates:** if getting the first certificate takes more than 30 seconds, the connection waiting for it fails; try again. (#333)
- **Self-building the Docker image:** the build stage now uses `golang:1.27.3-bookworm`. (#345)
- **Database:** no schema changes in this version.
- What to update: all changes are in the server and the web client it provides, which the desktop app also shows. The desktop app itself has no changes besides its version number. The game HUD program and the native capture engine bundled with the Windows desktop app are the same builds as in B2.6.62.
- Docker: this pre-release is published as `:B2.6.64-pre`, and `:pre` follows it. `:latest` is on B2.6.62.
