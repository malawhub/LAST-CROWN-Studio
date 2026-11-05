# LAST CROWN Studio

An English-language, anime-inspired 3D drama creation studio for LAST CROWN, designed to grow into a general-purpose story-to-screen workspace.

## Current browser foundation
- Create projects for LAST CROWN or original stories.
- Set language, genre and visual direction.
- Create and manage multiple episodes per project, each with its own saved script.
- Create character profiles with appearance descriptions and fixed visual-continuity rules.
- Plan scenes per project and episode, including location, time, characters, action, camera framing/movement, mood, dialogue and visual prompts.
- Edit or delete saved scenes and download a Markdown scene plan.
- Organise JPG, PNG and WebP character references, scene references and general visuals in a per-project asset library, with descriptions, tags and direct links to saved character profiles and scene records. Linked reference thumbnails appear alongside the matching character or scene.\n- Export and import a JSON backup containing projects, episodes, scripts, character profiles, scenes and image assets.

Open `studio/index.html` in a browser. For a static host such as Cloudflare Pages, set the build output directory to `studio`.

**Storage:** project data and image assets are stored in the current browser's local storage. This is not cloud sync. The asset library limits images to 800 KB each and approximately 3 MB total; large image collections can exceed browser storage limits. Export backups regularly; clearing browser data can remove local data. Import replaces the current project, episode, script, character, scene and asset collections, so export a backup first. Backups containing images can be large.

## Not implemented yet
AI scene/shot generation, character image generation, 3D asset creation, image-to-video, narration, audio mixing, subtitle timing and MP4 rendering remain roadmap items. Scene planning is implemented as a manual production-planning tool; it does not generate images or video. No AI provider or video renderer is currently connected.

## Android-first direction
Keep the interface lightweight. Heavy image/video models may need optional remote inference; clearly display provider availability, account requirements, quotas and costs. Do not describe quota-limited services as unlimited free generation.

## Local Python reference
The previously supplied `dark_crown_app.py` is a separate local application reference. It has not been merged into this repository; integration requires reconciling its runtime, model and storage paths.
