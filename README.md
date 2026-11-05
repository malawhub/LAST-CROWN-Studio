# LAST CROWN Studio

An English-language, anime-inspired 3D drama creation studio for the LAST CROWN series, designed to grow into a general-purpose story-to-screen workspace.

## Current foundation

The first browser foundation is a responsive, mobile-friendly project workspace:
- Create and save project briefs for LAST CROWN or original stories.
- Choose English or Chichewa, genre and visual direction.
- View saved projects in the current browser.
- Export and import a JSON backup.

Open `studio/index.html` in a browser, or publish the repository with a static host such as Cloudflare Pages and set the build output directory to `studio`.

**Storage note:** this prototype stores projects in that browser's local storage. Export backups regularly; clearing browser data can remove locally stored projects. This is not yet cloud sync or multi-device storage.

## Production stages

1. Story and episode development
2. Character bible and visual continuity
3. Scene and shot planning
4. Image / 3D asset creation and image-to-video
5. Narration, dialogue, subtitles and final video assembly

Only project management and backup import/export are implemented in this foundation. The other stages are roadmap items, not working features yet.

## Android-first direction

Keep the interface lightweight and usable on mobile. Use the phone for project management, scripts, assets and final assembly where practical. Heavy image/video generation may need optional external inference services; any provider integration must clearly show availability, quotas, account requirements and costs. Never represent a paid or quota-limited service as unlimited free generation.

## Source reference

The earlier local Python app is a reference for story-project fields and local story generation. It is not automatically part of this repository and should be integrated only after its runtime, storage paths and model requirements are reconciled with this web app.
