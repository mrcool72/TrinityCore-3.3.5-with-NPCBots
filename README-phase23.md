# Autonomous AI Phase 23 — World Travel

Phase 23 adds a conservative world-travel layer.

- Uses the existing TrinityCore MotionMaster/pathing stack.
- Moves toward the selected quest giver when no external planner is connected.
- Does not attempt to invent cross-map coordinates or bypass map/teleport authority.
- Dungeon navigation remains owned by the dungeon manager.

Perception adds `travel.traveling`, `travel.reason`, and `travel.destination`.
