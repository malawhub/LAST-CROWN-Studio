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
- Export an offline production prompt pack containing character continuity sheets and prompts for all saved scenes.\n- Build an episode production handoff pack combining the selected episode script, scene-by-scene breakdowns, character continuity, linked visual references, estimated runtime and a readiness checklist.
- Build multi-page comics from images in the Asset Library, add speech/thought/narration/sound text, edit panels, drag-and-drop panels within a page (with arrow controls for touch screens), set each panel to quarter/third/half/two-thirds/full-page width on a 12-column grid, apply page design, preview pages, control image crop/focus, choose page backgrounds and panel borders, and export a self-contained offline HTML comic for printing to PDF.

Open `studio/index.html` in a browser. For a static host such as Cloudflare Pages, set the build output directory to `studio`.

**Storage:** project data and image assets are stored in the current browser's local storage. This is not cloud sync. The asset library limits images to 800 KB each and approximately 3 MB total; large image collections can exceed browser storage limits. Export backups regularly; clearing browser data can remove local data. Import replaces the current project, episode, script, character, scene and asset collections, so export a backup first. Backups containing images can be large.

## Not implemented yet
Actual AI text generation, character image generation, 3D asset creation, image-to-video, narration, audio mixing, subtitle timing and MP4 rendering remain roadmap items. The episode production pack is a local export/handoff document; it does not automatically split scripts into scenes or render media. The new prompt builders are local templates: they assemble structured prompts from saved project data but do not call an AI model or generate media. Scene planning is implemented as a manual production-planning tool; it does not generate images or video. No AI provider or video renderer is currently connected.

## No-credit requirement
The built-in workflow must not depend on credit-metered AI generation APIs, paid generation subscriptions or hidden usage charges. Prompt construction and production-pack export run locally. Future image/video workflows must prioritise offline software and locally runnable open-source tools; optional remote services must never be required and must be clearly labelled if they impose quotas, accounts or costs.

## Android-first direction
Keep the interface lightweight. Heavy image/video models may need optional remote inference; clearly display provider availability, account requirements, quotas and costs. Do not describe quota-limited services as unlimited free generation.

## Local Python reference
The previously supplied `dark_crown_app.py` is a separate local application reference. It has not been merged into this repository; integration requires reconciling its runtime, model and storage paths.


The comic page preview also includes an accessible per-panel width slider. Drag its handle to resize a panel from 3/12 to 12/12 page width; the new size saves locally and is retained in HTML exports and JSON backups. On narrow screens, the same size is scaled to the six-column mobile grid.
