# HakoSpace B2.6.66

Release date: 2026-11-17 (UTC)

> **Re-cut (2026-11-17):** Rebuilt to fix a problem the first B2.6.66-pre build (2026-11-16) introduced in the desktop app: servers you saved under hakospace.com, such as `official-server.hakospace.com`, were refused the microphone, camera and screen sharing (#406). The server also gets a library update (#405). Everything else is unchanged from the first build. With **Receive Pre-release Updates** turned on, desktop apps and servers already on the first build are offered this build as an update; Docker users pull the new image as usual.

This pre-release builds on B2.6.65; B2.6.62 is still the stable release. It is signed with a new release key, so servers running the B2.6.65 binary need to be updated by hand this once (see below). The desktop app now checks certificates strictly for everything except the servers you have saved, only lets screen capture start after you pick what to share, and no longer downloads spell-check dictionaries from Google. The server is built with Go 1.27.4.

## Before you update

- **New release signing key.** (#363) The key that signed B2.6.65-pre has been retired. This release is signed with a new key (key ID `3806CF4E58BB2C4F`).
  - **Servers running the B2.6.65 binary: please update them by hand as soon as possible.** They trust only the retired key, so they cannot verify this release: if **Receive Pre-release Updates** is on, **Check for Update** still offers it, but **Download Update** stops with a message that the release's signature didn't pass the check, and nothing is downloaded or installed. For this one update that message is expected. Download the server file for your platform from this release, check it (below), replace the binary, and restart the server. From then on, the server checks updates against the new key.
  - Servers on B2.6.64 or older do not check signatures yet and update as before (that update itself is not signature-checked; check the download by hand if you want to be sure). Docker images are not affected: keep updating by pulling the new image. The desktop app's automatic updates are not affected by the key change.
  - To check a download by hand: `minisign -Vm SHA256SUMS.txt -P RWRPLLtYTs8GOJCe29x96BK7SSlIvh1fmUx37XbkY79H6XEFfUa80IAB`; it must print `Trusted comment: hakospace tag=<the tag you downloaded>` (for this release `hakospace tag=B2.6.66-pre`), otherwise do not use the files. Then compare the file's hash with the matching line in `SHA256SUMS.txt` (for example `sha256sum -c --ignore-missing SHA256SUMS.txt`).
- **Desktop app: never sends client certificates, stricter in-app browser, no spell checking on Windows and Linux.** (#354, #360) See "Desktop app" below.

## Desktop app

### Security

We recommend updating the desktop app.

- **Saved servers under hakospace.com.** (#406) In the first B2.6.66-pre build, servers you saved under hakospace.com (such as `official-server.hakospace.com`) were refused the microphone, camera and screen sharing: joining voice showed "Microphone access denied", sharing your screen or **Share this game** in the HUD did not start, and the HUD could not load images from that server. This build fixes it. Servers you reach by IP address or another domain were not affected. The certificate rules below are unchanged: servers under hakospace.com still get the normal certificate checks.
- **Certificates.** (#354) An invalid certificate, such as a self-signed one, is now accepted only for the servers you have saved in the app, so connecting to your own self-hosted servers works as before. Everything else (update checks and update downloads, GitHub, links that members post, and websites opened in the in-app browser) uses the normal certificate checks. The app never sends a client certificate, so a server that requires one (mutual TLS) cannot be used from the desktop app.
- **Permissions.** (#354) Camera, microphone and screen access is given only to saved servers. Websites in the in-app browser are now refused every permission except copying to the clipboard, so for example a video's full-screen button no longer works there. While the main window is hidden in the tray or minimized, server pages can no longer show it again, open new windows or start a screen share picker. Links on a page open in your browser only if they are `http` or `https` links; other links, such as `mailto:`, no longer open.
- **Screen sharing starts only after you choose.** (#359) Sharing your screen or a window now always needs your choice in the source picker (or **Share this game** in the HUD), and the tab that asked must still show the same saved server after you choose. Another server tab can no longer start or stop the audio capture of a share it did not start. Only one source picker is open at a time; a second request while one is open is refused.
  - Closing or cancelling the source picker no longer shows "Screen sharing could not start (AbortError)".
  - Windows with hardware screen encoding (HakoCap): if the share request reaches the app more than about 5 seconds after you pressed share, the app uses Chromium screen sharing instead of hardware encoding (you still pick the source in the same picker) and may show the existing "Hardware screen encoding unavailable" notice. A second share started while another hardware-encoded share is still starting also uses Chromium screen sharing (or is refused while a source picker is already open).

### Other changes

- **Spell-check dictionaries.** (#360) On Windows and Linux the desktop app no longer downloads spell-check dictionaries from Google when it starts. As a result there is no spell checking on Windows and Linux: misspelled words are no longer underlined in red.
- **Push-to-talk in the pop-out share window.** (#360) If you hold the push-to-talk key in the pop-out share window and then switch away from it or close it, push-to-talk now follows the same rule as the main window. Where push-to-talk can listen in the background (a shortcut with Ctrl, Alt, Shift or Super (Windows key), on Windows or on Linux with X11), it keeps working while you switch apps, as before. Otherwise (Linux on Wayland, or a single-key shortcut) the microphone is released as soon as the pop-out loses focus.
- **Electron 45.3.0.** (#400) Upstream bug fixes, including fixes backported from Chromium and V8.

## Server

- **Cryptography library update.** (#405) The server's `golang.org/x/crypto` library is updated to 0.59.0, a newer minor release.
- **Go 1.27.4.** (#364) The server is now built with Go 1.27.4, which includes the fix for the Go standard library issue GO-2026-6859 in the HTTP server. We recommend updating every server.
- **Library updates.** (#375, #391, #399) The server's libraries, including the WebRTC library used for voice and video, are updated to newer minor and patch releases.
- **Docker image.** (#365) The image is rebuilt on an updated Debian bookworm-slim base image.

## Web client

- **Library updates.** (#381, #402) The web client's libraries, including React, are updated to newer minor and patch releases.
- **Icons.** (#403) The icon library is updated, so some icons look slightly different.
