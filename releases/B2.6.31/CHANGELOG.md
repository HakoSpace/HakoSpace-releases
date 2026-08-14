# HakoSpace B2.6.31

Release date: 2026-08-14 (UTC)

## Bug Fixes

- fix(attachments): tri-review round 11 — the header read could not classify its own failure, so it asks the filesystem instead (4383d97)
- fix(attachments): tri-review round 10 — a retryable decode, and six tests that certified nothing (3b400a0)
- fix(attachments): tri-review round 9 — the ceiling budgeted the decode and missed the larger allocation sitting next to it (1836cb1)
- fix(attachments): tri-review round 8 — the byte budget read the colour model and missed what a progressive JPEG actually costs (fd54435)
- fix(attachments): tri-review round 7 — a ceiling that admitted twice what its own arithmetic said (2981b7b)
- fix(attachments): tri-review round 6 — the unattended decode had no ceiling, and a metadata read that failed was being treated as an answer (8654dfe)
- fix(attachments): tri-review round 5 — an unreadable orientation is not orientation 1, and the loaded lightbox was clipping large images (2e3bbe3)
- fix(attachments): tri-review round 4 — EXIF-rotated photos would have shipped sideways (2229a0c)
- fix(attachments): tri-review round 3 — the round-2 lightbox fix did not work (118ebc4)
- fix(attachments): tri-review round 2 — a cursor that outran a failure, and the lightbox this branch quietly slowed down (718bc4e)
- fix(attachments): tri-review round 1 — one real fragility, one real trap (da9be58)
- fix(chat): reserve image space so image-heavy scrollback stops thrashing (312be96)

## Test

- test(attachments): tri-review round 12 — close the last two branches that read as though they worked (9a8e318)

## Other

- wip(attachments): the message list stops fetching originals (700652a)
- wip(attachments): backfill history's dimensions and previews (a233024)
- wip(attachments): close the preview deletion vector, generate previews (038c9bf)
- wip(attachments): image dimensions + preview URL on the wire contract (cb50566)

