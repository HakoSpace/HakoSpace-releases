# HakoSpace B2.6.52

Release date: 2026-10-07 (UTC)

## Bug Fixes

- Security: before you sign in, a server now sends only what its sign-in and registration pages need: the server's name, icon, sign-in message and banner, and the site theme. The rest of the server settings is sent only after you sign in. Pending password changes are no longer kept in the server settings, and secret settings such as AI API keys and the email (SMTP) password are now always shown as `********`, which reveals nothing about the saved value. We recommend updating every server. If your server sends email, we also recommend replacing the password or API key it sends with: create a new one with your email provider, enter it under Email Proxy → Password / API Key in the server settings, then remove the old one at the provider. (#165)
- Server settings: saving the email settings again without retyping the password no longer replaces an SMTP password of 8 characters or fewer. (#165)
- Account: setting a new password — in the app, with a password reset link, or with a password-change confirmation link — now cancels any password-change confirmation link still waiting in email, so an older link can no longer change the password afterwards. (#165)

## Notes

- Everything in this release is part of the server and the web client it provides, so it takes effect once the server is updated. The desktop app has no changes of its own; the game HUD program and the native capture engine it bundles are the same builds as in B2.6.51.
- The Privacy Policy and the EULA are unchanged in this release (still effective 2026-09-26 and 2026-07-08), so no new acceptance is required.
- No Docker image is published for this pre-release. Servers running the Docker image stay on their current version.
