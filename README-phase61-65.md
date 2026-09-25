# Autonomous AI Phases 61-65

This cumulative package builds on Phases 56-60.

## 61 - Shared quest-world knowledge
Bots now learn authoritative world positions when a visible creature or gameobject satisfies an active quest objective.

## 62 - Persistent objective locations
Learned quest/objective locations are persisted in `autonomous_bot_quest_knowledge`, shared across autonomous bots.

## 63 - Known-objective navigation
When an objective target is temporarily outside perception but a learned location exists on the current map, the bot navigates to the learned position instead of wandering blindly.

## 64 - Cross-map knowledge routing
When a learned objective location is on another map, the campaign travel fallback asks the taxi manager for a known taxi destination on that exact map. No coordinates are invented.

## 65 - External AI knowledge telemetry
Perception now exposes whether campaign objective knowledge exists, its map/location, and the total learned knowledge count.

SQL migration:
`sql/autonomous_bot_phase61-65.sql`

This package has not been full-compiled against a complete TrinityCore checkout.
