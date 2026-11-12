# HakoSpace B2.6.65

Release date: 2026-11-12 (UTC)

This pre-release builds on B2.6.64; B2.6.62 is still the stable release. It is the first release signed with the HakoSpace release key, and from this version on the server's self-update installs only releases whose signature checks out. The desktop app moves to a supported Electron release, successful sign-ins no longer count toward the per-address sign-in limit (so people who share an IP address stop getting it blocked just by signing in), and the server log is now private to the server's account.

## Before you update

- **Server updates are now signature-checked.** (#351) Every release now ships `SHA256SUMS.txt.minisig`, a [minisign](https://jedisct1.github.io/minisign/) signature of `SHA256SUMS.txt`. Starting with this version, the server downloads an update only if that signature verifies against the release key built into the server and names the version being installed. If the signature is missing or does not verify, nothing is downloaded or installed and the server is unchanged. The server also refuses to install a release older than the one it is running (moving from the pre-release channel to a stable release within the same minor version is still allowed), and an update that an older version downloaded but did not install is discarded when this version starts. Servers older than this version do not have the check, so updating to this version is not signature-checked; check the download by hand (below) if you want to be sure. Docker images are not covered by this signature; with Docker you keep updating by pulling the new image.
  - To check a download by hand: `minisign -Vm SHA256SUMS.txt -P RWQdvIJWoBdcKhFRmBM+74vYnYq0hWsFONmn+LVf7RJHg46eAXirsLEg`; it must print `Trusted comment: hakospace tag=<the tag you downloaded>` (for this release `hakospace tag=B2.6.65-pre`), otherwise do not use the files. Then compare the file's hash with the matching line in `SHA256SUMS.txt` (for example `sha256sum -c --ignore-missing SHA256SUMS.txt`).

## Desktop app

- **Electron 33 → 45.** (#348) The desktop app now runs on a supported Electron release (Electron 33 no longer received security updates), and the build tool is updated with it. We recommend updating the desktop app.
- **Linux on Wayland.** (#350) On Wayland sessions the desktop app now runs as a native Wayland application: **F11** switches the real full screen on and off, the server right-click menu is a native menu, and the window reports the correct application id, so the AppImage's launcher entry now matches its window. Windows and X11 sessions keep their behavior.

## Bug Fixes

### Security

We recommend updating every server.

- **The server log is private to the server's account.** (#352) `hako.log` and older rotated log files in the data folder are now tightened to be readable and writable only by the account that runs the server, and a new `hako.log` is created that way. The one-time setup code of a new server is written only to a freshly created private log file, and it is no longer printed to standard output or error when those are redirected into a file (find it in `<DATA_DIR>/hako.log`, by default `data/hako.log`). If the file cannot be made private, the code is not written to it. On Windows, which has no file permission bits, the file keeps the folder's access rules and the setup code is written as before.
- **Forum posts after an account change.** (#353) A post or reply that was held back behind an earlier copy of the same message is now checked again just before it is saved, and is dropped if in the meantime its author's account was suspended or deleted or their session was revoked (for example by a password change).

### Other fixes

- **Forum.** (#353) Replying to a forum post through the REST API now follows the same posting-interval limit as other forum posts. Pressing **Publish** again after the response was lost (for example after a dropped connection) no longer creates a duplicate post while the draft is unchanged. Editing any field starts a new post, and this protection lasts only while the post form stays open; reloading the page or closing the form resets it.
- **Sign-in limits behind a shared address.** (#355) Only failed sign-in attempts (a wrong password or an account name that does not exist) now count toward the per-address sign-in limit and can lead to a block. Successful sign-ins, refusals that come only after a correct password (such as a suspended account or an unverified email address) and server errors (HTTP 5xx) no longer count, so several people behind the same IPv4 address (an office or school network) can sign in without the address being blocked; wrong passwords still count for the whole address. **Forgot password?** requests turned away because the server-wide reset limit was used up no longer count toward the address's own reset limit. Registering and refreshing a session count as before, except that server errors are no longer counted. If more than 5 successful sign-ins from one address happen at the very same moment, the extra ones get a short "too many requests" answer and work when retried about a second later; the address is not blocked.
- **AI usage page.** (#356) The description now says "AI bot", like the rest of the app, instead of "AI assistant".
- **`rebuild.sh` and `rebuild.bat`.** (#357) `rebuild.bat` no longer redirects its console output into `hako.log` (the redirect could overwrite lines the server writes there, such as the setup code); it now writes `hako.stdout.log` next to the script and, if the server fails to start, lists both log files. Both scripts now look for `hako.log` in the `DATA_DIR` set in `data/.env` instead of always in `data/`. The docs now say where to find the setup code: `<DATA_DIR>/hako.log` (by default `data/hako.log`).
