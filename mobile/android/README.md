# Android phone test build

This is a small Android WebView shell around the browser game. The game files and selected MP3 tracks are packaged under `app/src/main/assets/www`, so gameplay works offline. The host supports the game's audio/photo file picker.

## Requirements and build

- Android Studio with an Android SDK platform at API 36 and SDK Build Tools 35.0.0.
- JDK 17 or newer. The project uses Android Gradle Plugin 8.13.2 and Gradle 8.13.
- Accept the Android SDK licence in Android Studio's SDK Manager.

Open this folder in Android Studio and build **Build > Build APK(s)**. The debug APK is written to `app/build/outputs/apk/debug/app-debug.apk`. This debug APK is for personal device testing, not store release.

The web game source is one directory above `mobile`. After changing it, run `../sync-android-assets.ps1` from PowerShell before the next build.
