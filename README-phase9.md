# Autonomous AI Phase 9 — Population Behavior

Phase 9 builds on Phase 8 and makes the local autonomous brain substantially more persistent and varied.

## New behavior

- **Personality-aware behavior**: `balanced`, `quester`, `explorer`, and `cautious` affect quest selection and exploration radius.
- **Recovery behavior**: bots stop moving when badly injured and wait for natural regeneration before resuming.
- **Partial quest progress**: objective work now continues when an objective is partially complete instead of treating it as finished.
- **Persistent personality application**: the profile personality is applied when a controller attaches and when `.autobot edit personality ...` is used.
- **External AI remains authoritative when connected**; the local brain is the fallback when the external transport is unavailable.

## Personality examples

```text
.autobot edit personality balanced
.autobot edit personality quester
.autobot edit personality explorer
.autobot edit personality cautious
```

`quester` prioritizes quest acquisition and does not wander when no quest is immediately available. `explorer` tolerates longer travel distances and uses a larger exploration radius. `cautious` uses shorter exploration and slightly favors nearby quests. Other values currently behave like `balanced`.

## Objective behavior

If a quest requires 10 kills and the bot has already made 6 progress, Phase 9 continues looking for the remaining four rather than treating the objective as complete.

## Deployment

This package is cumulative. Start from the Phase 8 package/source tree, replace the files in this package, and rebuild `worldserver`.

No new database migration is required. `sql/autonomous_bot_phase8.sql` remains an idempotent marker and the existing `autonomous_bot_config` table stores personality values.

## Validation

A full build should be performed against the exact TrinityCore/NPCBots checkout used by the server. The package intentionally uses existing TrinityCore Player, MotionMaster, quest, and regeneration systems rather than implementing parallel gameplay systems.
