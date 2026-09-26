# HakoSpace B2.6.46

Release date: 2026-09-26 (UTC)

## Important: updated Privacy Policy

- The Privacy Policy has a new effective date, 2026-09-26. After a server is updated to this version, every user of that server is asked to read and accept the updated Privacy Policy the next time they connect. The EULA is unchanged (2026-07-08). (#146)
- What changed in the policy: software updates now come from HakoSpace's own release source, `dl.hakospace.com` (run by HakoSpace on Cloudflare's storage and delivery services), with GitHub as the fallback when it is unavailable — see "Updates now come from dl.hakospace.com" below. The desktop update-check entry now names that source; a new entry covers server update checks, which happen only when a server administrator checks for or downloads an update in the server settings (servers deployed from the official Docker image do not use this feature); and the "Network Logs" paragraph now also covers the standard connection information, such as the IP address, that update checks and downloads leave with the CDN. Update checks still carry no information about your account, your messages or the servers you connect to. Nothing else in the policy changed.
- Everyone on an updated server is asked to accept it, including people who use HakoSpace in a web browser.

## Features

- Updates now come from dl.hakospace.com. The desktop app's automatic and manual update checks, and a server's update check in the server settings, now look up new versions on HakoSpace's own release source and download from it, falling back to GitHub automatically when it cannot be reached or a download does not pass verification. Downloads from it are typically much faster than from GitHub. How an update is recognized and verified is unchanged: the desktop app still checks the installer's SHA-512, and the server still checks the new binary's SHA-256 before applying it. (#147)

  - Server administrators who prefer to update from GitHub only can set `HAKO_UPDATE_MANIFEST_URL=off`.

- Game HUD: paste an image into the HUD panel's text box. Take a screenshot, press Ctrl+V in the panel, add a message if you like, and press Enter — the image is sent with your message to the channel's text chat without switching back to the app. (#144)

  - One image per message, up to 8 MB; a message can be just the image with no text. The pasted image shows as a small thumbnail with a "Remove image" button, and while a large image is still being prepared ("Preparing image…"), Enter does not send yet.
  - Pasting text works as before. Pasting a file that is not an image shows "Only images can be attached here", and pasting a second image while one is already attached keeps the first one ("One image at a time").
  - The image is uploaded to the server only when you send the message, just like the app's own text box, so an image you remove or never send is not uploaded.
  - This needs both the desktop app and the server you are connected to on B2.6.46 or later: the HUD panel's sending half is part of the web client each server provides.

## Notes

- The HUD program bundled with the desktop app was rebuilt for this release. Its half of the image-paste feature comes from the HUD's own repository, so it has no pull-request number here.
- Installs on B2.6.45 or earlier find this update on GitHub, as before. From B2.6.46 on, update checks go to dl.hakospace.com first.
- No Docker image is published for this pre-release. Servers running the Docker image stay on their current version, and their users are not asked to accept the 2026-09-26 Privacy Policy yet.
