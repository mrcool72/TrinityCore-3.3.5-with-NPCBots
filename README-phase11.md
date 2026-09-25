# Autonomous AI — Phase 11

Phase 11 adds role-aware group combat behavior while keeping TrinityCore authoritative over combat.

## Combat roles

- `tank`: Warrior, Paladin, Death Knight, Druid
- `healer`: Priest, Shaman, Paladin, Druid
- `ranged`: Hunter, Mage, Warlock, Priest, Shaman
- `damage`: remaining classes

Because TrinityCore 3.3.5 can have different talent/spec configurations, this is intentionally a conservative class-based role layer rather than pretending to infer a perfect spec.

## Behavior

- Healers watch group members and cast a known healing spell when a nearby member falls below 70% health.
- Tanks assist group targets and periodically use a known taunt when available.
- Damage/ranged bots assist group combat targets.
- Existing PlayerAI continues to handle the detailed attack/rotation loop.
- External AI perception now contains `role` so the external service can make role-aware decisions.
- Spells are only cast when the character actually knows the spell ID.

## Install

Start from the Phase 10 package. Replace/add the files in this package and rebuild `worldserver`.
No database migration is required for Phase 11.

## Example external perception

```json
{
  "type": "perception",
  "bot_guid": 123,
  "level": 42,
  "class_id": 5,
  "role": "healer",
  "health": 3100,
  "max_health": 5000
}
```
