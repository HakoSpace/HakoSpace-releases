# HakoSpace B2.6.62

Release date: 2026-11-04 (UTC)

This pre-release is about channel groups that hold page channels, and about user groups assigned to channel groups. All changes are in the server and the web client it provides.

## Bug Fixes

### Security

- The following now need the "Manage content" permission when page channels are involved. A group holds page channels when it, or one of its sub-folders, contains a page channel. We recommend updating every server.
  - Making a group that holds page channels public or private, changing its parent group, or deleting it. When making a group public or private, or deleting it, fails or is refused, Settings now shows a message; before, nothing was shown. (#305)
  - Moving a page channel into or out of a group. (#305)
  - Adding a member to a private group that holds page channels. Group owners and members with "Manage channels" now also need "Manage content" for this. Without it, Settings shows the reason in place of the add control. When adding a member fails or is refused, Settings now shows a message; before, nothing was shown. (#307)
  - For a user group assigned to a group that holds page channels: adding or removing its members, deleting it, and changing what it grants. Settings locks these controls in advance and, when "Manage content" is the only permission missing, explains that page channels are the reason. (#307)

### Channels and permissions

- Assigning a user group to a private channel group under **Assigned Groups** now works: the user group's members see the group and its channels, the same as members added one by one. Before, assigning had no effect. Private channels inside the group still need access to the channel itself. (#306)
- For members who see a channel group through an assigned user group, the sidebar now updates right away when the user group is assigned or unassigned, when they are added to or removed from it, and when the user group or the channel group is deleted. Members who can no longer see a voice channel leave its voice room. (#306)
- Assigning a user group to a channel group that holds page channels requires "Manage content". Settings now shows a message when assigning fails or is refused. Unassigning needs only "Manage channels". (#306)
- The IO app settings in a channel's permissions panel sometimes did not appear when the panel was opened right after Settings was opened or another channel's permissions panel was closed. This is fixed. (#306)

## Notes

- **Assigned Groups take effect when you update:** before updating, check which user groups are assigned to private channel groups under **Assigned Groups**, including groups that hold page channels. After updating, members of those user groups can see those groups and the channels in them that are not private, including page channels, right away. Making a group public removes its individual members but keeps its assigned user groups; they are hidden in Settings while the group is public, and apply again if the group is made private.
- **"Manage content" for groups with page channels:** administrators and group owners who manage such groups, or the user groups assigned to them, now also need "Manage content". Existing group memberships are kept.
- Database: no changes in this release.
- What to update: all changes are in the server and the web client it provides, which the desktop app also shows. The desktop app itself has no changes besides its version number. The game HUD program and the native capture engine bundled with the Windows desktop app are the same builds as in B2.6.61.
- Docker: this pre-release is published as `:B2.6.62-pre`, and `:pre` follows it. `:latest` stays on B2.6.51.
