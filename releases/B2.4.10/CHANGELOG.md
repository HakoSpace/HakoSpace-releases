# HakoSpace B2.4.10

Release date: 2026-03-24

## Changes

6916701 版本號更新至 B2.4.10
4eff7f8 fix: remove TWCC header extension that caused Chrome BWE to floor at 300kbps
2412fd3 版本號更新至 B2.4.9
d5612c2 fix: apply VP9 codec preference synchronously in auto mode to prevent H264 fallback
4e7ca1b fix: reset ExcludedCodecs on screen share restart for fresh codec negotiation
a233dcd fix: enlarge NACK buffer and re-enable TWCC for screen share reliability
938c0f6 版本號更新至 B2.4.8
92e8d46 fix: prevent voice kick when watching screen share with codec mismatch
bec41c4 版本號更新至 B2.4.7
d128b02 fix: clear service worker cache before reload to prevent stale version loop
86aad4d fix: image thumbnails overflow on mobile + note channel horizontal scroll
2620411 fix: aggressive mobile horizontal scroll lock + body-level safe area for PWA
9fd7b8f fix: lightbox horizontal overflow + PWA safe area notch not working
005bbb1 fix: prevent horizontal scrolling on mobile PWA
1ea84a5 版本號更新至 B2.4.5
e6a1a73 fix: macOS web screen share ignoring codec preference (using VP9 instead of H264)
770afaf fix: frontend build silently failing — stale B2.4.3 embedded in B2.4.4
1433e19 版本號更新至 B2.4.4
d358042 feat: add per-member codec visibility to voice debug overlay
aa6b89e 版本號更新至 B2.4.3
c6db428 fix: iPhone notch safe area insets for PWA standalone mode
2bb748f 版本號更新至 B2.4.2
457608f fix: desktop EmojiPickerPopup mousedown listener blocking touch reactions
00691ab 版本號更新至 B2.4.1
7054d81 fix: emoji reaction picker invisible on touch devices
e71ef25 feat: mobile responsive layout for settings page
beea773 fix: welcome modal emoji rendered as literal unicode escape
f00fde3 版本號更新至 B2.4.0
42a8a32 feat: WebSocket visibilitychange reconnect for mobile background
c681b65 feat: responsive layout — mobile/tablet/desktop conditional rendering
