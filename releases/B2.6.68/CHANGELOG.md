# HakoSpace B2.6.68

Release date: 2026-11-21 (UTC)

This pre-release builds on B2.6.67; B2.6.62 is still the stable release. Screen shares that use hardware screen encoding (HakoCap) now cope better with an upload that can't take sudden bursts, and the server no longer passes every viewer's request for lost packets on to the person sharing. Server admins can also try a new setting, `VOICE_RTX`, that lets HakoCap shares recover lost packets; it is off by default.

## Voice and screen sharing

- **HakoCap shares on a limited upload.** When you share with hardware screen encoding (HakoCap) in the Windows desktop app, each keyframe is now sent spread out over a short time instead of all at once, and, on encoders that support it, single frames are kept smaller. Before, an upload that couldn't take the burst could drop the end of a keyframe, and viewers could stay on "Connecting…". This comes with the desktop app update; the server doesn't need to change.
- **Fewer repeat requests to the sharer.** (#411) When a viewer is missing packets of a share, the server resends them from its own buffer, as before, but no longer also passes the viewer's request on to the sharer. Before, the sharer was asked for the same packets again by every viewer, so the more people watched, the more the sharer's upload had to resend. This applies to shares from a web browser, from the desktop app without hardware screen encoding, and from OBS (WHIP). Update the server to get this change.
- **`VOICE_RTX` (server setting, off by default).** (#415) The desktop app's HakoCap share can now resend lost packets, but only to a server that has `VOICE_RTX=1` set (in `data/.env` or the environment; restart the server after changing it). In our tests, with the setting on and this desktop app, a HakoCap share on an upload that loses packets recovered instead of staying on "Connecting…". Shares from a web browser use the same kind of resending while the setting is on. It is off by default because when the upload is simply too slow for the share, turning it on makes the share choppier and slower to start; that case is not solved yet. With the setting off, the server behaves exactly as before, and the new desktop app works with servers that don't have it on.

## Desktop app

- **Electron 45.3.2.** (#413) Upstream bug fixes.
