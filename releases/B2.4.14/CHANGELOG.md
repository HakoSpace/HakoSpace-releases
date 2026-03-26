# HakoSpace B2.4.14

Release date: 2026-03-26

## Changes

be8803b fix: WS Monitor 右側截斷問題 + 終端機左右加 padding
97a4054 fix: 修正關於頁面和偏好設定預覽寬度不一致問題
8273635 版本號更新至 B2.4.14
9004374 fix: dashboard tab 未載入 allow_prerelease 設定導致 toggle 無法關閉
9cd5113 版本號更新至 B2.4.13
2f8ae8e feat: 修復終端機遮擋問題 + 新增獨立終端機視窗功能 (Web 新分頁 / Desktop 彈出視窗)
25f15fd fix: 提高 PWA workbox 檔案大小上限至 5MB
11d4ac9 版本號更新至 B2.4.12
c82837e feat: 新增 JWT token refresh 機制 (access token 1h + refresh token 30d + rotation)
2a0e7c5 版本號更新至 B2.4.11
5caf42a feat: 伺服器更新支援預覽版過濾
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
