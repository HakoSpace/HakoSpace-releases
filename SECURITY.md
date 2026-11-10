# Security Policy

Thank you for helping keep HakoSpace and the servers people run with it safe.

## Reporting a vulnerability

Please report security problems **privately**. Do not open a public issue or discuss the problem in public until we have had a chance to fix it.

- **GitHub:** [report a vulnerability privately](https://github.com/HakoSpace/HakoSpace-releases/security/advisories/new)
- **Email:** [security@hakospace.com](mailto:security@hakospace.com)

English or Traditional Chinese (正體中文) is fine.

### What to include

The more of this you can give us, the faster we can act:

- the HakoSpace version (the release or image tag you run) and how you run it (Docker or the standalone binary, Linux or Windows, behind a reverse proxy or not);
- what you found and what an attacker could do with it;
- the steps to reproduce it, or a proof of concept;
- whether you have already told anyone else.

Please don't include real members' data or other people's secrets. A test server of your own is the best way to reproduce a problem.

## What to expect

We aim to acknowledge your report within 5 business days. This is a goal, not a guarantee. After that we will look into it, tell you what we found, and keep you updated while a fix is prepared.

## Supported versions

Security fixes go into the newest releases only:

| Release | Supported |
|---|---|
| Newest stable release (the Docker `:latest` tag, or the newest non-preview release on [GitHub Releases](https://github.com/HakoSpace/HakoSpace-releases/releases)) | Yes |
| Newest preview release (the Docker `:pre` tag) | Yes |
| Older releases | No — please update to the newest release first |

## What is not a vulnerability

Some behaviors are known limits of how HakoSpace works, or depend on how a server is set up. We list them, with what you can do about each, in [Known limitations](./KNOWN_LIMITATIONS.md). We do not treat what is described there as a vulnerability, though a report that shows something worse than it describes is welcome. In short, these include:

- problems that come from a server's own configuration, for example a reverse proxy that is not declared to HakoSpace;
- attacks that need an attacker to already hold a member's signed-in session *and* that member's current password;
- floods of traffic, and slow clients that hold connections open;
- an owner or admin acting against their own server.

If you are unsure whether something is covered, report it anyway and we will tell you.

## Scope

This policy covers the HakoSpace server and desktop app published in this repository, and the Docker image `ghcr.io/hakospace/hako`. Servers run by other people are theirs to secure; if you find a problem on someone else's server, please tell its operator.
