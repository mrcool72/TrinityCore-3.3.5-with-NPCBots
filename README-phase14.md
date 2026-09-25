# Autonomous AI Phase 14 — Dungeon Awareness

Phase 14 makes autonomous bots explicitly aware of dungeon/raid context and group health/combat state.

## New perception fields

The external AI now receives:

- `instance.in_dungeon`
- `instance.in_raid`
- `instance.id`
- `instance.difficulty`
- `group.alive`
- `group.dead`
- `group.average_health`
- `group.in_combat`

## Group behavior

Autonomous groups stay tighter inside dungeons and use a larger break-distance allowance so temporary pathing separation does not immediately disband an instance party.

Normal world groups retain the Phase 13 behavior.

TrinityCore remains authoritative for instance entry, movement, combat, quest validation, loot and encounter state. The external AI should use these fields for planning rather than issuing per-tick movement/combat commands.

No database migration is required.
