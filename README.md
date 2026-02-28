# HakoSpace

**Your server. Your rules. Your conversations.**

*自架伺服器的私密通訊平台，完整掌控你的資料與隱私。*

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

### System Requirements

- Linux (amd64)
- 512 MB RAM minimum
- A domain name (optional, for TLS)

### Run the Server

Download the latest `hako` binary from [GitHub Releases](https://github.com/HakoSpace/HakoSpace-releases/releases).

```bash
chmod +x hako
./hako
```

Open your browser at `http://localhost:8080`. The first user to register becomes the server owner.

### TLS with Let's Encrypt

Set the `ACME_DOMAIN` environment variable to your domain and HakoSpace will handle certificate provisioning automatically via ACME/Let's Encrypt.

```bash
ACME_DOMAIN=chat.yourdomain.com ./hako
```

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

All configuration is loaded from `data/.env` on startup. Key variables:

| Variable | Description | Default |
|---|---|---|
| `PORT` | HTTP port | `8080` |
| `TLS_PORT` | HTTPS port | `8443` |
| `JWT_SECRET` | Secret key for auth tokens | auto-generated |
| `ACME_DOMAIN` | Domain for Let's Encrypt TLS | *(disabled)* |
| `AI_ENABLED` | Enable the AI agent | `false` |
| `AI_PROVIDER` | Provider: `claude`, `openai`, `gemini` | `claude` |
| `AI_API_KEY` | API key for the selected provider | *(required if enabled)* |

Create `data/.env` before first run to set persistent configuration. Environment variables set at runtime take precedence.

---

## Editions

### Community Edition (Current)

Free to use for:

- Academic and research use
- Personal, non-commercial projects
- Qualifying non-profit organizations

### PRO / MAX

Coming soon. Expanded limits, priority support, and additional features for teams and businesses.

### Government & Enterprise

Government agencies and commercial deployments require a separate commercial license. Contact us to discuss your needs.

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
