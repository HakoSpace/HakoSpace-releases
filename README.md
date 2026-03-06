# HakoSpace

**Your server. Your rules. Your conversations.**

*自架伺服器的私密通訊平台，完整掌控你的資料與隱私。*

🌐 **Official Website: [hakospace.com](https://hakospace.com)**

---

## What is HakoSpace?

HakoSpace is a self-hosted chat platform that gives you everything Discord does, without giving your data to anyone else. It ships as a single binary with no external dependencies — drop it on a Linux server, run it, and you're done. Full real-time messaging, voice and video, an AI agent, and a desktop app, all under your control.

---

## Features

### 💬 Real-time Messaging

- Organized channels with threaded conversations
- Direct messages and group DMs
- Message reactions and rich file sharing
- Automatic URL previews and link embeds

### 🎙 Voice & Video

- WebRTC SFU architecture for low-latency voice and video calls
- Screen sharing with full desktop or per-window capture
- Per-application audio capture on Linux (capture one app, not everything)

### AI Agent

- Multi-provider support: Anthropic Claude, OpenAI GPT, Google Gemini
- Tool calling for real actions, not just chat responses
- Server management capabilities through the agent interface

### Desktop App

- Electron-based client for Windows and Linux
- Connect to multiple HakoSpace servers from one app
- Encrypted token storage for secure credential management
- Per-application audio capture support on Linux

### Administration

- Role system: owner, admin, and member tiers
- Audit logs for server activity
- IP bans and invite code management
- Built-in backup tooling

### Self-Hosted & Private

- Single binary deployment, no containers required
- SQLite database, zero external dependencies
- No telemetry by default — your data stays on your machine
- A genuine privacy-first Discord alternative

---

## Quick Start

Download the latest binary from [GitHub Releases](https://github.com/HakoSpace/HakoSpace-releases/releases), run it, and open `http://localhost:8080`. The first user to register becomes the server owner.

For a full walkthrough covering TLS, systemd, backups, and Windows deployment, see the [Hosting Guide](#hosting-guide) below.

---

## Hosting Guide

This guide covers everything you need to run HakoSpace on your own server.

### System Requirements

| | Minimum |
|---|---|
| OS | Linux amd64 or Windows amd64 |
| RAM | 512 MB |
| Disk | Depends on usage (messages + uploads stored in `data/`) |
| Domain | Optional, required only for TLS |

### Step 1: Download

Grab the latest release from [GitHub Releases](https://github.com/HakoSpace/HakoSpace-releases/releases).

- Linux: `hako`
- Windows: `hako.exe`

On Linux, make the binary executable:

```bash
chmod +x hako
```

### Step 2: First Run

```bash
./hako
```

On first run, HakoSpace creates the `data/` directory and auto-generates `data/.env` with a secure random `JWT_SECRET`. You don't need to create this file yourself.

> **Note:** `data/.env` is generated automatically on first run. Edit it after the first launch to add custom configuration.
>
> **備註：** `data/.env` 會在首次啟動時自動產生，包含隨機生成的 `JWT_SECRET`。首次啟動後再編輯此檔案以調整設定。

### Step 3: Register the Owner Account

Open `http://localhost:8080` in your browser. The first user to register on the server automatically becomes the Owner. Do this before sharing the server URL with anyone else.

> **Important:** Register your owner account immediately after first launch.
>
> **重要：** 請在分享伺服器連結前，立即完成擁有者帳號的註冊。

### TLS Setup

**Option A: Let's Encrypt (recommended)**

Set `ACME_DOMAIN` in `data/.env` and HakoSpace handles certificate provisioning automatically. Your server must be reachable on port 443 from the internet for ACME validation.

```env
ACME_DOMAIN=chat.yourdomain.com
```

Then restart the server. HTTPS will be available on port 8443.

**Option B: Manual certificate**

Place your certificate and key files in `data/` and set the paths in `data/.env`:

```env
TLS_CERT=/path/to/cert.pem
TLS_KEY=/path/to/key.pem
```

### Firewall

Open these ports depending on your setup:

| Port | Protocol | Purpose |
|------|----------|---------|
| 8080 | TCP | HTTP (plain) |
| 8443 | TCP | HTTPS (TLS) |

If you're using a reverse proxy (nginx, Caddy), you only need to expose 80/443 on the proxy and keep HakoSpace on its default ports internally.

### Running as a systemd Service (Linux)

Create `/etc/systemd/system/hakospace.service`:

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

Enable and start:

```bash
sudo systemctl daemon-reload
sudo systemctl enable hakospace
sudo systemctl start hakospace
sudo systemctl status hakospace
```

> **Tip:** Create a dedicated `hako` system user and place the binary in `/opt/hakospace/`. The `data/` directory will be created there on first run.

### Windows Deployment

Run `hako.exe` from a Command Prompt or PowerShell window, not by double-clicking. Double-clicking will open and immediately close the console window if there's an error.

```cmd
cd C:\hakospace
hako.exe
```

For unattended startup, create a `.bat` file:

```bat
@echo off
cd /d C:\hakospace
hako.exe
```

Then add it to Task Scheduler to run at system startup. Set the action to run the `.bat` file with "Start in" set to `C:\hakospace`.

### Backup

The admin panel includes a built-in backup tool under Settings. It exports a snapshot of your server data.

For manual backups, copy the entire `data/` directory while the server is stopped:

```bash
sudo systemctl stop hakospace
cp -r /opt/hakospace/data /backup/hakospace-$(date +%Y%m%d)
sudo systemctl start hakospace
```

The `data/` directory contains:

- `hako.db` — SQLite database (all messages, users, channels)
- `uploads/` — uploaded files
- `.env` — your configuration
- TLS certificates (if using manual certs)

### Updating

1. Stop the server
2. Replace the `hako` binary with the new version
3. Start the server

```bash
sudo systemctl stop hakospace
cp hako-new /opt/hakospace/hako
sudo systemctl start hakospace
```

The `data/` directory is never touched during an update. Your database, uploads, and configuration are preserved.

### 簡要中文部署指南

以下為部署流程的中文摘要，詳細步驟請參閱上方英文說明。

1. **下載** — 從 [GitHub Releases](https://github.com/HakoSpace/HakoSpace-releases/releases) 下載對應平台的執行檔（Linux: `hako`，Windows: `hako.exe`）。
2. **首次啟動** — 執行後，`data/.env` 會自動產生，包含隨機 `JWT_SECRET`，無需手動建立。
3. **註冊擁有者** — 開啟 `http://localhost:8080`，第一個註冊的使用者自動成為伺服器擁有者。
4. **TLS 設定** — 在 `data/.env` 中設定 `ACME_DOMAIN` 即可啟用 Let's Encrypt 自動憑證。
5. **防火牆** — 開放 8080（HTTP）與 8443（HTTPS）埠。
6. **系統服務** — Linux 建議使用 systemd 管理服務，Windows 可透過工作排程器設定開機自動執行。
7. **備份** — 管理後台內建備份工具，或直接複製 `data/` 目錄。
8. **更新** — 停止服務、替換執行檔、重新啟動，`data/` 目錄完整保留。

---

## Desktop App

Download the desktop client from [GitHub Releases](https://github.com/HakoSpace/HakoSpace-releases/releases):

- **Windows**: `.exe` installer
- **Linux**: `.AppImage`

The desktop app connects to any HakoSpace server. Add multiple servers and switch between them from a single window.

> **Note**: During the Beta phase, desktop binaries are not code-signed. Windows may display an "Unknown Publisher" warning on installation. This is expected and does not indicate a security issue. To verify file integrity, check the SHA-256 checksums published on the [Releases](https://github.com/HakoSpace/HakoSpace-releases/releases) page. Alternatively, you can use the web frontend directly via your browser — no installation required.
>
> **備註**：Beta 階段桌面版安裝檔尚未進行程式碼簽章，Windows 安裝時可能出現「不明發行者」警告。這屬正常現象，不代表安全問題。如有疑慮，請至 [Releases](https://github.com/HakoSpace/HakoSpace-releases/releases) 頁面核對 SHA-256 校驗值，或直接透過瀏覽器使用網頁版前端。

---

## Configuration

All configuration is loaded from `data/.env` on startup. This file is auto-generated on first run — you don't need to create it manually. Edit it after the first launch to customize your setup.

| Variable | Description | Default |
|---|---|---|
| `PORT` | HTTP port | `8080` |
| `TLS_PORT` | HTTPS port | `8443` |
| `JWT_SECRET` | Secret key for auth tokens | auto-generated |
| `ACME_DOMAIN` | Domain for Let's Encrypt TLS | *(disabled)* |
| `AI_ENABLED` | Enable the AI agent | `false` |
| `AI_PROVIDER` | Provider: `claude`, `openai`, `gemini` | `claude` |
| `AI_API_KEY` | API key for the selected provider | *(required if enabled)* |

### Email Verification (optional)

HakoSpace can require email verification for new user registration. Configure an email provider in `data/.env`, then set the registration mode to **Email Verification** in the admin panel (Settings > Registration).

Three provider options are available:

**Option A — Gmail** (simplest, everyone has one)

Use a Gmail account with a [Google App Password](https://myaccount.google.com/apppasswords) (requires 2-Step Verification on the Google account).

```env
MAIL_PROVIDER=gmail
MAIL_USER=you@gmail.com
MAIL_PASS=xxxx-xxxx-xxxx-xxxx    # Google App Password
BASE_URL=https://your-domain.com
```

**Option B — Resend** (developer-friendly transactional email)

Sign up at [resend.com](https://resend.com), verify your domain, and create an API key.

```env
MAIL_PROVIDER=resend
MAIL_PASS=re_xxxxxxxxxx           # Resend API key
MAIL_FROM=no-reply@yourdomain.com
BASE_URL=https://your-domain.com
```

**Option C — Custom SMTP** (Mailgun, SendGrid, etc.)

Use any SMTP server. Port 587 (STARTTLS) and port 465 (implicit TLS) are both supported.

```env
MAIL_PROVIDER=smtp
SMTP_HOST=smtp.mailgun.org
SMTP_PORT=587
MAIL_USER=postmaster@yourdomain.com
MAIL_PASS=your-password
MAIL_FROM=no-reply@yourdomain.com
BASE_URL=https://your-domain.com
```

| Variable | Description | Default |
|---|---|---|
| `MAIL_PROVIDER` | `gmail`, `resend`, or `smtp` (leave empty to disable) | *(disabled)* |
| `MAIL_USER` | SMTP username (Gmail: your email; Resend: not needed) | — |
| `MAIL_PASS` | SMTP password / App Password / API key | — |
| `MAIL_FROM` | Sender address shown in emails | `MAIL_USER` |
| `MAIL_FROM_NAME` | Sender display name | `HakoSpace` |
| `SMTP_HOST` | SMTP server hostname (only for `smtp` provider) | — |
| `SMTP_PORT` | SMTP server port (only for `smtp` provider) | `587` |
| `BASE_URL` | Public URL of your server (used in verification links) | — |

After configuring, go to **Settings > Registration** and change the mode to **Email Verification**. You can also enable **Password Change Verification** to require email confirmation when users change their password.

設定完成後，前往**設定 > 註冊**，將註冊模式改為**Email 驗證**。亦可開啟**密碼變更驗證**，要求使用者變更密碼時需透過信箱確認。

Environment variables set at runtime take precedence over values in `data/.env`.

---

## Editions

HakoSpace ships in three editions. All new features debut on Community Edition first. Community feedback shapes what gets built and in what order. Once features are mature and battle-tested, advanced management and enterprise capabilities may become PRO or MAX exclusive.

Upgrading is instant: enter a license key in server settings and your edition unlocks immediately. No reinstall, no migration, no downtime.

### Community Edition (社群版) — Current

Free to use for:

- Academic and research use
- Personal, non-commercial projects
- Qualifying non-profit organizations

Government agencies and all commercial deployments require a paid license.

### PRO and MAX — Coming Soon

PRO and MAX editions are coming. They will add advanced administration tools, priority support, and capabilities suited to teams and organizations running HakoSpace at scale.

The exact feature split between PRO and MAX is still being defined based on community feedback. The table below reflects current thinking and will be updated as editions launch.

### Edition Comparison

| Feature | Community | PRO | MAX |
|---|:---:|:---:|:---:|
| Core messaging, voice, and video | ✓ | ✓ | ✓ |
| AI Agent | ✓ | ✓ | ✓ |
| Self-hosted single binary | ✓ | ✓ | ✓ |
| Backup and restore | ✓ | ✓ | ✓ |
| Advanced admin tools | — | *planned* | *planned* |
| Priority support | — | *planned* | *planned* |
| Multi-server management | — | — | *planned* |
| Commercial use license | — | *planned* | *planned* |

### Roadmap Philosophy

Community Edition is not a stripped-down trial. It's the full product. Every feature ships to Community first. PRO and MAX exist to fund continued development and to serve organizations that need enterprise-grade support and management tooling.

If you're using HakoSpace for personal or non-commercial purposes, Community Edition is all you need.

---

## Legal

- [LICENSE](./LICENSE) — License terms for the Community Edition
- [EULA.md](./EULA.md) — End User License Agreement
- [PRIVACY.md](./PRIVACY.md) — Privacy policy and data handling

---

## Contact

hsun@hakospace.com

---

*Copyright (c) 2026 HakoSpace. All rights reserved.*
