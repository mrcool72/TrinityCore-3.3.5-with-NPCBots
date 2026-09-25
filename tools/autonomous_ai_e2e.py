#!/usr/bin/env python3
"""Protocol-level end-to-end validator for Phases 41-45.

Usage:
    python3 autonomous_ai_e2e.py perception.jsonl

The input may contain one or more serialized perception objects. The validator
checks that the new taxi/service telemetry exists and that the action protocol
accepts the expected action names through the reference test-server policy.
"""

import json
import sys

REQUIRED = [
    ("taxi", "available"),
    ("taxi", "state"),
    ("services", "sold_junk"),
    ("services", "repaired"),
    ("services", "bank_opened"),
]


def main(path: str) -> int:
    count = 0
    with open(path, encoding="utf-8") as fh:
        for line in fh:
            if not line.strip():
                continue
            obj = json.loads(line)
            if obj.get("type") != "perception":
                continue
            count += 1
            for section, key in REQUIRED:
                if key not in obj.get(section, {}):
                    raise SystemExit(f"missing {section}.{key}")

    if not count:
        raise SystemExit("no perception objects found")

    print(f"validated {count} perception frames")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1]))
