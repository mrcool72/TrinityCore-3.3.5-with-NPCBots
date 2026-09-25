# Autonomous AI Phase 25 — Equipment Progression

Phase 25 adds conservative automatic equipment upgrades.

- Scans the main inventory for equippable items.
- Uses TrinityCore `FindEquipSlot` and `CanEquipItem` validation.
- Equips an item only when its base item level exceeds the currently equipped item in the selected slot.
- Reports upgrade activity and inventory space to the external AI.

No custom item-stat or class-validity rules override TrinityCore.
