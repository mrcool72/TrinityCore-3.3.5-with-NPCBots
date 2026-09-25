/*
 * Autonomous PlayerAI.
 */

#ifndef TRINITY_AUTONOMOUS_PLAYER_AI_H
#define TRINITY_AUTONOMOUS_PLAYER_AI_H

#include "PlayerAI.h"

#include "AutonomousBotProtocol.h"

class Player;

namespace AutonomousAI
{
    class AutonomousBotController;

    class AutonomousPlayerAI final : public PlayerAI
    {
    public:
        explicit AutonomousPlayerAI(Player* player);
        ~AutonomousPlayerAI() override;

        void UpdateAI(uint32 diff) override;

        AutonomousBotController* GetController() const { return _controller; }
        void SetController(AutonomousBotController* controller) { _controller = controller; }

        GoalType GetGoal() const { return _goal; }
        void SetGoal(GoalType goal) { _goal = goal; }

    private:
        AutonomousBotController* _controller;
        GoalType _goal;
        uint32 _thinkTimer;
    };
}

#endif
