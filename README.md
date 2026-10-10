# SilentWOLF Rhythm Worlds

A local-first anime-inspired rhythm game, with ten levels arranged from easier to harder and the SilentWOLF secret world after level 10. Songs and game code are included in this project; the Android wrapper plays them offline.

## Play in a browser

Open this folder in VS Code and use Live Server to open `index.html`. Tap the matching lane when a note reaches the line. A missed note stops the track and offers a retry of that same level. On a keyboard, use the arrows or D, F, J, K. Escape closes the game screen.

The first eight levels have one song each. Level 9 has PHILLY. Level 10 offers Stop Breathing, FE!N, and Rendezvous. Clearing level 10 unlocks SilentWOLF, whose songs are K9 and I Didn't Change My Number. Player progress is saved on the device.

## Songs and difficulty

The tracks have clean filenames in `audio/`; their order, starting BPM values, and level assignments are in `audio/track-map.json`. Levels increase the chart density as well as the tempo. Song BPMs are starting estimates and can be adjusted before play; use Offset ms if a track's first beat starts after its audio begins. The rhythm chart follows the audio playback clock. It generates a playable beat chart and does not transcribe each recording's exact drum pattern.

Fourteen tracks are bundled in the Android app, about 53 MB of audio. The old `audio.mp3` was a byte-identical copy of FE!N; it was renamed as a backup and is excluded from the mobile package.

## Android phone build

The Android project is in `mobile/android`. Its WebView hosts the game and bundled music locally, so the app does not need internet access. It also supports choosing songs and photos from the phone.

1. Install Android Studio and an Android SDK (API 36; Build Tools 35.0.0).
2. Open `mobile/android` in Android Studio and let Gradle sync.
3. Choose **Build > Build APK(s)**. Android Studio places a test APK under `mobile/android/app/build/outputs/apk/debug/`.
4. Copy the APK to your Android phone and open it to install. Android may ask you to allow installs from that file app.

To refresh the Android app's bundled files after editing the browser game, run `mobile/sync-android-assets.ps1` before building. The initial Android build needs internet to fetch Gradle dependencies and requires accepting Google's Android SDK licence in Android Studio.

## Animation and photos

Each world has its own animated, original anime-style silhouette with a theme accent. The project does not include copyrighted character artwork. Add your own background photos in the game with **Add photos**, or place project images in `assets/images/` and sync the app assets.
