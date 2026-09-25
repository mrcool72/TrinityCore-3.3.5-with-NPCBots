# Autonomous AI Phase 17 — Dungeon Navigation & Objective Planning

Phase 17 adds a conservative dungeon objective layer.

- Exposes TrinityCore's completed encounter mask to the external AI.
- Exposes a conservative `dungeon.completion_candidate` signal rather than claiming that a dungeon is complete solely from local visibility.
- Finds the nearest visible living dungeon boss as the next objective.
- Gives the autonomous dungeon leader a local navigation fallback toward the next visible boss when external AI is not connected.
- Followers remain controlled by the social/group manager.
- Uses a larger 120-yard dungeon perception radius for objective discovery.
- Does not replace TrinityCore pathfinding or instance scripting.

The navigation layer deliberately treats the nearest visible boss as an objective anchor, not as permission to ignore encounter mechanics or group state.
