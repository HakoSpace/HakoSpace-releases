# HakoSpace B2.6.53

Release date: 2026-10-12 (UTC)

## Bug Fixes

- Sign-in: a failed sign-in no longer crashes the sign-in page with an "unexpected error" screen. The page now says what went wrong: an incorrect username or password, too many sign-in attempts, or an IP address blocked by the server. (#166)
- Sign-in: messages about a suspended account or an unverified email address now appear only after the correct password is entered. A suspended member who signs in with the correct password sees the suspension reason, so write reasons that are fine for that member to read. (#166)
- Attachments: a refused upload now shows "Upload failed" instead of `[object Object]` above the message box. (#166)
- Uploaded files: when a server runs behind a CDN such as Cloudflare, a file deleted on the server — with its message, by channel file-space cleanup, or by an admin — now stops being served from the CDN's cache within minutes, instead of possibly staying reachable there for up to a year. Browsers still keep files they have already downloaded. (#170)

## Changes

- New HakoSpace logo: the desktop installer, shortcuts and tray icon, the sign-in pages, the browser tab icon (on servers without their own icon) and the home-screen icons now use the new logo. (#168, #169)

## Notes

- The fixes above are part of the server and the web client it provides, so they take effect once the server is updated. The desktop app's only change is the new icon; the game HUD program and the native capture engine it bundles are the same builds as in B2.6.52.
- The Privacy Policy and the EULA are unchanged in this release (still effective 2026-09-26 and 2026-07-08), so no new acceptance is required.
- Docker: this pre-release is published as `:B2.6.53-pre`, and the new `:pre` tag now follows the latest preview release. `:latest` stays on B2.6.51. `:B2` and version-number tags such as `:2.6.51` are no longer updated.
