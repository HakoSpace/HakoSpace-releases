# Known limitations

HakoSpace is built to be run by a person or a small team for their own community. This page describes where its protections stop, so you can decide what else your server needs. For each item you will find what it is, when it can happen, and what you can do.

If you think you have found a problem that is *not* described here, please follow the [Security Policy](./SECURITY.md).

---

## Changes to access take effect on the next request

When you change someone's permissions, HakoSpace applies the change to every new request. When you ban or remove someone, or they change their password, it also closes their open connections. A request that was **already in progress** at that moment, for example an upload that was still being sent, can still finish.

**What you can do:** nothing is needed for normal use. If you remove access because of an incident, check the audit log afterwards for anything that happened in the last moments.

## Rate limits stop single sources, not large crowds

HakoSpace limits sign-in and registration attempts per client address. For IPv6 it counts a whole `/64` network as one client. An attacker who controls a very large number of addresses, or many machines working together, can spread attempts out and stay under the limits.

**What you can do:**
- Use strong, unique passwords, and ask your members to do the same.
- For a community that isn't meant to be public, set registration to **Invite-only** (**Settings → Registration**).
- Put the server behind a service that filters abusive traffic, such as Cloudflare.

## Heavy traffic can slow a server down

HakoSpace does not defend against floods of traffic, or against slow clients that open a connection and then barely read or send anything. Password checks are deliberately expensive, and the server only runs a few at once; during a flood of sign-in attempts, sign-in can answer "server busy" and ask the client to retry later.

**What you can do:** run the server behind a reverse proxy or a traffic-filtering service (Cloudflare, for example) that limits connections and request rates, and keep the server's ports closed to the internet except the ones you need.

## Tell HakoSpace about your reverse proxy

If a reverse proxy or load balancer sits in front of HakoSpace, the server must know which proxy to trust. By default it trusts only a proxy on the same machine (`127.0.0.1` and `::1`). When your proxy runs elsewhere, such as in another container or on another host, HakoSpace can't see members' real addresses. It then treats everyone as coming from the proxy, so a single person who repeatedly fails to sign in can trigger the limits and blocks for **all** your members.

**What you can do:** set `TRUSTED_PROXIES` in `data/.env` (or the container's environment) to the address or range of your proxy, for example `TRUSTED_PROXIES=172.18.0.0/16`. Setting it **replaces** the default. An empty value (`TRUSTED_PROXIES=`) means "trust no proxy", which is right for a server exposed directly to the internet.

## Owners and admins are trusted

HakoSpace doesn't try to protect a server from its own administrators. Owners and admins can change settings and manage members. The server also has a web terminal that runs commands on the machine the server runs on; access to it can be granted to other users.

**What you can do:** appoint only people you trust, keep the number of admins small (but at least two, so the server is never left unmanaged), and review the audit log. Give terminal access only to people you would give a login on that machine.

## A sign-in attempt can reveal whether a username exists

When a username doesn't exist, HakoSpace answers right away. When it exists but the password is wrong, the answer takes a little longer, because the password is checked first. Someone who measures response times very carefully can tell the two apart. The messages themselves are identical.

**What you can do:** don't rely on usernames being secret; protect accounts with strong passwords.

## Someone who has your session and your password

Changing sensitive account details requires the current password, and wrong guesses are limited. But if an attacker already holds a member's signed-in session **and** knows that member's current password, they can act as that member.

**What you can do:** use strong, unique passwords, and change your password if you think it leaked. After a password change, sign-ins created before the change stop working.

## Updates are checked by checksum, not by signature

When a server updates itself, it downloads the new version and compares it against a SHA-256 checksum that the server fetches itself, from the official release mirror's manifest or from the `SHA256SUMS.txt` published with the release on GitHub. The files themselves carry **no digital signature**, so the update check can't protect you if the project's own release accounts were compromised. The desktop app installers are also not code-signed yet, so Windows may show an "Unknown Publisher" warning. Release signing is planned.

**What you can do:** if you want extra assurance, download releases manually from [GitHub Releases](https://github.com/HakoSpace/HakoSpace-releases/releases), and check them against `SHA256SUMS.txt` before you run them. Docker users update by pulling a new image, and the in-app updater is switched off inside containers.
