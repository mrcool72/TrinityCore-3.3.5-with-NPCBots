# Autonomous AI Phase 20 — Advanced Questing & World Planning

Phase 20 adds quest-chain awareness and a lightweight persistent-in-runtime world planner.

- Quest metadata now exposes previous/next quest relationships and quest level.
- The local brain prefers continuation quests when they are visible.
- Item objectives can trigger conservative nearby hostile hunting when the actual drop source is not visible.
- World memory tracks completed quests, last completed quest, and visited maps for the current autonomous runtime.
- A long-term goal/routine is exposed to the external AI.
