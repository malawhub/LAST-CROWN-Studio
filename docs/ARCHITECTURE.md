# Studio architecture and roadmap

## Product goal
A mobile-first story-to-screen workspace for original stories and LAST CROWN, supporting English and Chichewa and both cinematic realism and stylised/3D animation workflows.

## Current implementation
- Static browser application in `studio/index.html`.
- Local project creation, listing, JSON export and import.
- Project-specific World Bible stored in local storage, with 18 ancient-to-futuristic and fantasy starting presets plus editable custom fields for historical period, region, government, settlement, architecture, interiors, geography, climate, technology, transport, clothing, customs, food, language, beliefs, economy, magic/science, conflict, visual palette, atmosphere and continuity rules. World context is injected into scene-image prompts and both project and episode production packs; World Bibles are included in JSON backup export/import and can be exported individually.\n- Per-project asset library for JPG, PNG and WebP images, with character/scene/general categories, labels, descriptions, tags, preview and delete. Character and scene assets can be linked by record ID and previewed beside the corresponding character or scene. Images are embedded as data URLs in local storage and included in JSON backups.
- Multiple episode records per project, separate episode scripts, character profiles with visual-continuity notes, and episode-linked scene/shot records stored in browser local storage.
- The offline script-to-scene drafter detects explicit `SCENE` / `INT.` / `EXT.` headings or falls back to paragraph-sized candidates. Users can edit and select candidates before saving them to the episode's scene planner; simple character-name matching uses the local Character Bible. This is deterministic parsing, not AI comprehension.
- Scene plans can be edited, deleted and exported as Markdown. A selected episode can also be exported as a production handoff pack combining its script, scene breakdown, character bible, linked visual references, runtime estimate and missing-item checklist.
- Local prompt builders generate reusable character-reference and scene-image prompts from project metadata, Character Bible appearance locks and scene shot details. They do not call a model.
- Project visual direction supports realistic 3D cinematic, stylised 3D, 2D/3D anime, cinematic live-action realism, hand-drawn 2D, stop-motion, comic/graphic novel and hybrid mixed media. Scene planning captures lens choice, character performance/animation movement and environment motion/effects. The local scene prompt builder adds style-aware production guidance; these are planning/prompt features, not actual character animation or a rendering engine.
- Offline production-pack export combines character continuity sheets and scene prompts into a downloadable text file.
- A lightweight per-episode timeline assembles existing scene, image, audio and subtitle records into editable local tracks. Start times and durations can be adjusted and items moved earlier/later; timeline metadata is stored in local storage and included in JSON backups. A basic browser-native renderer can record a 16:9 canvas slideshow from timeline images/scenes, 0.6-second crossfades between adjacent visual segments, timed subtitle overlays and timeline audio scheduled against the resumed AudioContext clock. Audio items have per-track volume, stereo pan, fade-in and fade-out. It exports the format supported by MediaRecorder (usually WebM; MP4 only when explicitly supported by the browser). Android users can convert WebM to MP4 locally using the Termux FFmpeg script at `studio/termux-webm-to-mp4.sh`; codec support depends on the installed FFmpeg build. It is not a full editor and does not guarantee direct browser MP4.\n- Movie Theatre provides local MP4/WebM import, per-project/episode video library, native browser playback controls, full-screen request, playback-speed selection, download and delete. Studio-rendered output is also offered to the Theatre after the export download begins. Movie blobs are stored in a separate IndexedDB database, not localStorage or JSON project backups; large-file storage and codec playback depend on browser/device support.
- Audio tools support microphone recording (when browser APIs and permission are available), audio-file import, clip classification and optional scene linking. Audio blobs are stored in IndexedDB rather than localStorage; clips can be played and downloaded individually. Subtitle cues are stored per episode in localStorage and exported as SRT; subtitle cues are included in JSON backups, audio blobs are not.
- Comic/storyboard builder arranges Asset Library images into numbered pages, supports speech/thought/caption/sound text overlays, panel editing, within-page drag-and-drop and touch-friendly arrow reordering, per-panel 12-column width spans, page preview, image fit/crop and focal positioning, page background themes, panel border styles, and self-contained HTML export with print colour preservation for PDF output.
- A lightweight 2D motion compositor uses the existing Asset Library: one optional background image plus up to three independently controlled character images are drawn to a 16:9 canvas. Each character has independent idle, walk, run, entrance, float, tremble, zoom and reaction-turn presets, size and screen placement. The browser can preview the motion and record a local WebM through Canvas captureStream/MediaRecorder; the exported clip can be imported into Movie Theatre. It moves each still cut-out as a separate image layer and does not provide skeletal rigging, articulated limbs, lip-sync, frame-by-frame animation, AI image-to-video or 3D rendering.\n- No server, account system, AI provider or generative media service is connected. Browser-native video rendering is implemented as a basic local export path.

