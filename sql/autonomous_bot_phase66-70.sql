-- Phases 66-70: confidence, multiple locations, shared population knowledge.
CREATE TABLE IF NOT EXISTS `autonomous_bot_quest_locations` (
  `quest_id` int unsigned NOT NULL,
  `entry` int unsigned NOT NULL,
  `map_id` int unsigned NOT NULL,
  `cell_x` int unsigned NOT NULL,
  `cell_y` int unsigned NOT NULL,
  `x` float NOT NULL DEFAULT 0,
  `y` float NOT NULL DEFAULT 0,
  `z` float NOT NULL DEFAULT 0,
  `o` float NOT NULL DEFAULT 0,
  `observations` int unsigned NOT NULL DEFAULT 0,
  `last_seen` bigint unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`quest_id`,`entry`,`map_id`,`cell_x`,`cell_y`),
  KEY `idx_autonomous_quest_locations_entry_map` (`entry`,`map_id`),
  KEY `idx_autonomous_quest_locations_recent` (`quest_id`,`entry`,`last_seen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
