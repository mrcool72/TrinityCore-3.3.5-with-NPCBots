# Autonomous AI Phase 21 — External Planner Contract

Phase 21 formalizes the high-level planning information sent to the external AI.

The perception payload now contains a `world` object with:

- `routine`
- `long_term_goal`
- `completed_quests`
- `last_completed_quest`
- `visited_maps`
- `recommended_quest`

The external service can use these fields to make longer-horizon decisions while TrinityCore remains authoritative over movement, combat, quests and inventory.
