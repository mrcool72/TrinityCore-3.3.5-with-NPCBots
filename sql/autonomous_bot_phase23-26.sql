-- Autonomous AI Phases 23-26: travel, town services, equipment, persistent memory.
CREATE TABLE IF NOT EXISTS `autonomous_bot_memory` (
  `guid` bigint unsigned NOT NULL,
  `last_map` int unsigned NOT NULL DEFAULT 0,
  `completed_quests` int unsigned NOT NULL DEFAULT 0,
  `last_completed_quest` int unsigned NOT NULL DEFAULT 0,
  `routine` varchar(32) NOT NULL DEFAULT 'idle',
  `long_term_goal` varchar(255) NOT NULL DEFAULT '',
  `visited_maps` text NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
