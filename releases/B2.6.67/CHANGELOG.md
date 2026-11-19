# HakoSpace B2.6.67

Release date: 2026-11-19 (UTC)

This pre-release builds on B2.6.66; B2.6.62 is still the stable release. Your own status now stays in step with the server, **Show watched only** on the voice stage now hides the shares you haven't opened, and screen shares hold up better when the sharer's connection loses packets. All three fixes come with the server update; the desktop app update adds the status ring fix described below.

## Your status

- **Your status follows the server.** (#408) The status in your personal control bar (bottom of the left sidebar) now matches the one the server has for you, the same as your row in the member list:
  - If you change your status on another device or in another browser, it changes here too.
  - When you sign in, the control bar shows your current status (for example **Do Not Disturb**) instead of always showing **Online**.
  - After the server restarts, the control bar shows the status the server has for you. A server restart currently sets **Do Not Disturb** and **Invisible** back to **Online**; this is a known issue that is not fixed yet.
- **Going idle automatically.** (#408) While your status is **Online**, it changes to **Idle** after 5 minutes without activity and back to **Online** when you are active again. Before, after you signed in, this could stay switched off until you changed your status yourself. If you choose **Idle**, **Do Not Disturb** or **Invisible** yourself, it is not changed automatically.
- **Desktop app: status ring on server icons.** (#408) The ring around each server icon in the multi-server sidebar now shows the same status as that server's personal control bar. After you sign out, and while a server page is reloading, no ring is shown instead of a grey one. The correct ring color comes with the server update; removing the ring after sign-out needs the desktop app update. If the connection to a server drops, the ring currently keeps its last color.

## Voice and screen sharing

- **Show watched only.** (#409) With **Show watched only** turned on, the voice stage now hides the shares you haven't opened (the **Click to Load** tiles), including OBS (WHIP) streams and, when you share with hardware screen encoding (HakoCap), your own tile. A share you stop watching becomes a **Click to Load** tile again, so it is hidden too. Shares you are watching or have opened and are still connecting, cameras, and the preview of your own browser share stay on the stage. The button now appears only when there is something for it to hide, and if the filter leaves the stage empty, it shows "Not watching any shares right now". With the filter turned off, nothing changes.
- **Screen shares on connections that lose packets.** (#410) When the sharer's upload loses packets, the server now keeps the packets that the sharer sends again, so viewers can get the missing video back. Before, the server dropped most of them, and a share on such a connection could stay on "Connecting…" for viewers. This helps shares from a web browser, from the desktop app without hardware screen encoding, and from OBS (WHIP). Shares that use hardware screen encoding (HakoCap) do not send lost packets again yet, so they are not helped by this change. Update the server to get this fix.
