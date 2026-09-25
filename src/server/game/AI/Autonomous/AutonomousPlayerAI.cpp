/*
 * Autonomous PlayerAI implementation.
 */

#include "AutonomousPlayerAI.h"

#include "AutonomousBotController.h"

#include "Player.h"

namespace AutonomousAI
{
    AutonomousPlayerAI::AutonomousPlayerAI(Player* player) :
        PlayerAI(player),
        _controller(nullptr),
        _goal(GoalType::NONE),
        _thinkTimer(1000)
    {
    }

    AutonomousPlayerAI::~AutonomousPlayerAI() = default;

    void AutonomousPlayerAI::UpdateAI(uint32 diff)
    {
        // Preserve TrinityCore's normal PlayerAI combat loop. The autonomous
        // controller is intentionally a slow high-level loop.
        PlayerAI::UpdateAI(diff);

        if (!_controller || !me || !me->IsInWorld())
            return;

        if (_thinkTimer > diff)
        {
            _thinkTimer -= diff;
            return;
        }

        _thinkTimer = 1000;
        _controller->Update(diff);
    }
}
