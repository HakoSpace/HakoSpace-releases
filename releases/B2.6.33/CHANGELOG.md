# HakoSpace B2.6.33

Release date: 2026-08-26 (UTC)

## Features

- Server logs can now tell where a failed voice handshake went wrong. When a user could not join voice, the log used to show an offer being sent and then nothing — with no way to tell whether the message never reached the user or the client never replied. The server now records signaling messages that were dropped because a session's buffer was full or the user had no live connection at all, notes when a WebSocket disconnects, and reports answers and ICE candidates that arrive after their room is already gone. Healthy calls produce no new log lines. (#100)

## Bug Fixes

- Joining a voice channel could fail when the connection handshake was slow. The server used to give up on an unanswered offer after roughly 10–18 seconds — short enough to cut off handshakes that were still completing — and the recovery it attempted first relied on an operation the WebRTC stack cannot actually perform, so every rescue ended in a teardown. The server now waits a full 30 seconds, matching the deadline the client itself applies, before closing and reclaiming a genuinely stalled connection. (#101)
