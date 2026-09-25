-- Autonomous AI Phase 5: persistent bot profiles.
-- Import into the World database used by this TrinityCore server.

CREATE TABLE IF NOT EXISTS `autonomous_bot_config` (
  `guid` bigint unsigned NOT NULL,
  `name` varchar(12) NOT NULL,
  `host` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `port` smallint unsigned NOT NULL DEFAULT 8765,
  `enabled` tinyint unsigned NOT NULL DEFAULT 0,
  `personality` varchar(32) NOT NULL DEFAULT 'balanced',
  PRIMARY KEY (`guid`),
  KEY `idx_autonomous_bot_enabled` (`enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
