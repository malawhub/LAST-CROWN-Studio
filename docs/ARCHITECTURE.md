# Studio architecture and roadmap

## Product goal
A mobile-first story-to-screen workspace for original stories and LAST CROWN, supporting English and Chichewa and both cinematic realism and stylised/3D animation workflows.

## Current implementation
- Static browser application in `studio/index.html`.
- Local project creation, listing, JSON export and import.\n- Per-project asset library for JPG, PNG and WebP images, with character/scene/general categories, labels, descriptions, tags, preview and delete. Character and scene assets can be linked by record ID and previewed beside the corresponding character or scene. Images are embedded as data URLs in local storage and included in JSON backups.
- Multiple episode records per project, separate episode scripts, character profiles with visual-continuity notes, and episode-linked scene/shot records stored in browser local storage.
- Scene plans can be edited, deleted and exported as Markdown.
- Local prompt builders generate reusable character-reference and scene-image prompts from project metadata, Character Bible appearance locks and scene shot details. They do not call a model.
- No server, account system, AI provider, media generation or video renderer is connected yet.

## Planned modules and extensions
- `projects`: project metadata, episode records, drafts and version history.
- `story`: outlines, scripts, dialogue, language and continuity checks.
- `characters`: text character bible and fixed continuity notes are implemented; reusable image references and profile editing remain planned.
- `scenes`: manual scene/shot planner is implemented with episode association, location, time, characters, action, framing, camera movement, mood, dialogue and visual prompt fields. Automated continuity checks remain planned.
- `assets`: generated/imported images, audio, video and attribution/licence metadata.
- `generation`: provider adapters for text, image, speech and video, with explicit quota and availability reporting.
- `editor`: timeline, tracks, subtitles, transitions and export settings.
- `render`: optional FFmpeg-based assembly where supported by the device/runtime.

## Recommended implementation order
1. Add script revision history and richer episode metadata.
2. Improve character management with image references, profile editing and stronger continuity controls.
3. Add scene-to-character selection, continuity checks and prompt templates (basic local character and scene prompt templates are now implemented).
4. Asset library and provider-neutral generation adapters (asset library is implemented; provider adapters remain planned).
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
