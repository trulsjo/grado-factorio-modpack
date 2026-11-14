---
name: mod-portal
description: Querying the Factorio mod portal API for a mod, its releases or a release's
  info_json, or the full sweep of the 2.0 and 2.1 listings. Use before any call to
  mods.factorio.com/api.
---

# The mod portal API

The facts every repository that queries the portal works by are on
[`mod-portal.md`](../../../vendor/grado-factorio-tools/docs/mod-portal.md), in the tools
submodule at its pin
([on GitHub](https://github.com/trulsjo/grado-factorio-tools/blob/main/docs/mod-portal.md),
whose `main` may be ahead of the pin). Read it first. This skill holds this repository's
endpoints and its sweep:

- `https://mods.factorio.com/api/mods/<name>` — one mod, with its release list.
- `https://mods.factorio.com/api/mods/<name>/full` — adds each release's `info_json`, which is where
  `factorio_version` and the dependency list live.
- `https://mods.factorio.com/api/mods?page_size=max&version=2.0` — 9,791 entries — and
  `&version=2.1` — 4,334. **The full sweep is the union of both, 10,845 distinct mods**; neither
  listing alone is complete. 1,054 mods are in the 2.1 listing only, so a sweep of the 2.0 listing
  misses them. Counts read 2026-10-01; they move. (#44, which measured 977 missed on 2026-09-22.)
