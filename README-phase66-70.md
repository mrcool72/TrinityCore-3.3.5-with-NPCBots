# Autonomous AI — Phases 66–70

## 66 — Objective confidence
Learned quest-objective locations now expose a confidence value derived from repeated observations and recency.

## 67 — Multiple objective locations
Objective knowledge is stored in 25-yard spatial cells, allowing multiple hunting areas for the same quest/objective instead of overwriting one coordinate per map.

## 68 — Objective density
Repeated observations create a density signal. Local navigation prefers useful, recent, sufficiently observed areas rather than blindly using the first coordinate learned.

## 69 — Shared population knowledge
Controllers now use the process-wide `sAutonomousQuestKnowledgeMgr`, so all autonomous bots share the in-memory knowledge cache as well as the database-backed knowledge table.
Legacy Phase 61 knowledge remains readable.

## 70 — Learned campaign routing telemetry
The external AI protocol now receives confidence and density for the selected learned location. This gives an external planner enough information to choose between known objective areas and maps.

## SQL
Apply `sql/autonomous_bot_phase66-70.sql` after the Phase 61–65 migration.

## Validation
The package was structurally checked, but it was not full-compiled against a complete TrinityCore checkout.
