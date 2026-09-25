# Autonomous AI Phase 26 — Persistent Memory

Phase 26 persists a lightweight world-memory record in the World database.

Stored state includes:

- last map
- completed quest count
- last completed quest
- current routine
- long-term goal
- visited map IDs

Migration: `sql/autonomous_bot_phase23-26.sql`.

The memory layer is intentionally compact. It is a foundation for richer NPC relationships, remembered locations, preferences, and long-term behavior in later phases.
