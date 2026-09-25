# Autonomous AI Phase 10 — Social Groups

Phase 10 adds an autonomous social/group layer on top of the Phase 9 quest and personality system.

## Features

- Automatically forms temporary 2–5 player parties from enabled headless autonomous characters.
- Only groups bots that are alive, in-world, ungrouped, on the same map, and within 45 yards.
- Prefers complementary classes when choosing a nearby partner.
- Group members follow the autonomous group leader when idle.
- When the leader attacks a valid target, nearby group members assist in combat.
- Groups are disbanded when members separate too far, disappear, leave the autonomous population, or fall below two members.
- Groups are cleaned up before headless characters are unloaded on shutdown.
- Uses TrinityCore's native `Group` system rather than inventing a parallel party abstraction.

## Deployment

Copy the files under `src/server/game/AI/Autonomous/` over the existing Phase 9 Autonomous directory.

Rebuild `worldserver`.

No SQL migration is required for Phase 10.

## Expected behavior

With several enabled headless bots in the same area, the social manager periodically checks for nearby autonomous characters. A pair can become a normal TrinityCore party, with up to five members. The party follows its leader and assists the leader's combat target.

This phase deliberately keeps grouping lightweight. Dungeon/LFG logic, loot decisions, role-specific healing/tanking, quest sharing, and long-term social relationships are reserved for later phases.
