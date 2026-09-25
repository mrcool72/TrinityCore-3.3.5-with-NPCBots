#include "AutonomousIntegrationManager.h"
#include "AutonomousBotProtocol.h"
#include "MotionMaster.h"
#include "ObjectAccessor.h"
#include "Player.h"
#include "GameObject.h"

namespace AutonomousAI
{
    void AutonomousIntegrationManager::Update(uint32 diff, Player* player, Perception const& perception, bool externalActive)
    {
        if (_timer > diff)
        {
            _timer -= diff;
            return;
        }
        _timer = 1200;
        _hasAction = false;
        _action = Action();
        _decision = "idle";

        if (!player || externalActive || !player->IsInWorld() || !player->IsAlive() || player->IsInCombat())
            return;

        // Dungeon navigation is owned by the dungeon/social managers. Do not
        // compete with their movement decisions here.
        if (perception.inDungeon)
            return;

        // Town/economy routing is already handled by AutonomousTownManager.
        if (perception.needsTown || perception.economyNeedsAttention)
            return;

        // If the resource manager identified a quest/world-object opportunity,
        // move to the object. The actual interaction remains server-authoritative.
        if (perception.resourceCandidateGuid && perception.resourceCandidateDistance > 6.0f)
        {
            if (GameObject* object = ObjectAccessor::GetGameObject(*player, ObjectGuid(perception.resourceCandidateGuid)))
            {
                _action.type = ActionType::MOVE_TO;
                _action.destination = object->GetPosition();
                _action.destination.mapId = player->GetMapId();
                _decision = "resource_object";
                _hasAction = true;
            }
        }

        // Prefer a persistent social companion when the relationship manager
        // says this is meaningful. MoveFollow lets TrinityCore own movement.
        if (!_hasAction && perception.preferredCompanionGuid && perception.socialScore >= 5)
        {
            if (Player* companion = ObjectAccessor::FindPlayer(ObjectGuid(perception.preferredCompanionGuid)))
            {
                if (companion->GetMapId() == player->GetMapId() && companion != player && companion->IsInWorld() && companion->IsAlive())
                {
                    player->GetMotionMaster()->MoveFollow(companion, 5.0f, 0.0f);
                    _decision = "follow_companion";
                }
            }
        }

        // Navigation plans produced by the world/goal system become concrete
        // TrinityCore movement only when there is no higher-priority action.
        if (!_hasAction && perception.navigationHasPlan && perception.navigationDestination.mapId == player->GetMapId())
        {
            Position const& destination = perception.navigationDestination;
            if (destination.x != 0.0f || destination.y != 0.0f || destination.z != 0.0f)
            {
                _action.type = ActionType::MOVE_TO;
                _action.destination = destination;
                _decision = perception.navigationStage.empty() ? "navigation" : perception.navigationStage;
                _hasAction = true;
            }
        }

        if (_hasAction || _decision != "idle")
            ++_decisionCount;
    }
}
