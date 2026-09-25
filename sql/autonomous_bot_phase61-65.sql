-- Phases 61-65: shared learned world locations for quest objectives.
CREATE TABLE IF NOT EXISTS `autonomous_bot_quest_knowledge` (
  `quest_id` int unsigned NOT NULL,
  `entry` int unsigned NOT NULL,
  `map_id` int unsigned NOT NULL,
  `x` float NOT NULL DEFAULT 0,
  `y` float NOT NULL DEFAULT 0,
  `z` float NOT NULL DEFAULT 0,
  `o` float NOT NULL DEFAULT 0,
  `observations` int unsigned NOT NULL DEFAULT 0,
  `last_seen` bigint unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`quest_id`,`entry`,`map_id`),
  KEY `idx_autonomous_quest_knowledge_entry` (`entry`,`map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
