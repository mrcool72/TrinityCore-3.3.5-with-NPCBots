# Autonomous AI Phases 27-30

## Phase 27 - Persistent NPC/bot relationships
- Adds `AutonomousRelationshipManager`.
- Persists pairwise relationship score, interaction count, and preferred-companion state.
- Autonomous group formation now biases toward companions with positive history and preferred relationships.
- Relationship state is exposed to the external AI as social perception.

## Phase 28 - Bot-to-bot social memory
- Successful autonomous group formation records bilateral interactions for every pair.
- External AI receives preferred companion GUID/name, aggregate social score, and interaction count.
- TrinityCore remains authoritative over actual group membership.

## Phase 29 - Persistent routines
- Adds `AutonomousRoutineManager`.
- Routines are stable rather than switching every update tick: recovery, dungeon, town, social, questing, and exploring.
- Existing memory persistence stores the selected routine.

## Phase 30 - Long-term goals
- Adds `AutonomousGoalManager`.
- Goals are derived from the current routine and persistent world state.
- Reports goal progress for dungeon completion, recovery, town restocking, social play, active quest chains, and exploration.
- Existing memory persistence stores the current long-term goal.

## Database
Apply `sql/autonomous_bot_phase27-30.sql` to the world database.

## External AI additions
The perception payload now includes:
- `world.goal_progress`
- `social.preferred_companion_guid`
- `social.preferred_companion_name`
- `social.score`
- `social.interactions`

These phases intentionally do not invent chat, teleportation, or client-side social behavior. TrinityCore remains authoritative for groups and world state.
