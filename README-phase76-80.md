# Autonomous AI — Phases 76–80

## 76 — Actionable-goal route priority
Route planning now gives visible quest turn-ins and acceptances priority over opportunistic learned-route exploration.

## 77 — Completion-first routing
A nearby quest that can be completed receives higher route priority than a merely available quest, reducing unnecessary wandering.

## 78 — Route-memory fallback
Persistent population route memory remains available when there is no immediately actionable quest or learned campaign objective.

## 79 — Safe route behavior
The existing danger/death scoring remains authoritative for learned route candidates; route-memory exploration is only a fallback.

## 80 — Execution continuity
The existing TrinityCore MotionMaster/taxi execution path continues to consume the unified route planner without handing authoritative movement to the external AI.

## Validation
This phase was applied directly to the current `autonomous-ai` branch. A full TrinityCore compile/runtime test still needs to be performed on a complete build environment.

## Reliability hardening

- Death sampling is deduplicated so one corpse produces one death penalty.
- A route edge receives a failure/danger penalty when a bot becomes stuck for 15 seconds.
- Failed edge information is persisted for population-wide reuse.
