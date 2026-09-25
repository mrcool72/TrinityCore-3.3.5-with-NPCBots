# Autonomous AI Phases 41-45 — World Travel, Services, and End-to-End Integration

Built cumulatively on Phase 36-40.

## Phase 41 — Real taxi travel

`AutonomousTaxiManager` adds authoritative TrinityCore taxi execution.

- Finds the nearest taxi node using `ObjectMgr::GetNearestTaxiNode`.
- Detects nearby flight masters from normal world perception.
- Moves to the flight master before requesting a taxi route.
- Uses `Player::ActivateTaxiPathTo` rather than teleporting the bot.
- External AI can request a source/destination taxi-node pair.
- Local exploration can select a known direct taxi destination on another map.

No teleport shortcut is used.

## Phase 42 — Cross-zone exploration bridge

Known taxi nodes become a legitimate cross-map travel mechanism. This closes the major gap between same-map movement and autonomous multi-zone movement while retaining TrinityCore's normal taxi validation, cost, path, mount, and proximity checks.

## Phase 43 — Actual town services

`AutonomousServiceManager` executes server-authoritative service operations when the bot is in interaction range:

- open vendor list
- sell poor-quality inventory items when inventory pressure is high
- repair all gear at repair-capable NPCs
- open bank at banker NPCs

The external AI can request `sell_junk`, `repair`, or `open_bank`, but the core still validates the NPC, distance, flags, and player state.

## Phase 44 — Expanded protocol

New actions:

```json
{"action":"taxi","taxi_source_node":1,"taxi_destination_node":2}
{"action":"sell_junk","target_guid":123}
{"action":"repair","target_guid":456}
{"action":"open_bank","target_guid":789}
```

New perception telemetry:

- taxi availability/state/source/destination
- destination map
- flight-master distance
- junk sold count
- repair count
- bank-open state
- last service

## Phase 45 — Integration test harness

Added:

- `tools/autonomous_ai_test_server.py`
- `tools/autonomous_ai_e2e.py`

The test server can exercise demo, economy, repair, bank, and taxi action modes. The validator checks that the new perception sections are present in captured frames.

## Important safety/authority boundary

The external AI chooses intentions. TrinityCore remains authoritative for:

- taxi path validity and availability
- flight-master proximity
- vendor/repair/banker interaction permissions
- item selling
- durability repair
- inventory changes
- movement execution

This phase does not add teleport-based zone travel.