- Offline app shell: `studio/service-worker.js` caches the Studio entry page, manifest and Termux converter script on the first successful HTTPS visit. The web app manifest supports installation to the Android home screen. Once cached and installed, the static app shell and browser-local workflows can open without a network connection. The first cache fill and install still require internet. Local MP4 conversion is performed by the previously installed Termux FFmpeg package; the conversion itself is offline. Direct browser MP4 encoding is not guaranteed.

## Planned modules and extensions
- `projects`: project metadata, episode records, drafts and version history.
- `story`: outlines, scripts, dialogue, language and continuity checks.
- `characters`: text character bible and fixed continuity notes are implemented; reusable image references and profile editing remain planned.
- `scenes`: manual scene/shot planner is implemented with episode association, location, time, characters, action, framing, camera movement, mood, dialogue and visual prompt fields. Automated continuity checks remain planned.
- `assets`: imported images and future audio/video assets with attribution/licence metadata.
- `comic`: implemented local panel/page composition and offline HTML/PDF-print workflow; richer page templates, image crop controls and print-preview testing remain planned.
- `generation`: provider adapters for text, image, speech and video, with explicit quota and availability reporting.
- `editor`: timeline, tracks, subtitles, transitions and export settings.
- `render`: optional FFmpeg-based assembly where supported by the device/runtime.

## Recommended implementation order
1. Complete the episode production handoff and validate scene/character continuity (the first handoff export and readiness checks are now implemented).
2. Validate timeline usability on Android, then add tested FFmpeg-based MP4 assembly where the runtime/device supports it.
3. Validate the Termux FFmpeg conversion path on the target Android device; evaluate direct FFmpeg integration only if memory and package constraints permit.
4. Extend the 2D compositor with multi-character layers, keyframe paths and audio-synchronised dialogue only after validating its basic recording workflow on Android.\n5. Evaluate genuinely free/open-source visual production tools against Android and desktop constraints; do not add credit-metered generation.

## No-credit product rule
Core workflows must not require credit-based generation APIs, paid AI subscriptions or hidden usage charges. Prefer offline tools and locally runnable open-source software. Remote providers, if ever added as optional integrations, must be clearly labelled with account, quota, regional, licence and cost requirements and must never be a required dependency.

## Device constraints
The target phone is an Android device with limited compute and storage compared with a desktop GPU. Keep the local interface lightweight. Treat large diffusion and video models as remote/optional workloads unless benchmarks prove they can run acceptably on-device. Never promise unlimited free remote generation.

## Safety and reliability
- Do not silently overwrite a project during import.
- Validate imported JSON and cap file sizes.
- Keep project backups portable.
- Store provider credentials only in a secure server-side secret store if a backend is added; never embed API keys in browser code.
- Clearly distinguish implemented features from planned features.

### Interactive panel resizing
The comic preview exposes a native range control on each panel. Input updates the panel grid span immediately; change persists the selected 3–12 column span in the comic record. The mobile preview maps the 12-column span to a six-column grid. Export HTML uses the stored 12-column span. The native range input supplies keyboard and touch accessibility alongside drag-and-drop and arrow reordering.
