#!/usr/bin/env python3
"""
Minimal test server for Autonomous AI Phase 2.

Run:
    python3 autonomous_ai_test_server.py

It accepts one JSON perception per line and returns a simple action.
Replace choose_action() with your real AI client.
"""

import json
import socketserver


def choose_action(perception):
    # Demonstration only: keep the bot moving in a small square.
    p = perception.get("position", {})
    x = float(p.get("x", 0.0))
    y = float(p.get("y", 0.0))
    z = float(p.get("z", 0.0))
    map_id = int(p.get("map_id", 0))

    return {
        "action": "move_to",
        "destination": {
            "map_id": map_id,
            "x": x + 5.0,
            "y": y,
            "z": z,
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
        print("Autonomous AI test server listening on 127.0.0.1:8765")
        server.serve_forever()
