# Autonomous AI — Phases 20–22

Cumulative package based on the Phase 17–19 build.

## Phase 20
Advanced quest-chain awareness, item-objective grinding fallback, and runtime world memory.

## Phase 21
External planner contract with long-term goals, routines, progression counters and recommended quests.

## Phase 22
Persistent-world behavior foundation for routines, regional memory and future schedules/relationships.

No database migration is required. Runtime memory intentionally resets when the world process restarts; the existing autonomous bot profile database remains the persistent identity/configuration layer.


## Phase 23-26

The cumulative package adds world travel, town-service awareness, conservative equipment upgrades, and persistent world memory. Apply `sql/autonomous_bot_phase23-26.sql` to the World database.


## Phases 27-30
Persistent relationships, social memory, stable routines, and long-term goal planning are included in `README-phase27-30.md`. Apply `sql/autonomous_bot_phase27-30.sql`.

## Phases 31-35 — world lifecycle and simulation

Adds high-level navigation stages, resource/objective awareness, economy pressure, long-running
schedule state, and a unified life-cycle state. These are planning signals; TrinityCore remains
authoritative for actual movement, combat, inventory, quests, and interactions.

## Phases 36-40
Added autonomous action integration, world-object approach, social follow execution, navigation execution, and integration telemetry. See `README-phase36-40.md`.

## Phases 41-45

Added real taxi travel, cross-map exploration via known taxi paths, authoritative vendor/repair/bank service execution, expanded external actions, and a protocol-level integration test harness. See `README-phase41-45.md`.
