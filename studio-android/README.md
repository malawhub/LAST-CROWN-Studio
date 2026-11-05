# LAST-CROWN Studio Android wrapper

This Android application packages the local Studio web workspace inside Android WebView. It supports Android document/image/audio/video pickers and runtime microphone permission for supported browser recording APIs.

## Build
Open this directory in Android Studio or run:

```sh
gradle assembleDebug
```

APK output: `app/build/outputs/apk/debug/app-debug.apk`.

The GitHub Actions workflow builds the debug APK and uploads it as an artifact. The app uses local WebView storage on this device. It does not add AI generation or guarantee that every browser recording codec is supported. Test the APK on a physical Android device before public release.
