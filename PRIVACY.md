# HakoSpace Privacy Policy

Copyright (c) 2026 HakoSpace

*Last updated: February 2026*

---

## 1. Introduction

HakoSpace is self-hosted software. This Privacy Policy describes how the **HakoSpace software itself** handles data. It does not govern any specific hosted instance, because we don't run one.

When you deploy HakoSpace, you are the one in control. The HakoSpace development team has no visibility into your server, your users, or your data.

---

## 2. Self-Hosted Architecture

This is the most important thing to understand about HakoSpace:

**We cannot access your data. Not because of policy, but because of architecture.**

- HakoSpace runs entirely on infrastructure you control
- The HakoSpace development team has no access to any data stored on self-hosted instances
- We cannot read, monitor, or retrieve messages, files, user accounts, or any other data from your server
- Each server instance is fully independent and isolated from every other instance
- There is no central HakoSpace cloud, no shared database, no telemetry pipeline

Your server is yours. We have no way in.

---

## 3. Data Stored by the Software

HakoSpace stores the following data locally on the server operator's infrastructure:

- **User accounts**: username, display name, password hash (bcrypt), avatar image
- **Messages and attachments**: all chat messages and uploaded files sent by users
- **Voice/video metadata**: call records (who called whom, duration). No recordings are made unless the operator explicitly configures external recording infrastructure
- **Server configuration**: settings, roles, permissions, channel structure
- **Audit logs**: moderation actions and administrative events

All of this data lives in a local SQLite database file and local file storage on the operator's machine. None of it is transmitted to HakoSpace.

---

## 4. Telemetry & Data Collection

**By default, HakoSpace does not phone home. No data leaves your server unless you explicitly opt in.**

On first launch, the server administrator is presented with a one-time prompt asking whether to participate in the **HakoSpace Improvement Program**. This is entirely voluntary.

- **If you decline** (or dismiss the prompt): zero outbound telemetry. The software behaves as a fully offline, self-contained system.
- **If you opt in**: the server periodically sends **anonymous, aggregate statistics** to HakoSpace. You may opt out at any time from the server settings panel.

### What is collected (opt-in only)

| Collected | NOT Collected |
|-----------|---------------|
| Total registered user count | Usernames, emails, passwords |
| Total channel count | Channel names or content |
| Message volume (daily / total count) | Message text or attachments |
| Peak concurrent voice users | IP addresses or geolocation |
| Server version, edition, OS, architecture | Hostnames or domain names |
| Server uptime (days since first launch) | Environment variables or secrets |

All collected data is numeric or categorical. No personally identifiable information (PII) is ever transmitted.

### Other outbound connections

1. **ACME / Let's Encrypt** — to obtain TLS certificates, if the operator enables this feature
2. **AI provider APIs** (Anthropic, OpenAI, Google, etc.) — only if the operator enables AI features and supplies their own API keys. These connections go directly from your server to the AI provider; HakoSpace is not in the middle.
3. **License verification** (PRO / MAX editions only) — periodic key validation with the HakoSpace license server. No user data is transmitted during verification.

---

## 5. Server Operator Responsibility

If you run a HakoSpace instance, you are the data controller for all user data on that instance.

- You are responsible for your own data protection obligations under applicable law
- You should inform your users about what data you collect and how you handle it
- You are responsible for backups, security, and access controls on your server
- HakoSpace provides the software; compliance is your responsibility

---

## 6. Desktop Application

The HakoSpace desktop application (Electron) connects only to server addresses you configure.

- Authentication tokens are stored locally using platform-native encryption (`safeStorage` API)
- No data is sent to HakoSpace servers
- The app has no built-in telemetry or crash reporting

---

## 7. Contact

For questions about this policy: hsun@hakospace.com

For questions about data on a specific HakoSpace instance, contact the operator of that instance.

---

---

# HakoSpace 隱私權政策

Copyright (c) 2026 HakoSpace

*最後更新：2026 年 2 月*

---

## 1. 前言

HakoSpace 是一套自架軟體。本隱私權政策說明 **HakoSpace 軟體本身**如何處理資料，並不適用於任何特定的架設實例，因為我們並未自行營運任何公開服務。

當您部署 HakoSpace 時，您就是掌控者。HakoSpace 開發團隊對您的伺服器、您的使用者及您的資料一無所知。

