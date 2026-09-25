# Autonomous AI Phase 18 — Encounter Coordination

Phase 18 extends encounter behavior around the dungeon boss lifecycle.

- Exposes the current boss cast spell ID and remaining cast timer when available.
- Autonomous bots with a known interrupt spell can attempt to interrupt boss casts.
- Existing tank, healer, ranged and melee positioning remains authoritative through TrinityCore movement/combat APIs.
- Emergency group healing remains active before positioning/interrupt decisions.
- Boss state remains visible to the external AI for higher-level encounter decisions.

Interrupt spell selection is capability-driven: the bot only attempts a spell if that spell is actually known by the character.
