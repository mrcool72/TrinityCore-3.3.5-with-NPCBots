# Autonomous AI — Phases 71–75

## 71 — Persistent zone/objective map
Autonomous bots record persistent 50-yard world cells, observations, objective density, danger, and deaths in `autonomous_bot_route_nodes`.

## 72 — Discovered travel connections
Population movement creates directed connections between observed cells in `autonomous_bot_route_edges`.

## 73 — Danger/death-aware routing
Route nodes accumulate danger from hostile density, combat, low health, and observed deaths. Planning discounts dangerous and repeatedly fatal areas.

## 74 — Population-wide route learning
All autonomous bots reuse the same persisted route database, so repeated observations improve route memory for later bots.

## 75 — Unified autonomous route planner
The planner combines learned campaign objectives, persistent route memory, visible quest givers, cross-zone intent, and danger history. TrinityCore remains authoritative for movement, taxi execution, combat, and quest validation.

## SQL
Apply `sql/autonomous_bot_phase71-75.sql` after the Phase 66–70 migration.

## Validation
The implementation was checked against the current `autonomous-ai` branch APIs. A full TrinityCore compile/runtime test still needs to be performed on a complete build environment.
