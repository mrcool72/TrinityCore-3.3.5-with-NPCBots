#include "ScriptMgr.h"
#include "Player.h"

#include "AutonomousBotMgr.h"

class AutonomousBotWorldScript : public WorldScript
{
public:
    AutonomousBotWorldScript() : WorldScript("AutonomousBotWorldScript") { }

    void OnStartup() override
    {
        AutonomousAI::sAutonomousBotMgr.LoadProfiles();
    }

    void OnUpdate(uint32 diff) override
    {
        AutonomousAI::sAutonomousBotMgr.Update(diff);
    }

    void OnShutdown() override
    {
        AutonomousAI::sAutonomousBotMgr.StopAllHeadlessBots();
    }
};

class AutonomousBotPlayerScript : public PlayerScript
{
public:
    AutonomousBotPlayerScript() : PlayerScript("AutonomousBotPlayerScript") { }

    void OnLogin(Player* player, bool /*firstLogin*/) override
    {
        AutonomousAI::sAutonomousBotMgr.OnLogin(player);
    }

    void OnLogout(Player* player) override
    {
        AutonomousAI::sAutonomousBotMgr.OnLogout(player);
    }
};

void AddSC_autonomousbot_lifecycle()
{
    new AutonomousBotWorldScript();
    new AutonomousBotPlayerScript();
}
