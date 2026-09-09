# HakoSpace B2.6.41

Release date: 2026-09-09 (UTC)

## Features

- Granular permission system. Server permissions are no longer limited to the owner / admin / member roles. Twelve fine-grained permissions (Administrator, Manage server, Manage system, Manage security, Manage channels, Manage roles & groups, Manage expressions, Manage content, Moderate members, Moderate messages, View audit log, Manage AI) can be granted to user groups or to individual members. Existing owners and admins keep exactly the behavior they had before. (#115, #116, #117)
- New Permissions tab in Server Settings. It lists every group and every individually-granted member with per-permission toggles, grouped by category, and offers a one-click "Moderator" preset (delete messages, kick / ban members, view the audit log). Toggles you cannot use are disabled with an explanation: you can only grant permissions you hold yourself, groups that hold permissions you lack are locked, and terminal-linked groups stay owner-only. (#119)
- Permission changes apply live. Granting or revoking a permission, changing a role, or adding and removing group members takes effect for the affected users immediately, with no reconnect or reload. The Server Settings sidebar shows only the tabs you can actually use and updates the moment your permissions change. (#118)
- The AI assistant follows the same permissions. Assistant tools such as creating channels, changing server settings, banning users, or reading the audit log are only offered to, and only run for, users who hold the matching permission, and the check is repeated before every tool call. (#120)
- Voice stage tiles now open the member menu. Right-click or long-press any tile on the voice stage to get the same member menu as the sidebar, including the per-user volume slider (when you share the voice room) and a view-profile action. Clicking a participant's avatar tile opens their profile card. (#113)

## Bug Fixes

- Banned users lose all permissions immediately, and bans and unbans take effect without waiting for the affected user to reconnect. (#121)
- Tightened server-side access checks so private channel content stays visible only to its members: message reactions, direct-message edits, pinning, live edit / delete / reaction / pin updates, and channel storage statistics now all verify channel membership before acting. (#117, #121)
- Admins can no longer unban other admins, and can no longer add members to or change the grants of groups linked to terminal access. Both actions are now owner-only, matching the existing rules for banning and terminal access. (#116)
- Converting a public channel to private now records the channel's original creator as its owner, instead of the admin who performed the conversion. (#117)
- Permission checks that hit a database error now fail closed with a server error instead of silently treating the requester as a regular member. (#121)
- Messages sent through the AI assistant now go through the same banned-word filter and channel send-lock as regular messages, and assistant statistics respect channel visibility. (#120)
- Deleting a user group is now atomic: if any part of the cleanup fails, nothing is deleted and no "group deleted" notice is broadcast. (#122)
- Reloading io apps from Server Settings is now gated behind the Manage content permission. (#117)
