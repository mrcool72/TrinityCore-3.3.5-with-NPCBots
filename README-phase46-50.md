# Phases 46-50 — Autonomous Quest Campaign Engine

This cumulative package builds on Phases 41-45.

## Phase 46 — Quest-chain graph discovery
Adds `AutonomousQuestCampaignManager`, which follows TrinityCore quest template links (`NextQuestInChain` / `NextQuestId`) and exposes campaign metadata.

## Phase 47 — Cross-zone campaign planning
Campaign state persists as a target quest even when its giver/objective is not currently visible. Existing navigation/taxi managers remain responsible for physically reaching valid destinations; no teleportation is introduced.

## Phase 48 — Dependency-aware selection
Active quests and quest-chain continuation are preferred over unrelated candidates. Quest-level compatibility and nearby-giver distance contribute to candidate selection.

## Phase 49 — Dynamic reprioritization
The campaign is recomputed periodically. Active chains are retained while incomplete; completed/invalid chains can be replaced by another valid candidate. The manager does not silently abandon a server quest; quest state remains authoritative in TrinityCore.

## Phase 50 — End-to-end campaign telemetry
External AI receives `campaign` metadata: selected quest, next quest, chain length/progress, and campaign state. This provides the external AI enough context to decide the next concrete action without duplicating TrinityCore quest validation.
