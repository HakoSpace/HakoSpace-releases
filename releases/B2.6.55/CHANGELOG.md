# HakoSpace B2.6.55

Release date: 2026-10-14 (UTC)

## Features

- Desktop: your sign-in tokens are now stored encrypted, using the encrypted storage your operating system provides, in a separate file from your server list. Tokens saved by earlier versions are moved into it automatically the first time you open each server, so you do not need to sign in again after updating. If your system cannot provide encrypted storage (for example, some Linux setups without a keyring), the app keeps you signed in only until it quits and asks you to sign in again the next time it starts; it never falls back to saving the tokens unencrypted. Removing a server, or changing a server's address, clears its saved sign-in. This works with every server, including ones that have not been updated. (#181)

## Bug Fixes

- Desktop, Add / Edit Server window: when a button has keyboard focus, Enter now activates only that button. Before, pressing Enter on "Cancel" while editing a server saved your changes before closing the window, and pressing Enter on "Test Connection" could add the server without testing it. (#182)
- Desktop, Add / Edit Server window: pressing Enter while a connection test is running no longer adds the server. After a test you started from the keyboard, focus goes back to "Test Connection", so pressing Enter again runs the test again instead of adding an untested server. (#183)
- Desktop, Add / Edit Server window: Enter and Esc no longer submit or close the window while an input method editor is still composing text in the name or address field, matching the web client fix in B2.6.54. (#180)
- Desktop, Share Screen window: pressing Enter on "Cancel" no longer starts sharing, and pressing Enter on the "Yes / No" or "Automatic / Manual" buttons now just switches that option instead of starting to share with the previous setting. Pressing Enter on "Start Sharing", or anywhere outside the buttons, starts sharing once. (#183)
- Desktop: the app icon, taskbar icon and system tray icon now use the logo without the white outline, which looked like a grey halo on dark taskbars. On Windows machines that already have the app installed, shortcuts and pinned taskbar icons may keep showing the old icon until Windows refreshes its icon cache. (#184)

## Notes

- Desktop sign-in tokens from earlier versions: the update moves them into the encrypted store and deletes them from the app's web storage, but older copies can stay in the app's storage files on disk until those files are rewritten. The old refresh token stops being accepted the first time the app refreshes that sign-in, and the short-lived access token expires on its own. For a server you do not open again after updating, the old tokens stay valid until they expire.
- Server: the consent check now tracks two versions of the EULA and the Privacy Policy, the current text and the version that last required acceptance. This lets a future editorial revision of the terms (such as a typo or wording fix that does not change their meaning) take effect without asking everyone to accept again, while a substantive change still asks everyone. Accepting the terms now records only the document you were asked to accept. Nobody's acceptance status changes with this update. (#179)
- The Privacy Policy and the EULA are unchanged in this release (still effective 2026-09-26 and 2026-07-08), so no new acceptance is required.
- What to update: everything except the consent-version change is in the desktop app. The consent change takes effect once the server is updated. The web client the server provides is unchanged. The game HUD program and the native capture engine bundled with the Windows desktop app are the same builds as in B2.6.54.
- Docker: this pre-release is published as `:B2.6.55-pre`, and `:pre` follows it. `:latest` stays on B2.6.51.
