# Studio architecture and roadmap

## Product goal
A mobile-first story-to-screen workspace for original stories and LAST CROWN, supporting English and Chichewa and both cinematic realism and stylised/3D animation workflows.

## Current implementation
- Static browser application in `studio/index.html`.
- Local project creation, listing, JSON export and import.
- No server, account system, AI provider, media generation or video renderer is connected yet.

## Proposed modules
- `projects`: project metadata, episode records, drafts and version history.
- `story`: outlines, scripts, dialogue, language and continuity checks.
- `characters`: character bible, appearance descriptions and reference assets.
- `scenes`: locations, shot lists, camera framing, lighting and scene continuity.
- `assets`: generated/imported images, audio, video and attribution/licence metadata.
- `generation`: provider adapters for text, image, speech and video, with explicit quota and availability reporting.
- `editor`: timeline, tracks, subtitles, transitions and export settings.
- `render`: optional FFmpeg-based assembly where supported by the device/runtime.

## Recommended implementation order
1. Project data model, editing and backup validation.
2. Episode/script editor with autosave and revision history.
3. Character bible and reusable visual references.
4. Scene breakdown and shot planner.
5. Asset library and provider-neutral generation adapters.
6. Narration, dialogue and subtitle timing.
7. Timeline and MP4 assembly with tested codecs and device limits.

## Device constraints
The target phone is an Android device with limited compute and storage compared with a desktop GPU. Keep the local interface lightweight. Treat large diffusion and video models as remote/optional workloads unless benchmarks prove they can run acceptably on-device. Never promise unlimited free remote generation.

## Safety and reliability
- Do not silently overwrite a project during import.
- Validate imported JSON and cap file sizes.
- Keep project backups portable.
- Store provider credentials only in a secure server-side secret store if a backend is added; never embed API keys in browser code.
- Clearly distinguish implemented features from planned features.
