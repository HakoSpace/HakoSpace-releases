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

Releases involve three categories of assets with different retention rules.

### GitHub Release page (binary)

- Only the latest patch within each major version is kept (e.g. `B1.2.4` supersedes `B1.2.3`).
- Cross-major releases coexist (e.g. `B1.6.4` and `B2.1.1`).
- The publishing pipeline (`release.sh --cleanup-prev`) handles binary pruning automatically.

### Git-tracked metadata (**permanently retained**)

Any `.md` / `.yml` / `.txt` file under `releases/<version>/` is permanent metadata. Canonical examples:

- `releases/<version>/CHANGELOG.md` — release notes
- `releases/<version>/latest.yml` — electron-updater Windows manifest (only when a Windows desktop build is included; `latest-mac.yml` / `latest-linux.yml` follow the same rule when those platforms are built)
- `releases/<version>/SHA256SUMS.txt` — checksum file

These are the only textual record of each release's history. They are kept indefinitely so users can verify checksums and inspect changelogs for any past version.

**Never** `rm -rf releases/<version>/` or `git rm releases/<version>/`. A pre-commit hook (see Maintenance below) blocks accidental deletion of any tracked metadata in this category.

### Local binaries (cleanable, but use the tool)

- `releases/<version>/*.AppImage`, `desktop-*.exe`, `server-hakospace-*`
- These accumulate locally (~350 MB per release) but are **not** tracked by git (`.gitignore` enforces this).
- Use `cleanup-binaries.sh` to clean them — see Maintenance below. Do **not** `rm -rf releases/<version>/`.

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

## Maintenance

Tools for maintainers of this repository (not relevant to end users).

### Clean local binaries

Local `releases/<version>/` directories accumulate binaries (~350 MB per release). To reclaim space safely:

```bash
./cleanup-binaries.sh              # dry-run, shows what would be deleted
./cleanup-binaries.sh --apply      # actually delete
./cleanup-binaries.sh --keep B2.6.3 --keep B2.6.2 --apply
                                   # keep binaries for specified versions
```

Only matches binary patterns (`*.AppImage`, `desktop-*.exe`, `server-hakospace-*`). Metadata (`*.md`, `*.yml`, `*.txt`) is never touched.

### Pre-commit hook (prevent metadata deletion)

After the first `git clone`, install the hook once:

```bash
bash scripts/install-hooks.sh
```

After installation, any commit that stages a deletion of `releases/<ver>/CHANGELOG.md` / `latest.yml` / `SHA256SUMS.txt` is rejected. This is the primary defense against the kind of cleanup mistake that previously caused metadata loss.

Emergency override (when removal is genuinely intended):

```bash
ALLOW_METADATA_DELETE=1 git commit ...
```

---

## Issue Tracking

Bug reports and feature requests are accepted via [GitHub Issues](https://github.com/HakoSpace/HakoSpace-releases/issues). Use the provided templates.

Source-code-level issues are triaged internally; please do not assume publicly visible issues correspond directly to internal tickets.

---

## Contact

hsun@hakospace.com
