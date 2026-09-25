# Autonomous AI Phases 31-35

## Phase 31 — Multi-step navigation intent
Adds a navigation planner that classifies the bot's current travel stage as dungeon objective,
regroup, town, quest-chain, social, or exploration. It does not teleport or invent cross-map
coordinates. Existing TrinityCore movement and the existing travel manager remain authoritative.

## Phase 32 — Resource awareness
Adds nearby world-object opportunity awareness. Quest-linked gameobjects and other visible objects
are surfaced as resource/objective candidates so the external AI can decide what to investigate.
Actual interaction remains server-gated.

## Phase 33 — Economy readiness
Adds an economy-pressure model based on inventory space, pending equipment upgrades, and town
availability. This feeds the town/equipment systems without bypassing vendor or inventory rules.

## Phase 34 — Daily schedule
Adds a deterministic long-running life cycle with broad adventure/rest/social/town/exploration
schedule states. The cycle is server-time based and is intentionally not presented as the client's
in-game clock.

## Phase 35 — Life-cycle orchestration
Combines routine, long-term goal, navigation, resources, economy, social state, dungeon state, and
health into one externally visible life state. The external AI can use these signals for high-level
planning while TrinityCore continues to own movement, combat, spells, inventory, quests, and world
validation.

## Database
No database migration is required for this block. The lifecycle state is runtime planning state.
