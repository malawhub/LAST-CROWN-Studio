# Studio architecture and roadmap

## Product goal
A mobile-first story-to-screen workspace for original stories and LAST CROWN, supporting English and Chichewa and both cinematic realism and stylised/3D animation workflows.

## Current implementation
- Static browser application in `studio/index.html`.
- Local project creation, listing, JSON export and import.
- One working episode script per project, character profiles and scene/shot records stored in browser local storage.
- Scene plans can be edited, deleted and exported as Markdown.
- No server, account system, AI provider, media generation or video renderer is connected yet.

## Planned modules and extensions
- `projects`: project metadata, episode records, drafts and version history.
- `story`: outlines, scripts, dialogue, language and continuity checks.
- `characters`: basic text character bible is implemented; reusable image references remain planned.
- `scenes`: manual scene/shot planner is implemented with episode label, location, time, characters, action, framing, camera movement, mood, dialogue and visual prompt fields. Automated continuity checks remain planned.
- `assets`: generated/imported images, audio, video and attribution/licence metadata.
- `generation`: provider adapters for text, image, speech and video, with explicit quota and availability reporting.
- `editor`: timeline, tracks, subtitles, transitions and export settings.
- `render`: optional FFmpeg-based assembly where supported by the device/runtime.

## Recommended implementation order
1. Expand the episode model to support multiple episodes and script revision history.
2. Improve character management with image references and stronger continuity controls.
3. Add scene-to-character selection, continuity checks and prompt templates.
4. Asset library and provider-neutral generation adapters.
5. Narration, dialogue and subtitle timing.
6. Timeline and MP4 assembly with tested codecs and device limits.

## Device constraints
The target phone is an Android device with limited compute and storage compared with a desktop GPU. Keep the local interface lightweight. Treat large diffusion and video models as remote/optional workloads unless benchmarks prove they can run acceptably on-device. Never promise unlimited free remote generation.

## Safety and reliability
- Do not silently overwrite a project during import.
- Validate imported JSON and cap file sizes.
- Keep project backups portable.
- Store provider credentials only in a secure server-side secret store if a backend is added; never embed API keys in browser code.
- Clearly distinguish implemented features from planned features.
