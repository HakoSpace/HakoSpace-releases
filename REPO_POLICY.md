# Repository Policy — HakoSpace-releases

This repository hosts the public release artifacts for **HakoSpace**. It does **not** contain source code. The HakoSpace product is developed in a separate, private repository; only built binaries, checksums, and release metadata are published here.

---

## Purpose

| Path | Purpose |
|------|---------|
| `releases/<version>/` | Per-version metadata: changelog, SHA-256 checksums, electron-updater manifest |
| `README.md` | User-facing product overview and hosting guide |
| `EULA.md`, `PRIVACY.md`, `LICENSE` | Legal documents linked from the product UI and frontend |
| `.github/ISSUE_TEMPLATE/` | Public bug report and feature request templates |

GitHub Releases (under the **Releases** tab) host the actual downloadable binaries. The `releases/<version>/` directories in git only hold the small text-based metadata files that accompany each release.

---

## Retention Policy

Only the latest version is kept in `releases/`. When a new version is published:

1. The previous `releases/<version>/` directory is removed in the same commit that adds the new one.
2. Older GitHub Releases (under the **Releases** tab) are also pruned by the publishing pipeline.
3. Historical metadata remains accessible through git history (`git log -- releases/`).

This keeps the repository small and avoids confusion about which version is current.

---

## Versioning

Versions follow the form `B<major>.<minor>.<patch>` (Beta) or `V<major>.<minor>.<patch>` (stable).

- `B` = Beta, `V` = stable release.
- Pre-release tags carry a `-pre` suffix (e.g. `B2.6.0-pre`); promoted stable releases drop the suffix.

The same numeric component maps to standard semver internally (e.g. `B2.6.0` ↔ `2.6.0`).

---

## Artifact Naming

Every release publishes the following assets to GitHub Releases:

| Artifact | Filename pattern |
|----------|------------------|
| Server (Linux) | `server-hakospace-linux-amd64-<version>` |
| Server (Windows) | `server-hakospace-windows-amd64-<version>.exe` |
| Desktop (Linux) | `desktop-hakospace-linux-amd64-<version>.AppImage` |
| Desktop (Windows, installer) | `desktop-hakospace-windows-amd64-setup-<version>.exe` |
| Desktop (Windows, portable) | `desktop-hakospace-windows-amd64-portable-<version>.exe` |
| Checksums | `SHA256SUMS.txt` |
| Auto-update manifest | `latest.yml` |
| Changelog | `CHANGELOG.md` |

Pattern: `{product}-hakospace-{os}-{arch}[-{variant}]-<version>[.{ext}]`

---

## Metadata Files (in git)

Each `releases/<version>/` directory contains three text files that are tracked in git:

- **`CHANGELOG.md`** — Release notes generated from the source repository's git log.
- **`SHA256SUMS.txt`** — SHA-256 checksums for every binary asset. Users should verify downloads against this file.
- **`latest.yml`** — Auto-update manifest consumed by the Electron desktop client.

Binaries themselves are **never committed to git** — they live only on GitHub Releases. The `.gitignore` enforces this.

---

## Verifying Downloads

```bash
# Linux
sha256sum -c SHA256SUMS.txt

# Windows (PowerShell)
Get-FileHash .\server-hakospace-windows-amd64-<version>.exe -Algorithm SHA256
```

Compare the output to the corresponding line in `SHA256SUMS.txt`.

---

## Issue Tracking

Bug reports and feature requests are accepted via [GitHub Issues](https://github.com/HakoSpace/HakoSpace-releases/issues). Use the provided templates.

Source-code-level issues are triaged internally; please do not assume publicly visible issues correspond directly to internal tickets.

---

## Contact

hsun@hakospace.com
