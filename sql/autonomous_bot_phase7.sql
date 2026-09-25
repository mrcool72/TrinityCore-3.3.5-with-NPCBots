-- Phase 7 does not require schema changes beyond autonomous_bot_config.
-- Keep this migration as a marker so deployment scripts can apply Phase 7 cleanly.
-- The existing table remains the source of autonomous profiles.

ALTER TABLE `autonomous_bot_config`
  MODIFY COLUMN `personality` varchar(64) NOT NULL DEFAULT 'balanced';
