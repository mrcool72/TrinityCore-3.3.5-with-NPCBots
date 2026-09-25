# Autonomous AI — Phase 12

Phase 12 adds persistent combat-role configuration so multi-role classes such as Paladin and Druid can be assigned deliberately instead of relying only on class-based inference.

## Roles

- `auto` — existing class-based detection.
- `tank` — tank assistance and taunt behavior.
- `healer` — party healing behavior.
- `ranged` — ranged role metadata and group assistance.
- `damage` — damage role.

## Commands

```text
.autobot edit role auto
.autobot edit role tank
.autobot edit role healer
.autobot edit role ranged
.autobot edit role damage
```

`list` and `info` now display the configured role. The role is persisted in `autonomous_bot_config` and applied when a controller attaches.

## Install

Start from the Phase 11 package, apply `sql/autonomous_bot_phase12.sql`, copy the changed source files, and rebuild `worldserver`.

No external AI protocol change is required. The existing `role` perception field continues to report the effective role.
