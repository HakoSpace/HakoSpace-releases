# HakoSpace

**Your server. Your rules. Your conversations.**

HakoSpace is a self-hosted platform for real-time text, voice, and video chat — you own the server, the data, and the rules. It runs anywhere you do, with nothing sent to a third-party backend.

🌐 **Website: [hakospace.com](https://hakospace.com)**

---

## What is HakoSpace?

HakoSpace gives a community everything a modern chat platform should — organized text channels, low-latency voice and video, direct messages, screen sharing, an AI agent, and a desktop app — while keeping all of it on infrastructure you control. Your messages, files, and members live only on your server.

Deploy it in a single command with the official **Docker image (recommended)**, or run it as a **single self-contained binary**. Either way there are no external services to wire up — the database, frontend, and TLS are all built in. It's a genuine privacy-first alternative to hosted chat services.

---

## Features

### 💬 Real-time Messaging

- Organized channels with threaded conversations
- Direct messages and group DMs
- Message reactions and rich file sharing
- Automatic URL previews and link embeds

### 🎙 Voice & Video

- Low-latency group voice and video calls
- Screen sharing with full-desktop or per-window capture
- Per-application audio capture on Linux (share one app's sound, not the whole system)

### 🤖 AI Agent

- Multi-provider: Anthropic Claude, OpenAI GPT, or Google Gemini
- Tool calling for real actions, not just chat replies
- Server-management tasks through a conversational interface

### 🖥 Desktop App

- Electron client for Windows and Linux
- Connect to multiple HakoSpace servers from one window
- Encrypted local token storage
- Per-application audio capture on Linux

### 🛠 Administration

- Three clear roles: owner, admin, and member
- Always-on audit log of administrative actions
- Invite codes, registration policies, IP bans, and a message word filter
- Built-in backup tooling

### 🔒 Self-Hosted & Private

- **Docker (recommended)** with an official multi-arch image, or a **single binary** — your choice
- Embedded SQLite database, zero external dependencies
- Telemetry is strictly opt-in — your data stays on your machine

---

## Quick Start

The fastest way to run HakoSpace is the official Docker image:

```bash
docker run -d --name hako \
  -p 8080:8080 \
  -v hako-data:/app/data \
  ghcr.io/hakospace/hako:edge
```

Open `http://localhost:8080` — the first account to register becomes the server **owner**.

Prefer a plain executable? Download the latest binary from [GitHub Releases](https://github.com/HakoSpace/HakoSpace-releases/releases), run it, and open the same URL.

For a full walkthrough — TLS, firewall, running as a service, backups, and going live safely — see the [Hosting Guide](#hosting-guide) below.

> **Beta channel:** the rolling `:latest` tag ships with the first stable (`V`) release. While HakoSpace is in beta, use **`:edge`** (the newest pre-release) as shown above.

---

## Hosting Guide

Everything you need to run HakoSpace in production. **Docker is the recommended path** — it's the simplest to install, runs natively on both x86-64 and ARM, and updates with a single `docker pull`. A standalone binary is fully supported as an alternative if you'd rather not use containers.

### Deploy with Docker (recommended)

The official image is published to GitHub Container Registry at `ghcr.io/hakospace/hako` as a **multi-arch** image. `docker pull` automatically selects your CPU architecture, so it runs natively on x86-64 servers and on ARM (Raspberry Pi, ARM VPS, Apple Silicon under Docker Desktop).

```bash
docker run -d --name hako \
  -p 8080:8080 \
  -v hako-data:/app/data \
  ghcr.io/hakospace/hako:edge
```

Then open `http://localhost:8080` — the first account to register becomes the owner.

Or with Docker Compose (`docker-compose.yml`):

```yaml
services:
  hako:
    image: ghcr.io/hakospace/hako:edge
    ports:
      - "8080:8080"
    environment:
      - TLS_AUTO=false        # serve plain HTTP; terminate TLS at a reverse proxy
    volumes:
      - hako-data:/app/data
    restart: unless-stopped

volumes:
  hako-data:
```

#### Image tags

| Tag | Meaning |
|---|---|
| `:edge` | Newest pre-release — **use this during beta** |
| `:latest` | Newest stable release (available once the first `V` release ships) |
| `:B<major>` | Track a major line, e.g. `:B2` (stable) |
| `:B<x>.<y>.<z>` | Pin an exact version, e.g. `:B2.6.9` |

Pre-releases can also be pinned exactly with the `-pre` suffix, e.g. `:B2.6.9-pre`.

#### Data and backups

Everything — the SQLite database, TLS certificates, and the auto-generated `JWT_SECRET` — lives in the `hako-data` named volume. Back it up by archiving the volume:

```bash
docker run --rm -v hako-data:/d -v "$PWD":/b busybox \
  tar czf /b/hako-backup.tgz -C /d .
```

#### Updating

Pull a new image and recreate the container:

```bash
docker pull ghcr.io/hakospace/hako:edge && docker compose up -d
```

Containers update by image pull, so the admin panel's in-app self-update is turned off inside a container (an image is immutable). To automate pulls, use a tool such as [Watchtower](https://containrrr.dev/watchtower/).

#### TLS

The container serves plain HTTP on port 8080. For HTTPS you have two options:

- **Reverse proxy (recommended):** put Caddy, nginx, or Traefik in front and let it terminate TLS.
- **Built-in ACME:** set `TLS_AUTO=true` and `ACME_DOMAIN=your.domain`, and publish ports 80 and 443:

  ```bash
  docker run -d --name hako \
    -p 80:8080 -p 443:8443 \
    -e TLS_AUTO=true -e ACME_DOMAIN=chat.yourdomain.com \
    -v hako-data:/app/data \
    ghcr.io/hakospace/hako:edge
  ```

  HakoSpace then requests and renews a Let's Encrypt certificate automatically.

Prefer a standalone binary instead? Continue below.

### Deploy as a binary (alternative)

#### System Requirements

| | Minimum |
|---|---|
| OS | Linux amd64 or Windows amd64 (the Docker image additionally supports arm64) |
| RAM | 512 MB |
| Disk | Depends on usage — messages and uploads are stored under `data/` |
| Domain | Optional, needed only for a publicly trusted TLS certificate |

#### Step 1 — Download

Grab the latest server binary from [GitHub Releases](https://github.com/HakoSpace/HakoSpace-releases/releases):

- Linux: `server-hakospace-linux-amd64-<version>`
- Windows: `server-hakospace-windows-amd64-<version>.exe`

Verify it against `SHA256SUMS.txt`, then rename it to `hako` (Linux) or `hako.exe` (Windows) — the rest of this guide assumes that name. Renaming is safe and does not affect future updates; the server always locates its own executable when it updates.

```bash
# Linux
mv server-hakospace-linux-amd64-* hako
chmod +x hako
```

```cmd
:: Windows
ren server-hakospace-windows-amd64-*.exe hako.exe
```

#### Step 2 — First Run

```bash
./hako
```

On Windows, run `hako.exe` from PowerShell or Command Prompt rather than double-clicking, so you can read the startup log.

On the first run, HakoSpace:

- creates the `data/` directory next to the binary,
- generates `data/.env` with a secure random `JWT_SECRET`, and
- starts listening on port 8080 (HTTP) and 8443 (HTTPS).

You don't need to edit any configuration to get started. (To use ACME later, stop the server, add `ACME_DOMAIN` to `data/.env`, and start it again — see [TLS Setup](#tls-setup-binary).)

#### Step 3 — Register the Owner

Open `http://localhost:8080` and register the first account — it is automatically promoted to **owner**. Do this immediately, before sharing the URL with anyone else.

On their first login, the owner is asked to accept the EULA and to choose whether to share anonymous telemetry (opt-in or decline). These prompts appear only once.

#### TLS Setup (binary)

HakoSpace chooses a TLS mode at startup based on what you've set in `data/.env`:

| Mode | How to enable | Result |
|---|---|---|
| **ACME / Let's Encrypt** (recommended) | `ACME_DOMAIN=your.domain.com` | Certificate requested and auto-renewed; cached in `data/certs/` |
| Manual certificate | `TLS_CERT=/path` and `TLS_KEY=/path` | Uses your own certificate files |
| Plain HTTP | `TLS_AUTO=false` | No TLS — for an internal network or behind a proxy |
| Self-signed (default) | none of the above | A self-signed certificate is generated so HTTPS works out of the box; browsers show a trust warning |

For a public server, ACME is the right choice. Point your domain's DNS at the server's public IP, add `ACME_DOMAIN` to `data/.env`, and restart. HTTPS is then served on port 8443.

```env
ACME_DOMAIN=chat.yourdomain.com
```

#### Firewall and Ports

| Port | Purpose |
|---|---|
| 8080 / TCP | HTTP |
| 8443 / TCP | HTTPS |

Open 8080 and 8443 to the internet so members can reach the server. For ACME on a home network, forward external **443 → 8443** (required — serves HTTPS and TLS-ALPN-01 validation) and, ideally, external **80 → 8080** as well (lets the HTTP-01 challenge succeed too). Behind a reverse proxy you only need to expose 80/443 on the proxy and keep HakoSpace on its default ports internally.

#### Run as a Service

Keeping the server running across reboots and restarting it on failure is strongly recommended for any always-on deployment.

**Linux (systemd)** — create `/etc/systemd/system/hakospace.service`:

```ini
[Unit]
Description=HakoSpace Server
After=network.target

[Service]
Type=simple
User=hako
WorkingDirectory=/opt/hakospace
ExecStart=/opt/hakospace/hako
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
```

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now hakospace
sudo systemctl status hakospace
```

Day-to-day control:

```bash
sudo systemctl stop|start|restart hakospace   # control the service
journalctl -u hakospace -f                    # follow the logs
```

> **Tip:** create a dedicated `hako` system user and place the binary in `/opt/hakospace/`. The `data/` directory is created there on first run.

**Windows (Task Scheduler)** — create a `start.bat`:

```bat
@echo off
cd /d C:\hakospace
hako.exe
```

Then add a Task Scheduler task that runs `start.bat` at system startup, with "Start in" set to `C:\hakospace`.

#### Updating (binary)

HakoSpace updates itself from the admin panel. Under **Settings → Dashboard → Server Update**, click **Check for Update**; when a newer version exists, the server downloads it, verifies it, replaces its own executable, and restarts — no SSH required. Under systemd, the service comes straight back up on the new version.

To update manually (for example, to pin a specific version), stop the server, replace the `hako` binary, and start it again. The `data/` directory is preserved across updates.

```bash
sudo systemctl stop hakospace
cp hako-new /opt/hakospace/hako
sudo systemctl start hakospace
```

### Backups

Whether you run Docker or a binary, all server state lives in one place — the `data/` directory (or the `hako-data` volume), which holds the database, uploads, configuration, and certificates.

The admin panel has a built-in backup tool: **Settings → Dashboard → Backup → Create Backup** packages your data into a timestamped archive you can list, download, and delete. Recommended baseline:

1. **Back up on a schedule** — at least weekly.
2. **Keep a copy off the server** — download backups to cloud storage or another machine; a backup that lives only on the same disk is lost with it.
3. **Always back up before upgrading.**

---

## Security Checklist

Run through this before opening your server to members. Each item is a built-in feature; full details are in the **Admin Manual**.

1. **Set a registration policy.** New servers are open to anyone by default. Under **Settings → Registration**, switch to **Invite-only** for a private community, or **Email Verification** for a public one (this option appears once an email provider is configured — see the next item).
2. **Configure an email provider.** Under **Settings → Email Proxy**, set up **Gmail** (with a Google App Password), **Resend**, or any **SMTP** server. This enables email-verified registration and password-reset mail. Send the built-in test message to confirm it works.
3. **Review the audit log.** Every administrative action — role changes, setting edits, bans — is recorded automatically under **Settings → Audit Log**. Check it periodically.
4. **Turn on the word filter.** A default banned-word list ships seeded but disabled; enable it under **Settings → Banned Words** and tune it to your community, choosing to replace or block matching messages.
5. **Appoint at least two admins.** The owner is a single point of failure. Promote a trusted member to `admin` under **Settings → Members** so the server is never left unmanaged.
6. **Establish a backup routine** — see [Backups](#backups) above.

---

## Desktop App

Download the desktop client from [GitHub Releases](https://github.com/HakoSpace/HakoSpace-releases/releases):

- **Windows:** `.exe` installer
- **Linux:** `.AppImage`

The desktop app connects to any HakoSpace server. Add multiple servers and switch between them from a single window.

> **Note:** during Beta, desktop builds are not yet code-signed, so Windows may show an "Unknown Publisher" warning on install. This is expected. To confirm integrity, check the SHA-256 checksums on the [Releases](https://github.com/HakoSpace/HakoSpace-releases/releases) page. You can also just use the web client in your browser — no installation required.

---

## Configuration

HakoSpace reads its configuration from `data/.env`, which is generated automatically on first run. For most deployments the defaults are correct, and the only values you may need to set are the TLS variables described above (`ACME_DOMAIN`, `TLS_CERT` / `TLS_KEY`, `TLS_AUTO`).

- `JWT_SECRET` secures login sessions. It is generated and managed for you — keep it secret and include it in your backups.
- `OWNER_USERNAME` is an optional recovery hatch: set it to an existing account name to promote that account to owner on its next login. Left unset, the first account to register becomes owner.

Everything else — email, the AI agent, registration, and the word filter — is configured from the admin panel. See the **Admin Manual** for the complete reference.

---

## License

HakoSpace is free to use during the Beta phase. For terms and conditions, see [LICENSE](./LICENSE) and [EULA.md](./EULA.md).

---

## Repository Maintenance

Maintainers of this repository should see [REPO_POLICY.md § Maintenance](./REPO_POLICY.md#maintenance) for cleanup tooling (`cleanup-binaries.sh`) and the pre-commit hook setup (`scripts/install-hooks.sh`) that guards against accidental metadata deletion.

---

## Legal

- [LICENSE](./LICENSE) — License terms
- [EULA.md](./EULA.md) — End User License Agreement
- [PRIVACY.md](./PRIVACY.md) — Privacy policy and data handling
- [REPO_POLICY.md](./REPO_POLICY.md) — How this repository is organized and what gets published

---

## Contact

hsun@hakospace.com

---

*Copyright (c) 2026 HakoSpace. All rights reserved.*
