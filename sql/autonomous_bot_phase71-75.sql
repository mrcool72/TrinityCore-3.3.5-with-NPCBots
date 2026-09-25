-- Phases 71-75: persistent route map, travel connections, danger-aware routing, and population route learning.
CREATE TABLE IF NOT EXISTS `autonomous_bot_route_nodes` (
  `map_id` int unsigned NOT NULL,
  `cell_x` int unsigned NOT NULL,
  `cell_y` int unsigned NOT NULL,
  `x` float NOT NULL DEFAULT 0,
  `y` float NOT NULL DEFAULT 0,
  `z` float NOT NULL DEFAULT 0,
  `o` float NOT NULL DEFAULT 0,
  `observations` int unsigned NOT NULL DEFAULT 0,
  `deaths` int unsigned NOT NULL DEFAULT 0,
  `danger` int unsigned NOT NULL DEFAULT 0,
  `objective_count` int unsigned NOT NULL DEFAULT 0,
  `last_seen` bigint unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`map_id`,`cell_x`,`cell_y`),
  KEY `idx_autonomous_route_nodes_recent` (`map_id`,`last_seen`),
  KEY `idx_autonomous_route_nodes_danger` (`map_id`,`danger`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `autonomous_bot_route_edges` (
  `from_map` int unsigned NOT NULL,
  `from_cell_x` int unsigned NOT NULL,
  `from_cell_y` int unsigned NOT NULL,
  `to_map` int unsigned NOT NULL,
  `to_cell_x` int unsigned NOT NULL,
  `to_cell_y` int unsigned NOT NULL,
  `traversals` int unsigned NOT NULL DEFAULT 0,
  `failures` int unsigned NOT NULL DEFAULT 0,
  `danger` int unsigned NOT NULL DEFAULT 0,
  `last_used` bigint unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`from_map`,`from_cell_x`,`from_cell_y`,`to_map`,`to_cell_x`,`to_cell_y`),
  KEY `idx_autonomous_route_edges_from` (`from_map`,`from_cell_x`,`from_cell_y`),
  KEY `idx_autonomous_route_edges_recent` (`last_used`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
