# HakoSpace B2.6.57

Release date: 2026-10-16 (UTC)

> **Action required — updated EULA and Privacy Policy (effective 2026-10-16).**
> This release ships new versions of the self-hosted End-User License Agreement and Privacy Policy. Both are material changes, so **every user will be asked to review and accept them again the next time they connect** to a server running this release. Server administrators may want to let their users know before upgrading.
> The main change is hakoHub, an optional public server directory that is off by default and can only be turned on by a server administrator; the documents also now describe the software's current behaviour in more detail.
> Read them: [EULA](https://hakospace.com/legal/archive/2026-10-16/eula/) · [Privacy Policy](https://hakospace.com/legal/archive/2026-10-16/privacy/) (#195)

## Features

- Themes: themes are now either personal or server themes. A theme you create or copy under Appearance in your own settings is personal: only you can see it and apply it. Server themes are available to everyone and are the only ones that can be used as the server's default theme or as a channel theme; members with the "Manage expressions" permission create, edit and delete them. By default each member can have up to 10 personal themes, and a theme background image can be up to 5 MB. Built-in themes can now be copied too. (#196)
- Themes: deleting, copying or uploading a background for a theme now shows an error when it fails, instead of failing silently, and an image over the size limit is rejected before it is uploaded. A server theme that is the server's default cannot be deleted until another default is chosen. (#196)
- Fonts: uploading and deleting custom fonts now requires the "Manage expressions" permission, and every custom font is a server font. A font name can no longer contain symbols such as quotes, brackets, commas or colons. (#196)
- Passwords: changing your password in Settings, confirming a password change by email, or resetting a forgotten password now logs out every device logged in to your account. When you change your password in Settings, the device you are using is logged out right away and the login page tells you why. If password changes need email confirmation on your server, nothing is logged out until you confirm. Logins made before the change, including any that may have been stolen, stop working. (#197)

## Bug Fixes

- Security: a member could cause the server to delete files that other members had uploaded. Fields that store an uploaded file (such as avatars, banners, stickers, sounds, theme backgrounds and badge icons) now accept only a file you uploaded yourself for that purpose; trying to use another file is rejected with an error. We recommend updating every server. (#193)
- Security: after an account is deleted, devices that were logged in to it can no longer renew their login. (#192)
- Security: a member can no longer apply another member's personal theme or use its background, and custom font names and font file names can no longer change the app's styling. (#196)
- Profile and server settings: when a change is rejected, your current avatar, banner or other image is no longer deleted. Images that a change replaces are now removed only after the change has been saved. (#193)
- Theme backgrounds: on a slow connection, a theme's background image no longer appears as a white screen that fills in from top to bottom. When you open the app while logged in, the loading screen now waits up to 2.5 seconds for the background image; switching to another theme keeps the current background until the new image is ready, then fades it in. (#190)
- Login: opening the app no longer sends you to the login page when your browser still has your login but its cached copy of your profile is missing; you are signed back in instead. (#191)

## Notes

- Theme changes on first start: when a server starts this version for the first time, it sorts out existing themes and logs one `[themes] ownership migration: …` line. A personal theme that is used as the server's default theme or by a channel becomes a server theme, so what everyone sees does not change; members and channels that were set to someone else's personal theme are reset to follow the server's theme, and personal themes whose author no longer exists are deleted. Custom fonts become server fonts. (#196)
- Changing a password does not cut off a device immediately: a device that is already logged in stays logged in until its current access expires (60 minutes by default), and a connection that is already open stays open until it disconnects. (#197)
- What to update: every change is in the server and the web client it provides, which the desktop app also shows, so the changes take effect once the server is updated. The desktop app is unchanged since B2.6.56, and the game HUD program and the native capture engine bundled with the Windows desktop app are the same builds as in B2.6.56.
- Docker: this pre-release is published as `:B2.6.57-pre`, and `:pre` follows it. `:latest` stays on B2.6.51.
