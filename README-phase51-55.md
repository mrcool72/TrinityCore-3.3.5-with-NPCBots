# Autonomous AI — Phases 51–55

This package extends the cumulative phases 1–50 implementation with an actual local campaign execution loop.

## 51 — Campaign -> quest execution
`AutonomousCampaignExecutor` consumes the selected campaign quest and reuses the existing authoritative `AutonomousQuestExecutor`/`Player` quest APIs. It does not directly mutate quest state.

## 52 — Objective target resolution
The executor resolves the nearest visible creature/gameobject matching an unfinished creature/GO objective. Item objectives fall back to the nearest hostile creature, while TrinityCore remains authoritative for loot/item credit.

## 53 — Quest-giver travel and continuation
Campaign-selected quests are started through the existing quest executor, which handles quest-giver travel, acceptance, objective execution, return travel, and reward. When a quest is rewarded, the campaign selector can choose the next visible chain quest.

## 54 — Stall, retry, and recovery
The campaign executor tracks objective progress. After 45 seconds without progress it marks the campaign stalled, cancels the quest executor, and applies a bounded retry backoff. The bot's normal objective brain can continue working the active quest during the cooldown.

## 55 — External AI campaign telemetry
External AI now receives:
- `campaign.executor_state`
- `campaign.target_guid`
- `campaign.target_entry`
- `campaign.retry_count`
- `campaign.stalled`

Existing TrinityCore systems remain authoritative for movement, combat, quest validation, inventory, loot, and quest rewards.

## Validation
- ZIP integrity tested with `unzip -t`.
- Structural C++ brace checks performed.
- This package was not built against a complete TrinityCore build tree in this environment, so API-level compile validation remains recommended before deployment.
