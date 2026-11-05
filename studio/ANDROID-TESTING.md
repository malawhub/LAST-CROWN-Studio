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
