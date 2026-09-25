#!/usr/bin/env python3
"""
Autonomous AI protocol test server.

Modes:
  demo      - small movement loop (default)
  economy   - asks the bot to sell junk when inventory is tight
  repair    - asks the bot to repair at a repair NPC
  bank      - asks the bot to open a bank
  taxi      - asks the bot to fly between explicit taxi nodes supplied by env vars

The server never bypasses TrinityCore validation; it only emits protocol actions.
"""

import json
import os
import socketserver

MODE = os.environ.get("AUTONOMOUS_TEST_MODE", "demo")
TAXI_SOURCE = int(os.environ.get("AUTONOMOUS_TAXI_SOURCE", "0"))
TAXI_DESTINATION = int(os.environ.get("AUTONOMOUS_TAXI_DESTINATION", "0"))


def choose_action(perception):
    if MODE == "economy":
        for npc in perception.get("nearby_creatures", []):
            if npc.get("guid") and npc.get("vendor", False):
                return {"action": "sell_junk", "target_guid": npc["guid"]}

    if MODE == "repair":
        for npc in perception.get("nearby_creatures", []):
            if npc.get("guid") and npc.get("repair", False):
                return {"action": "repair", "target_guid": npc["guid"]}

    if MODE == "bank":
        for npc in perception.get("nearby_creatures", []):
            if npc.get("guid") and npc.get("banker", False):
                return {"action": "open_bank", "target_guid": npc["guid"]}

    if MODE == "taxi" and TAXI_SOURCE and TAXI_DESTINATION:
        return {
            "action": "taxi",
            "taxi_source_node": TAXI_SOURCE,
            "taxi_destination_node": TAXI_DESTINATION,
        }

    p = perception.get("position", {})
    return {
        "action": "move_to",
        "destination": {
            "map_id": int(p.get("map_id", 0)),
            "x": float(p.get("x", 0.0)) + 5.0,
            "y": float(p.get("y", 0.0)),
            "z": float(p.get("z", 0.0)),
            "orientation": 0.0,
        },
    }


class Handler(socketserver.StreamRequestHandler):
    def handle(self):
        for raw in self.rfile:
            try:
                perception = json.loads(raw.decode("utf-8"))
                action = choose_action(perception)
                self.wfile.write((json.dumps(action) + "\n").encode("utf-8"))
                self.wfile.flush()
            except Exception as exc:
                self.wfile.write(
                    (json.dumps({"action": "stop", "text": str(exc)}) + "\n").encode("utf-8")
                )
                self.wfile.flush()


class Server(socketserver.ThreadingTCPServer):
    allow_reuse_address = True


if __name__ == "__main__":
    with Server(("127.0.0.1", 8765), Handler) as server:
        print(f"Autonomous AI test server listening on 127.0.0.1:8765 mode={MODE}")
        server.serve_forever()
