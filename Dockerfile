# syntax=docker/dockerfile:1
# ============================================================
#  HakoSpace — official container image (Community Edition)
# ------------------------------------------------------------
#  Published to GHCR (ghcr.io/hakospace/hako) by
#  .github/workflows/docker-publish.yml. The recipe is mirrored
#  read-only into the public HakoSpace-releases repo for self-host
#  transparency, but the build context (server/ + frontend/) is the
#  PRIVATE source — outsiders consume the published image, not a
#  `docker build`.
#
#  Single-binary design preserved: CGO_ENABLED=1 (go-sqlite3) pins
#  the runtime to glibc, so there is intentionally NO alpine/musl
#  base — debian:bookworm-slim is the supported runtime.
#
#  Legal note: the EULA/Privacy clickwrap HTML is baked into the Go
#  binary via go:embed (server/legal/embed/<version>/). That tree is
#  .gitignored and populated at build time by scripts/sync-legal-embed.sh.
#  A `docker build` on a clean checkout that SKIPPED that sync ships an
#  EMPTY legal embed (clickwrap "read full text" → EMBED_NOT_FOUND).
#  build-docker.sh and docker-publish.yml therefore run the sync +
#  check-legal-drift.sh --strict BEFORE building — do NOT `docker build`
#  this file directly without that gate.
# ============================================================

# Stage 1: Build frontend
# NOTE: base images are pinned by digest below for reproducibility; the
# human-readable tag is kept on the line for readability. Refresh digests
# with `docker pull <image>:<tag> && docker inspect --format '{{index .RepoDigests 0}}' <image>:<tag>`.
FROM node:22-slim@sha256:7af03b14a13c8cdd38e45058fd957bf00a72bbe17feac43b1c15a689c029c732 AS frontend
WORKDIR /build/frontend
COPY frontend/package.json frontend/package-lock.json ./
RUN npm ci
COPY frontend/ ./
# vite.config.ts reads ../VERSION and ../PROTOCOL_VERSION (repo root = /build);
# they must exist before the build or `npm run build` throws.
COPY VERSION PROTOCOL_VERSION /build/
RUN npm run build

# Stage 2: Build backend
FROM golang:1.25-bookworm@sha256:a1ae6b6c564f3e0072d70081036827a2705dbcf6b38aaa6d97f5de97fe9abdb4 AS backend
RUN apt-get update && apt-get install -y --no-install-recommends gcc libc6-dev && rm -rf /var/lib/apt/lists/*
WORKDIR /build/server
COPY server/go.mod server/go.sum ./
RUN go mod download
# server/ carries the legal embed tree (server/legal/embed/<version>/) when the
# build context was prepared by sync-legal-embed.sh — go:embed bakes it here.
COPY server/ ./
COPY VERSION /tmp/VERSION
COPY PROTOCOL_VERSION /tmp/PROTOCOL_VERSION
COPY --from=frontend /build/frontend/dist ./frontend_dist/
# Protocol is sourced from PROTOCOL_VERSION (T2 single source of truth), never
# hardcoded — this was previously pinned to B1 while every other build path was B3.
RUN VERSION=$(cat /tmp/VERSION 2>/dev/null || echo dev) && \
    PROTOCOL=$(tr -d '\r\n' < /tmp/PROTOCOL_VERSION) && \
    echo "$PROTOCOL" | grep -qE '^B[0-9]+$' || { echo "FATAL: PROTOCOL_VERSION missing or invalid ('$PROTOCOL')" >&2; exit 1; } && \
    CGO_ENABLED=1 go build -ldflags "-s -w -X main.Version=$VERSION -X main.Protocol=$PROTOCOL -X main.Edition=Community" -o /hako .

# Stage 3: Minimal runtime
FROM debian:bookworm-slim@sha256:0104b334637a5f19aa9c983a91b54c89887c0984081f2068983107a6f6c21eeb
# tini = PID 1 for clean signal handling + zombie reaping (the server shells out
# for backups / AI bash mode). curl is used by the HEALTHCHECK and ACME paths.
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates curl tini && rm -rf /var/lib/apt/lists/*

# OCI image metadata. VERSION/VCS_REF injected at build time (build-docker.sh /
# docker-publish.yml). image.source points at the PUBLIC releases repo, not the
# private source repo.
ARG VERSION=dev
ARG VCS_REF=unknown
LABEL org.opencontainers.image.title="HakoSpace" \
      org.opencontainers.image.description="Self-hosted real-time chat platform (Community Edition) — single Go binary, embedded SQLite + React frontend." \
      org.opencontainers.image.source="https://github.com/HakoSpace/HakoSpace-releases" \
      org.opencontainers.image.url="https://github.com/HakoSpace/HakoSpace-releases" \
      org.opencontainers.image.documentation="https://github.com/HakoSpace/HakoSpace-releases#readme" \
      org.opencontainers.image.licenses="LicenseRef-HakoSpace-Community" \
      org.opencontainers.image.vendor="HakoSpace" \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.revision="${VCS_REF}"

# Non-root runtime user. The server only needs write access to DATA_DIR; a fixed
# UID lets an empty named volume inherit the right ownership automatically.
# Bind-mount users may need a one-time `chown 10001 ./data` on the host.
RUN useradd --system --uid 10001 --user-group --home-dir /app --shell /usr/sbin/nologin hako

WORKDIR /app
COPY --from=backend /hako .
RUN mkdir -p /app/data && chown -R 10001:10001 /app

# HAKO_RUNTIME=docker marks this as container-managed: the server disables the
# admin panel's in-app self-update (containers update by image pull, not by
# swapping the binary — see server/api/update_handler.go containerManaged).
ENV DATA_DIR=/app/data \
    HAKO_RUNTIME=docker
# 8080 = HTTP; 8443 = TLS listener (TLS_AUTO/ACME). ACME HTTP-01 additionally
# needs ports 80 + 443 published at runtime (see git-release-rule.md # Docker).
EXPOSE 8080 8443
VOLUME ["/app/data"]

# Shell-form CMD so ${PORT:-8080} expands at runtime — honours a custom PORT.
HEALTHCHECK --interval=30s --timeout=5s --start-period=15s --retries=3 \
    CMD curl -fsS "http://localhost:${PORT:-8080}/health" || exit 1

USER 10001:10001
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["./hako"]
