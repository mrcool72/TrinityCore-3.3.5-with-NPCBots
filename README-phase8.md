# Autonomous AI Phase 8 — Local Population Brain

Phase 8 makes the bots useful even when the external AI process is unavailable.

## What changed

- Adds `AutonomousBotBrain` as a local fallback planner.
- Automatically selects nearby available quests.
- Uses the existing `AutonomousQuestExecutor` for quest pickup and turn-in.
- For active kill/objective quests, searches nearby matching creatures/gameobjects.
- Attacks valid objective creatures and moves toward objective gameobjects.
- If an objective is not currently visible, performs short local exploration movements.
- External AI remains authoritative whenever its transport is connected; the local brain stays dormant in that case.
- Quest perception now includes objective counts and required item counts so the external AI receives more useful state.

## Result

An enabled headless character can now:

1. Spawn into the world.
2. Find a nearby quest.
3. Travel to the quest giver.
4. Accept the quest.
5. Search the local area for objective creatures/gameobjects.
6. Fight objective creatures using TrinityCore combat.
7. Wander when the objective is not visible.
8. Return to the quest giver when the quest becomes completable.
9. Turn the quest in.
10. Pick another quest and continue.

This is deliberately a first population layer, not the final AI. TrinityCore remains authoritative for movement, combat, quest validation and persistence.

## Apply

Start from the Phase 7 package/source tree and add the Phase 8 files and modifications in this package. Rebuild `worldserver`.

No new SQL migration is required beyond the existing `autonomous_bot_config` table; `sql/autonomous_bot_phase8.sql` is a deployment marker only.

## External AI

If the external AI server is running, Phase 8's local brain yields to it. If the external AI server is stopped or unreachable, the local brain takes over automatically.
