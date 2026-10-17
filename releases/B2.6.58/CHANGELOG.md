# HakoSpace B2.6.58

Release date: 2026-10-17 (UTC)

## Features

- Themes: server settings have a new **Themes** tab for members with the "Manage expressions" permission, with four sections (#199):
  - **Server Themes**: create, edit and delete server themes. Each theme shows where it is used (server default, number of channels and members). Deleting a theme asks first and says how many channels and members will go back to following the server's theme. The server default theme cannot be deleted until another default is chosen.
  - **Members' Themes**: lists the members who have personal themes, with how many each has and how much space their background images take, and marks members over the limit. Search by username or display name, sort by theme count, background size, last update or username, 50 members per page. Open a member to adopt one of their themes as a server theme (a copy is made; theirs stays as it is) or to delete it, or delete all of a member's personal themes. Each action asks first, and the member is notified.
  - **Fonts**: custom font upload and deletion moved here from Appearance. The font family is now made from the font name with disallowed symbols removed, so a name such as "Noto (Bold)" uploads instead of being rejected. A failed upload or deletion now says why.
  - **Settings**: "Let members create personal themes" (on by default; when off, existing personal themes stay usable but none can be created, edited or copied), "Personal themes per member" (1 to 100, default 10) and "Theme background size limit (KB)" (from 64 KB up to the server upload limit, default 5120).
- Themes: the server **Appearance** tab ("Manage server") now holds only the server default theme. A pick applies at once; if the server rejects it, the previous default comes back and the reason is shown. (#199)
- Themes: under Appearance in your own settings, themes are grouped into Built-in, Server Themes and My Themes, with your count and the limit. When you have reached the limit, or the server has turned personal themes off, the buttons you cannot use are disabled and a message says why. (#199)
- Themes: deleting a theme or font now asks in an in-app dialog instead of the browser's confirmation box. (#199)

## Bug Fixes

- Theme editor: the editors under your own Appearance and under the server's no longer share their state, so opening one no longer changes the other. A save that finishes now closes only the editor that started it (before, opening another theme while a save was running could close that one), and a save that fails while its editor is not shown is reported above the theme list. (#198)
- Theme editor: setting every color back to full opacity now clears the transparency saved earlier. Saving is unavailable while a background image is still uploading, and a second background cannot be uploaded until the first one finishes. (#199)
- Theme editor: when two saves of the same theme overlap, they are sent one after another, so the later one is not overwritten. Closing the editor returns keyboard focus to the button that opened it. (#199)
- Channel themes: a change the server rejects now shows why, instead of failing silently. (#199)

## Notes

- Upgrading from a version before B2.6.57: the theme changes on first start described in the B2.6.57 notes still apply. The server logs the `[themes] ownership migration: …` line only when it has existing themes or fonts to change.
- What to update: every change is in the web client the server provides, which the desktop app also shows, so the changes take effect once the server is updated. The desktop app is unchanged since B2.6.57, and the game HUD program and the native capture engine bundled with the Windows desktop app are the same builds as in B2.6.57.
- Docker: this pre-release is published as `:B2.6.58-pre`, and `:pre` follows it. `:latest` stays on B2.6.51.
