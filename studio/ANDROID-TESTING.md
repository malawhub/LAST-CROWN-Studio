# Offline use on Android

## Initial setup (internet required once)

1. Deploy the `studio` folder to an HTTPS host such as Cloudflare Pages.
2. Open the Studio in Chrome while online. Wait until the header says **Offline files cached**.
3. From Chrome's menu, choose **Install app** or **Add to Home screen**.
4. In Termux, install FFmpeg and enable storage access:

```sh
pkg update
pkg install ffmpeg
termux-setup-storage
```

5. Download the Termux converter script once while online.

## After setup

Turn on airplane mode and open the installed Studio. The service worker supplies the cached app shell. Project editing, local browser storage, asset handling, comics, audio tools, subtitles, timeline work and browser video rendering do not require a server connection. If the browser renders WebM, run the already-installed Termux FFmpeg converter to create MP4; conversion itself is local.

## Important

- Initial cache fill, installation and FFmpeg package installation need internet. Offline use is after this one-time setup.
- Service workers require HTTPS or localhost. Opening the HTML file directly does not install the offline app.
- Do not clear browser site data; that can erase locally stored projects. Export backups regularly.
- Audio blobs in IndexedDB are not currently included in JSON backups; download important recordings separately.
- Keep the Studio visible during rendering. Start with 640×360 at 15 fps on the Honor X6b.
- MP4 encoding depends on the installed FFmpeg codec build. The script prefers H.264 and has a fallback.

---

# Android MP4 export and device test

## Convert a WebM export to MP4 locally

The Studio browser renderer records the format supported by the browser. When it produces WebM, use FFmpeg locally in Termux. No AI credits, subscriptions, upload or remote conversion are involved.

1. Install Termux from F-Droid or the official Termux GitHub releases.
2. In Termux run:

```sh
pkg update
pkg install ffmpeg
termux-setup-storage
```

3. Allow storage permission.
4. Download `termux-webm-to-mp4.sh` from the Studio video export panel to Downloads.
5. Run:

```sh
bash ~/storage/downloads/termux-webm-to-mp4.sh
```

It selects the newest WebM in Downloads, writes an MP4 beside it and preserves the original. To specify input and output paths:

```sh
bash ~/storage/downloads/termux-webm-to-mp4.sh ~/storage/downloads/episode.webm ~/storage/downloads/episode.mp4
```

The script uses H.264/AAC if the installed FFmpeg supports libx264. Otherwise it falls back to MPEG-4 Part 2 video in an MP4 container, which may be less widely compatible. Conversion uses phone CPU and storage and may take time.

## Audio mixing controls

Each audio item on the episode timeline supports volume (0–200%), stereo pan (left to right), fade-in and fade-out durations. These are applied during local video rendering. This is basic track mixing, not a full DAW or compressor/equaliser system.

## Android acceptance test

I cannot physically operate the target phone from this repository, so this is the required device test—not a claim that it has already passed.

1. Deploy the latest `studio-foundation` branch with `studio` as the static output directory. Open it in Chrome on Android.
2. Create a test project and episode. Add two scenes of 4 and 5 seconds and attach one image to each.
3. Add both scenes to the timeline. Add an audio clip and set its timeline start and duration.
4. Set audio volume to 50%, pan to -1, fade-in to 1 second and fade-out to 1 second. Add a subtitle cue in the middle.
5. Render at 640×360 and 15 fps first. Keep the tab visible until the download completes.
6. Play the exported file on the phone. Check order, transitions, subtitles, audio level and synchronisation.
7. Convert WebM to MP4 using the Termux script. Play the MP4 and check synchronisation again.
8. Only then try 960×540 and 1280×720. Higher resolutions use more memory.
9. Repeat with the screen awake. Android may throttle background tabs.
10. Record browser version, Android version, output type, resolution, episode duration and any errors.

Do not mark Android compatibility as passed until the exported file has been played and checked on the phone.
