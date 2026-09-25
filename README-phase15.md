# Autonomous AI Phase 15 — Dungeon Party AI

Phase 15 turns dungeon awareness into coordinated party behavior.

## Dungeon pull discipline

- A dungeon group prefers an effective/configured tank as its TrinityCore group leader.
- The dungeon leader controls pulls.
- Followers only assist the leader's current target instead of independently selecting nearby victims.
- Followers defer their generic exploration/quest-selection brain while grouped in a dungeon.
- Dungeon followers automatically regroup when they drift too far from the leader.

## Recovery / wipe behavior

- The external AI receives `dungeon.state` as `ready`, `combat`, `boss`, `regroup`, `wiped`, or `solo`.
- `dungeon.wipe` becomes true when every currently loaded group member is dead.
- A full wipe does not immediately disband the autonomous party; corpse/recovery handling can continue through the normal player systems.

## Boss awareness

The controller marks the current dungeon pull target as a boss when the target creature's WotLK `creature_template.rank` is at least 3. This is planning metadata only; TrinityCore remains authoritative for encounter mechanics, threat, spells, movement and damage.

## External AI perception

Additional fields:

```json
"dungeon": {
  "leader_guid": 123,
  "pull_target_guid": 456,
  "pull_target_is_boss": false,
  "regroup_required": true,
  "wipe": false,
  "state": "regroup"
}
```

The existing `instance.*` and `group.*` fields from Phase 14 remain available.

No database migration is required for Phase 15.
