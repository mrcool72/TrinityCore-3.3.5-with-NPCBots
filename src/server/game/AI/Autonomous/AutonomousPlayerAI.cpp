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
        // PlayerAI is a helper base and does not implement UpdateAI itself;
        // calling PlayerAI::UpdateAI() resolves to UnitAI's pure virtual method.
        // Run the normal player combat primitives here, then let the autonomous
        // controller handle the slower world/quest/social decisions.
        if (me && me->IsInWorld())
        {
            Unit* target = me->GetVictim();
            if (!target || !CanAIAttack(target) || !target->IsInWorld() || target->IsDead())
                target = SelectAttackTarget();

            if (target && CanAIAttack(target))
            {
                if (IsRangedAttacker())
                {
                    if (me->IsWithinLOSInMap(target))
                        AttackStartCaster(target, CASTER_CHASE_DISTANCE);
                    else
                        AttackStart(target);
                    DoRangedAttackIfReady();
                }
                else
                {
                    AttackStart(target);
                    DoAutoAttackIfReady();
                }
            }
        }

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
