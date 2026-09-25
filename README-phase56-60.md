# Autonomous AI — Phases 56–60

Cumulative package based on Phases 51–55.

## 56 — Campaign objective navigation
Adds `AutonomousCampaignNavigationManager` to translate the authoritative campaign target into local movement/attack actions when external AI is not active.

## 57 — Objective visibility/search state
The campaign navigator reports `target_not_visible`, `searching_objective`, `travel_to_objective`, `attack_objective`, and related states through perception.

## 58 — Cross-zone search hop
When an objective remains outside current perception for 20 seconds, the local AI may request a known, reachable taxi node on another map. No quest coordinates are invented; normal perception is rebuilt after arrival.

## 59 — Campaign execution integration
Campaign navigation runs alongside the existing quest executor and does not replace TrinityCore quest validation or interaction.

## 60 — External telemetry
Adds `campaign.navigation_state` to the JSON perception payload and keeps search progress observable.

## Validation
- ZIP archive integrity checked with `unzip -t`.
- Structural brace checks performed on changed C++ files.
- This package has not been full-compiled against a complete TrinityCore checkout.
