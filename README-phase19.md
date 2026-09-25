# Autonomous AI Phase 19 — Loot & Dungeon Rewards

Phase 19 adds autonomous boss-loot handling and loot perception.

- Nearby creature perception now reports whether a corpse has loot, item count and gold.
- External AI can issue a `loot` action with a target GUID.
- The autonomous dungeon leader automatically navigates to and loots the most recent boss corpse when external AI is not driving the bot.
- TrinityCore's normal `LootItemInSlot`/inventory validation remains authoritative.
- Group loot/permission rules are not bypassed.
- Looted gold is credited through `Player::ModifyMoney`.
- Instance completed encounter mask is exposed so the external AI can reason about dungeon progression.

Example:

```json
{"action":"loot","target_guid":123456}
```

No database migration is required.
