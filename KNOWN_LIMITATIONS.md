# Known limitations

HakoSpace is built to be run by a person or a small team for their own community. This page describes where its protections stop, so you can decide what else your server needs. For each item you will find what it is, when it can happen, and what you can do.

If you think you have found a problem that is *not* described here, please follow the [Security Policy](./SECURITY.md).

---

## Changes to access take effect on the next request

When you change someone's permissions, HakoSpace applies the change to every new request. When you ban or remove someone, or they change their password, it also closes their open connections. A request the server had **already started acting on** at that moment, for example an action that is already running or a download that is already being sent, can still finish. (A request that is still arriving is checked again once it has fully arrived.)

**What you can do:** nothing is needed for normal use. If you remove access because of an incident, check the audit log afterwards for administrative actions taken in the last moments.

## Rate limits stop single sources, not large crowds

HakoSpace limits sign-in and registration attempts per client address. Starting with B2.6.64, it counts a whole IPv6 `/64` network as one client; earlier versions (the `:latest` Docker image is still B2.6.62) count each IPv6 address separately. An attacker who controls a very large number of addresses, or many machines working together, can spread attempts out and stay under the limits.

**What you can do:**
- Use strong, unique passwords, and ask your members to do the same.
- For a community that isn't meant to be public, set registration to **Invite Only** (**Settings → Registration**).
- Put the server behind a service that filters abusive traffic, such as Cloudflare, and declare that proxy as described in [Tell HakoSpace about your reverse proxy](#tell-hakospace-about-your-reverse-proxy).

## Heavy traffic can slow a server down

HakoSpace does not defend against floods of traffic. It also does not limit how slowly a client may read its responses, or how many connections one client opens. Password checks are deliberately expensive, and the server only runs a few at once; during a flood of sign-in attempts, sign-in can answer "server busy" and ask the client to retry later.

**What you can do:** run the server behind a reverse proxy or a traffic-filtering service (Cloudflare, for example) that limits connections and request rates (and declare it, see below), and keep the server's ports closed to the internet except the ones you need.

## Tell HakoSpace about your reverse proxy

If a reverse proxy or load balancer sits in front of HakoSpace, the server must know which proxy to trust. By default it trusts only a proxy that connects over the loopback address (`127.0.0.1` and `::1`). That covers a proxy on the same machine, but not a proxy in another container or on another host, and not a proxy on the host of a Docker container with published ports: it connects from the Docker network's address. In those cases HakoSpace can't see members' real addresses and treats everyone as coming from the proxy, so a single person who repeatedly fails to sign in can trigger the limits and blocks for **all** your members. Because every sign-in attempt counts toward the limit, ordinary use by many members behind the same proxy can trip it too.

**What you can do:** set `TRUSTED_PROXIES` in `data/.env` (or the container's environment) to the address or range of your proxy, for example `TRUSTED_PROXIES=172.18.0.0/16`. Setting it **replaces** the default. An empty value (`TRUSTED_PROXIES=`) means "trust no proxy", which is right for a server exposed directly to the internet.

## Owners and admins are trusted

HakoSpace doesn't try to protect a server from its own administrators. Owners and admins can change settings and manage members.

**What you can do:** appoint only people you trust, keep the number of admins small (but appoint at least one admin besides the owner, so the server isn't left unmanaged if the owner is unavailable), and review the audit log.

## A sign-in attempt can reveal whether a username exists

When a username doesn't exist, HakoSpace answers right away. When it exists but the password is wrong, the answer takes longer, because the password is checked first. Someone who measures response times can tell the two apart, although the messages themselves are identical. The sign-up form's username check also tells anyone whether a name is already taken.

**What you can do:** don't rely on usernames being secret; protect accounts with strong passwords.

## Someone who has your session and your password

Changing sensitive account details requires the current password, and wrong guesses are limited. But an attacker who holds a member's signed-in session can already do anything that member can do, and one who also knows the current password can change the member's email or password and take the account over.

**What you can do:** use strong, unique passwords, and change your password if you think it leaked. After a password change, sign-ins created before the change stop working.

## Updates are checked by checksum, not by signature

When a server updates itself, it downloads the new version and compares it against a SHA-256 checksum that the server fetches itself, from the official release mirror's manifest or from the `SHA256SUMS.txt` published with the release on GitHub. The files themselves carry **no digital signature**, so the update check can't protect you if the project's own release accounts were compromised. The desktop app installers are not code-signed, so Windows may show an "Unknown Publisher" warning. An admin can also choose to install a download whose checksum did not match; that choice is recorded in the audit log.

**What you can do:** if you want extra assurance, download releases manually from [GitHub Releases](https://github.com/HakoSpace/HakoSpace-releases/releases), and check them against `SHA256SUMS.txt` before you run them. Docker users update by pulling a new image, and the in-app updater is switched off in the official Docker image.
