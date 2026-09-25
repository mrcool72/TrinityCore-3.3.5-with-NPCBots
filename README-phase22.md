# Autonomous AI Phase 22 — Persistent World Behavior Foundation

Phase 22 begins the persistent-world simulation layer.

Bots maintain runtime memory of progression and visited regions and select a broad routine:

- `dungeon`
- `recovery`
- `questing`
- `social`
- `exploring`
- `idle`

This is intentionally a foundation rather than a fake MMO scheduler. Future phases can persist richer memories, schedules, vendor/repair stops, travel plans, relationships and equipment decisions without moving authoritative game state outside TrinityCore.
