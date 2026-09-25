# Autonomous AI Phase 16 — Boss & Encounter Coordination

Phase 16 adds dungeon boss encounter metadata and role-aware encounter positioning.

- Detect WotLK dungeon bosses using `creature_template.rank >= 3`.
- Report boss GUID, entry, health, health percentage and casting state to external AI.
- Track encounter active/dead state.
- Tank closes to the boss; healer/ranged maintain a safer distance; damage follows the encounter target.
- Fix Phase 15 dungeon regroup semantics so an in-combat-free but correctly grouped party reports `ready` instead of always `regroup`.
- TrinityCore remains authoritative for combat, threat, spells, pathfinding and encounter mechanics.

No database migration required.
