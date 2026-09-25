-- Phase 12: explicit combat-role override.
-- auto preserves class-based role detection; tank/healer/ranged/damage force a role.

ALTER TABLE `autonomous_bot_config`
  ADD COLUMN `role` varchar(16) NOT NULL DEFAULT 'auto' AFTER `personality`;