---

## 2. 自架架構

這是關於 HakoSpace 最重要的一件事：

**我們無法存取您的資料。這不是政策承諾，而是架構設計的必然結果。**

- HakoSpace 完全運行於您所控制的基礎設施上
- HakoSpace 開發團隊對任何自架實例中儲存的資料均無存取權限
- 我們無法讀取、監控或取得您伺服器上的訊息、檔案、使用者帳號或任何其他資料
- 每個伺服器實例完全獨立，彼此互相隔離
- 不存在任何中央 HakoSpace 雲端服務、共用資料庫或遙測管道

您的伺服器屬於您。我們沒有任何進入的途徑。

---

## 3. 軟體儲存的資料

HakoSpace 將以下資料儲存於伺服器營運者的基礎設施上：

- **使用者帳號**：使用者名稱、顯示名稱、密碼雜湊值（bcrypt）、頭像圖片
- **訊息與附件**：使用者傳送的所有聊天訊息及上傳的檔案
- **語音／視訊通話詮釋資料**：通話紀錄（通話雙方、通話時長）。除非營運者明確設定外部錄製基礎設施，否則不會產生任何錄音或錄影
- **伺服器設定**：設定值、身分組、權限、頻道結構
- **稽核日誌**：管理操作及行政事件紀錄

上述所有資料均儲存於營運者機器上的本地 SQLite 資料庫檔案及本地檔案儲存空間，不會傳輸至 HakoSpace。

---

## 4. 遙測與資料收集

**HakoSpace 預設不會向外回傳任何資料。除非您主動選擇加入，否則不會有任何資料離開您的伺服器。**

首次啟動時，伺服器管理員會看到一次性提示，詢問是否參加 **HakoSpace 改善計畫**。此為完全自願性質。

- **若您拒絕**（或略過提示）：零對外遙測。軟體將以完全離線、自給自足的方式運作。
- **若您選擇加入**：伺服器會定期傳送**匿名彙總統計資料**至 HakoSpace。您可隨時於伺服器設定面板中退出。

### 收集內容（僅限選擇加入）

| 收集項目 | 不收集項目 |
|----------|-----------|
| 註冊用戶總數 | 用戶名稱、信箱、密碼 |
| 頻道總數 | 頻道名稱或內容 |
| 訊息量（每日／總量） | 訊息文字或附件 |
| 語音同時在線峰值 | IP 位址或地理位置 |
| 伺服器版本、版本別、作業系統、架構 | 主機名稱或網域名稱 |
| 伺服器運行天數（首次啟動起算） | 環境變數或機敏資訊 |

所有收集的資料均為數值型或類別型。絕不傳輸任何個人可識別資訊（PII）。

### 其他對外連線

1. **ACME / Let's Encrypt** — 若營運者啟用此功能，用於取得 TLS 憑證
2. **AI 服務商 API**（Anthropic、OpenAI、Google 等）— 僅在營運者啟用 AI 功能並提供自有 API 金鑰時才會連線。這些連線直接從您的伺服器發往 AI 服務商，HakoSpace 不介入其中。
3. **授權驗證**（僅限 PRO / MAX 版本）— 定期與 HakoSpace 授權伺服器驗證金鑰。驗證過程不傳輸任何用戶資料。

---

## 5. 伺服器營運者的責任

若您架設 HakoSpace 實例，您即為該實例上所有使用者資料的資料控管者。

- 您須自行承擔依適用法律所產生的個人資料保護義務
- 您應告知您的使用者您所蒐集的資料及其處理方式
- 您須自行負責伺服器的備份、資安防護及存取控制
- HakoSpace 提供軟體；法規遵循責任由您承擔

---

## 6. 桌面應用程式

HakoSpace 桌面應用程式（Electron）僅連線至您所設定的伺服器位址。

- 身分驗證權杖使用平台原生加密機制（`safeStorage` API）儲存於本地
- 不會有任何資料傳送至 HakoSpace 伺服器
- 應用程式不內建任何遙測或當機回報功能

---

## 7. 聯絡方式

如對本政策有任何疑問，請聯絡：hsun@hakospace.com

如對特定 HakoSpace 實例上的資料有疑問，請聯絡該實例的營運者。
