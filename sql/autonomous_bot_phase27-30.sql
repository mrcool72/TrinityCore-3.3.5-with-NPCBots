-- Autonomous AI Phases 27-30: persistent relationships, routines, and goals.
CREATE TABLE IF NOT EXISTS `autonomous_bot_relationships` (
  `bot_guid` bigint unsigned NOT NULL,
  `other_guid` bigint unsigned NOT NULL,
  `score` int NOT NULL DEFAULT 0,
  `interactions` int unsigned NOT NULL DEFAULT 0,
  `preferred` tinyint unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`bot_guid`, `other_guid`),
  KEY `idx_autonomous_relationship_bot_score` (`bot_guid`, `preferred`, `score`, `interactions`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
