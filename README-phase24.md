# Autonomous AI Phase 24 — Town Services

Phase 24 adds town-service awareness.

- Detects nearby vendors, bankers, and innkeepers.
- When inventory space is nearly exhausted, the local controller can route toward a nearby vendor/banker/innkeeper.
- The external AI can inspect the service GUID/type and make the higher-level decision.
- Actual vendor, bank, repair, and gossip permissions remain TrinityCore-authoritative.

Perception adds `town.needs_town`, `town.service_guid`, and `town.service_type`.
