# Phases 36-40 — Autonomous Integration and End-to-End Behavior

Built on Phase 31-35.

## Phase 36 — Autonomous action integration
A server-side integration manager turns navigation/resource/social state into concrete TrinityCore movement when external AI is unavailable. External AI remains authoritative when connected.

## Phase 37 — World-object approach
Nearby resource/world-object candidates can become movement targets. Actual interaction remains governed by TrinityCore.

## Phase 38 — Social follow integration
Persistent companion relationships can cause the bot to use TrinityCore `MoveFollow` rather than repeatedly issuing raw movement points.

## Phase 39 — Goal/navigation execution
Navigation destinations produced by the world/goal system are now consumed by a local action layer, reducing the gap between planning and actual movement.

## Phase 40 — Integration telemetry
External perception now exposes the current local integration decision and decision count, making end-to-end debugging easier.

## Safety/authority
This block does not add teleportation, database bypasses, fake quest completion, or client-side authority. Cross-map travel remains intentionally unimplemented until a safe 3.3.5-compatible travel/flight abstraction is verified against the target checkout.
