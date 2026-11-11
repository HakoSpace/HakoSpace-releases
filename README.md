# HakoSpace

**HakoSpace** is a self-hosted voice, video, and messaging platform that gives you full control of your server, data, and privacy.
(The name "Hako" comes from the Japanese 箱 (はこ) — a box of your own.)

🌐 **Website: [hakospace.com](https://hakospace.com)** · **Docs: [hakospace.com/docs](https://hakospace.com/docs)** · **Download: [hakospace.com/download](https://hakospace.com/download)**

---

## Features

- **Text channels** — replies, reactions, file sharing, Markdown formatting, and preview cards for links.
- **Forum channels** — topic posts with replies.
- **Voice channels** — group voice, camera, and screen sharing of a window or the whole screen.
- **Direct messages** — one-to-one messages, with one-to-one voice and video calls.
- **Stickers and a sound board** — stickers in messages and a sound board in voice channels, from the server's packs and your own.
- **IO Apps** — small shared apps that run inside a channel, such as a whiteboard.
- **Roles and permissions** — owner, admin, and member roles, plus permissions you can grant to user groups or to individual members.
- **Administration** — an audit log of administrative actions, registration modes (such as Invite Only and Closed), a banned-word filter, IP bans, and a built-in backup tool.
- **AI agent (Experimental)** — an optional assistant that uses your own API key from Anthropic, OpenAI, Google, or OpenRouter.
- **Desktop app for Windows and Linux** — connect to several servers from one window; system tray, global shortcuts, and push to talk. Windows adds a game HUD and the HakoCap screen-capture engine; you can share a single application's sound (Linux with PipeWire; on Windows when you share one window).
- **Web client** — open the server's address in a browser, with a layout for phones.
- **Self-hosted** — one server, an embedded SQLite database, built-in TLS options, run from a Docker image or a single binary.

The Privacy Policy is in [PRIVACY.md](./PRIVACY.md).

---

## Get HakoSpace

Start at [hakospace.com/download](https://hakospace.com/download). The files on this repository's [Releases](https://github.com/HakoSpace/HakoSpace-releases/releases) page are official copies.

| | What to get |
|---|---|
| **Server (Docker, recommended)** | `ghcr.io/hakospace/hako` — runs on x86-64 and ARM64 |
| **Server (binary)** | `server-hakospace-linux-amd64-<version>` or `server-hakospace-windows-amd64-<version>.exe` |
| **Desktop, Windows** | the installer (`…-setup-…exe`, updates itself) or the portable `.exe` (update it by downloading the new version). The game HUD comes with the Windows packages |
| **Desktop, Linux** | the `.AppImage` (update it by downloading the new version) |

Desktop builds are not code-signed, so Windows may show an "Unknown Publisher" warning when you install.

---

## Quick start

### With Docker Compose

Save as `docker-compose.yml` (a commented version is also in this repository), then run `docker compose up -d`, and open `http://localhost:8080`:

```yaml
services:
  hako:
    image: ghcr.io/hakospace/hako:latest
    ports:
      - "8080:8080"
    environment:
      - TLS_AUTO=false        # plain HTTP; put a reverse proxy in front for HTTPS
    volumes:
      - hako-data:/app/data
    restart: unless-stopped

volumes:
  hako-data:
```

`TLS_AUTO` defaults to `true`, which moves the main listener to port 8443. This example publishes only 8080, so it sets `TLS_AUTO=false`.

Update with `docker compose pull && docker compose up -d`. The in-app updater is switched off in the official Docker image.

With Docker Engine on Linux (rootful), use `network_mode: host` for voice instead of the port mapping; the steps are in the self-hosting guide at [hakospace.com/docs](https://hakospace.com/docs). Browsers allow the microphone only over HTTPS (or on `localhost`), so serve voice users over HTTPS.

### With the binary

Download the server binary for your system from [Releases](https://github.com/HakoSpace/HakoSpace-releases/releases), check it (see [Verify downloads](#verify-downloads)), rename it to `hako` (`hako.exe` on Windows), and run it from the folder where you want its data to live:

```bash
mv server-hakospace-linux-amd64-<version> hako
chmod +x hako
./hako
```

- The server keeps its data in `data/` **in the folder you start it from**. Starting it from somewhere else creates a second, empty `data/` there.
- By default it serves HTTPS with a self-signed certificate on port 8443, and port 8080 only redirects to it, so your browser will show a certificate warning. For plain HTTP, set `TLS_AUTO=false` in `data/.env` (created on the first start) and restart. For a Let's Encrypt certificate, set `ACME_DOMAIN` there; Let's Encrypt must reach the machine on ports 80 and 443, so forward 443 → 8443 and 80 → 8080 (or set `PORT=80` and `TLS_PORT=443`, which needs root or `CAP_NET_BIND_SERVICE`).
- To keep it running, use a systemd service with **`Restart=always`** and `WorkingDirectory=` set to the folder that holds `data/`. Under systemd, updating from the admin panel stops the server and relies on systemd to start the new version; with any other `Restart=` value the update is refused.

### First start: create the owner

**Version B2.6.64 and newer.** A new server has no owner yet. On start it prints a one-time **setup code** to its log:

```
  SETUP CODE:  XXXX-XXXX-XXXX-XXXX
```

1. Find the code in the log:
   - Docker: `docker compose logs hako` (or `docker logs <container name>`)
   - Binary: the terminal, or `data/hako.log` (under your `DATA_DIR` if you changed it)
   - systemd: `journalctl -u <service name>` (add `--user` for a user service)
2. Open the server in your browser, register, and enter the code. That first account becomes the **owner**. Passwords are 8 to 128 characters long and can't be one of the most common passwords.
3. The code changes every time the server restarts, and it stops mattering as soon as the owner exists.

Registration allows 2 attempts per minute from one address, whatever the reason an attempt fails (wrong code, a password that is too common, and so on). A third attempt within a minute blocks that address for 5 minutes. Going over a sign-in or registration limit again from that address afterwards, even much later, blocks it permanently. While the server has no owner, nobody can lift a block from the admin panel. Copy the code carefully and wait a minute between attempts. If you do get blocked, wait out the 5 minutes, or connect from a different address. If the block has become permanent, stop the server, run `sqlite3 data/hako.db "DELETE FROM ip_bans WHERE ip='<your IP>';"`, and start it again.

**Versions before B2.6.64** (including B2.6.62 and B2.6.63) have no setup code: the first account to register becomes the owner, so create it before anyone else can reach the server. Passwords there need at least 6 characters with letters and numbers.

---

## Security reminders

- Create the owner account right away, before you share the address.
- Under **Settings → Registration**, choose **Invite Only** or **Closed** if the server is not meant to be public.
- If a reverse proxy or load balancer connects from any address other than `127.0.0.1` or `::1` — another machine, another container, or the host of a Docker container with published ports — set `TRUSTED_PROXIES` to the proxy's address or range (and, if another proxy or CDN such as Cloudflare sits in front of it, that one's ranges too), or the server treats all members as one visitor. See [Known limitations](./KNOWN_LIMITATIONS.md).
- Appoint at least one admin you trust besides the owner, so the server isn't left unmanaged if one of you is unavailable. Back up regularly: **Settings → Dashboard → Backup**. Keep a copy off the server, and keep it secret — a backup contains your server's secrets.
- Keep the server updated. Docker: pull a new image. Binary: **Settings → Dashboard → Server Update** (on Windows, restart the server by hand after applying).

Read [Known limitations](./KNOWN_LIMITATIONS.md) to see where the protections stop. To report a security problem, see the [Security Policy](./SECURITY.md).

---

## Releases and tags

There are two channels: **stable** and **preview** (`-pre`). Version numbers look like `B2.6.62`; preview releases are tagged with `-pre`.

| Docker tag | Meaning |
|---|---|
| `:latest` | Newest stable release — the default |
| `:pre` | Newest preview. When a newer stable release comes out, `:pre` moves up to it too |
| `:B<x>.<y>.<z>` | A fixed stable version |
| `:B<x>.<y>.<z>-pre` | A fixed preview version; only the one `:pre` points to is kept |

A normal release never moves `:latest` or `:pre` to an older version. The old `:edge`, `:B<major>` and plain semver tags are no longer updated.

The binary picks its channel with the **Receive Pre-release Updates** setting in the admin panel (on = `:pre`, off = `:latest`). Moving from preview back to stable can be a downgrade: check that the newest stable release is not older than the version you run, because a newer version may already have changed your database.

Each release has its notes and checksums in [`releases/<version>/`](./releases) (the folder name has no `-pre`; check a preview against the `SHA256SUMS.txt` on its Release page).

---

## Verify downloads

Each release includes `SHA256SUMS.txt`. Put it in the same folder as the files you downloaded and run:

```bash
# Linux — checks only the files you have
sha256sum -c --ignore-missing SHA256SUMS.txt
```

```powershell
# Windows (PowerShell) — compare the result to the matching line in SHA256SUMS.txt
Get-FileHash .\server-hakospace-windows-amd64-<version>.exe -Algorithm SHA256
```

---

## License, legal, and contact

HakoSpace Community Edition is free for academic research and teaching, personal non-commercial use, and qualifying non-profit organizations. Use by businesses, commercial entities, or government agencies — or providing HakoSpace as part of a commercial service — requires a commercial license. The full terms are in [LICENSE](./LICENSE) and [EULA.md](./EULA.md).

- [LICENSE](./LICENSE) · [EULA.md](./EULA.md) · [PRIVACY.md](./PRIVACY.md) · [THIRD_PARTY_NOTICES](./THIRD_PARTY_NOTICES)
- [SECURITY.md](./SECURITY.md) — how to report a security problem
- [KNOWN_LIMITATIONS.md](./KNOWN_LIMITATIONS.md) — where the protections stop, and what you can do

Contact: hsun@hakospace.com

---

## About this repository

This repository holds the public release files for HakoSpace: release notes, checksums, the Dockerfile, and a sample `docker-compose.yml`. The binaries are on the [Releases](https://github.com/HakoSpace/HakoSpace-releases/releases) page. It does not contain source code. How the repository is organized is in [REPO_POLICY.md](./REPO_POLICY.md).

*Copyright (c) 2026 HakoSpace. All rights reserved.*
