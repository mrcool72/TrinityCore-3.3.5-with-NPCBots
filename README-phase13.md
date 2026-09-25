# Autonomous AI Phase 13 — Party Coordination

Phase 13 makes autonomous groups visible to the external AI and lets a group leader
propagate its current quest to eligible autonomous party members.

## New behavior

- External perception now includes `group_members`.
- Each group member exposes GUID, name, role, level, health, distance, leader state,
  alive state, and active quest ID.
- The social manager periodically synchronizes the leader's active quest to eligible
  autonomous members that are idle and able to accept it.
- Existing TrinityCore group combat, follow, quest validation, and pathfinding remain
  authoritative.

## External AI example

A perception packet now contains an additional array:

```json
"group_members": [
  {
    "guid": 123,
    "name": "Aelwyn",
    "role": "tank",
    "level": 20,
    "health": 2100,
    "max_health": 2400,
    "active_quest": 421,
    "distance": 12.4,
    "leader": true,
    "alive": true
  }
]
```

The field is omitted only when the bot is not in a group (it is serialized as an empty array).

## Quest synchronization

Every social update, the manager checks the group leader's active quest. A member is
only assigned that quest when it is not already active/completed and TrinityCore says
the member can take and add the quest. The member's normal quest executor then finds
the quest giver and performs the interaction.

No database migration is required for Phase 13.
