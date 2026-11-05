# LAST CROWN Studio

An English-language, anime-inspired 3D drama creation studio for LAST CROWN, designed to grow into a general-purpose story-to-screen workspace.

## Current browser foundation
- Create projects for LAST CROWN or original stories.
- Set language, genre and visual direction.
- Write and save one working episode script per project.
- Create character profiles with appearance and continuity notes.
- Plan scenes per project and episode, including location, time, characters, action, camera framing/movement, mood, dialogue and visual prompts.
- Edit or delete saved scenes and download a Markdown scene plan.
- Export and import a JSON backup containing projects, scripts, character profiles and scenes.
- Export and import a JSON backup containing projects, scripts and character profiles.

Open `studio/index.html` in a browser. For a static host such as Cloudflare Pages, set the build output directory to `studio`.

**Storage:** project data is stored in the current browser's local storage. It is not cloud sync. Export backups regularly; clearing browser data can remove local data. Import replaces the current project, script and character collections, so export a backup first.

## Not implemented yet
AI scene/shot generation, character image generation, 3D asset creation, image-to-video, narration, audio mixing, subtitle timing and MP4 rendering remain roadmap items. Scene planning is implemented as a manual production-planning tool; it does not generate images or video. No AI provider or video renderer is currently connected.

## Android-first direction
Keep the interface lightweight. Heavy image/video models may need optional remote inference; clearly display provider availability, account requirements, quotas and costs. Do not describe quota-limited services as unlimited free generation.

## Local Python reference
The previously supplied `dark_crown_app.py` is a separate local application reference. It has not been merged into this repository; integration requires reconciling its runtime, model and storage paths.
