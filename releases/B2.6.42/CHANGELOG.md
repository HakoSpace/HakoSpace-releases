# HakoSpace B2.6.42

Release date: 2026-09-15 (UTC)

## Features

- Drag and drop files onto the chat. Drop a file anywhere on a channel or direct-message chat pane to attach it, the same way the attach button and paste work: same file-type rules, same limit of 10 files per message, same error banner, and the message is still only sent when you choose. While you drag, an overlay reads "Drop to attach" with the remaining slot count; when attaching is not possible (you cannot post in the channel, the thread is archived or locked, an upload is in progress, or 10 files are already attached) the overlay says "Cannot attach here" and explains why. Previously the cursor showed "drop allowed" everywhere in the app while nothing happened on drop. (#123)
- Paste any file from the clipboard. Pasting into the message box now accepts any file type, not only images (for example a PDF copied from a file manager). (#123)
- Forum is now fully localized. Every label, button, prompt, error message, and relative timestamp in the forum panel and forum settings follows the app language, with a complete English translation. Dates older than seven days also follow the app language instead of the browser language. Traditional Chinese wording is unchanged. (#124)
- Desktop keyboard shortcuts work in the background without capturing keys. Every shortcut (push-to-talk, mute, deafen, toggle input mode, accept call, and reject call) now works both while HakoSpace is focused and while it is in the background, and other applications still receive the same key combination. The "foreground only / global" scope switch has been removed from Settings; each bound shortcut instead shows a status line saying whether background use is active, or why it is limited (Linux Wayland, macOS, or a key that cannot be mapped). Shortcuts also keep working while the focus is on the title bar, the welcome screen, or a popped-out share window. (#125)

  Notes for existing users: a shortcut you had set to "foreground only" now also fires in the background (it is never intercepted, so other apps are unaffected). Background use requires a modifier (Ctrl / Alt / Shift / Super); a bare key works in-app only, and Enter, Tab, Space, and the arrow keys can no longer be bound on their own. Holding a shortcut no longer types into the page. If you are in voice on two server tabs at once, a shortcut acts on both, as push-to-talk already did.

## Bug Fixes

- Selecting or dropping the same file twice no longer uploads it twice; the duplicate is skipped with an "Already attached, not added again" notice naming the file. (#123)
- Dropping a folder onto the chat is now rejected immediately with "Folders cannot be attached", instead of failing later at upload time. (#123)
- The "toggle input mode" shortcut and other action shortcuts now work while HakoSpace is in the background; previously only push-to-talk did unless the shortcut was explicitly set to global, and a global shortcut then blocked that key combination for other applications. (#125)
