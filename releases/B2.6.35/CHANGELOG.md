# HakoSpace B2.6.35

Release date: 2026-08-31 (UTC)

## Features

- The desktop app now starts through a small splash screen that handles update checks and installation before the main window opens — updates run up front at launch instead of arriving after you are already in the app. (#104)

- While the app is running, new versions are quietly pre-downloaded in the background and staged. The app never restarts itself: when an update is ready, a "Restart to apply" action appears in the tray menu and the desktop settings window, and the staged version is applied the next time the app starts. (#105)
