# HakoSpace B2.6.30

Release date: 2026-08-13 (UTC)

## Bug Fixes

- Message lists no longer scroll sideways. Long nicknames, wide image attachments and link preview cards now wrap or scale down to fit the panel instead of widening the whole conversation. Code blocks keep their own horizontal scroll, because wrapping code destroys the indentation that carries its structure. (#95)
- The message composer now has a layout for narrow panels. Below a certain width the text box takes a row of its own and the tool buttons move underneath it, where they scroll sideways when space is tight; the send button stays put and is never scrolled out of reach. This applies wherever the composer itself is narrow — a small desktop window, a voice channel split side by side, or a phone — not only on small screens. (#95)
