#include "AutonomousHeadlessPlayer.h"

#include "CharacterCache.h"
#include "CharacterPackets.h"
#include "DatabaseEnv.h"
#include "Log.h"
#include "ObjectMgr.h"
#include "World.h"
#include "Player.h"
#include "WorldSession.h"

namespace AutonomousAI
{
    bool CreateAutonomousCharacter(uint32 accountId, std::string const& name, uint8 race, uint8 classId, uint8 gender, ObjectGuid& outGuid)
    {
        if (!accountId || name.empty() || !sObjectMgr->GetPlayerInfo(race, classId))
            return false;

        if (ObjectMgr::CheckPlayerName(name, sWorld->GetDefaultDbcLocale(), true) != CHAR_NAME_SUCCESS)
            return false;

        if (sCharacterCache->GetCharacterCacheByName(name))
            return false;

        CharacterDatabasePreparedStatement* checkName = CharacterDatabase.GetPreparedStatement(CHAR_SEL_CHECK_NAME);
        checkName->setString(0, name);
        if (CharacterDatabase.Query(checkName))
            return false;

        auto session = std::make_unique<WorldSession>(accountId, std::string("AutonomousAI"), nullptr,
            SEC_PLAYER, 2, 0, Minutes(0), LOCALE_enUS, 0, false);

        WorldPackets::Character::CharacterCreateInfo createInfo;
        createInfo.Name = name;
        createInfo.Race = race;
        createInfo.Class = classId;
        createInfo.Sex = gender;
        createInfo.Skin = 0;
        createInfo.Face = 0;
        createInfo.HairStyle = 0;
        createInfo.HairColor = 0;
        createInfo.FacialHairStyle = 0;

        auto player = std::make_unique<Player>(session.get());
        player->GetMotionMaster()->Initialize();

        ObjectGuid guid = sObjectMgr->GetGenerator<HighGuid::Player>().Generate();
        if (!player->Create(guid.GetCounter(), &createInfo))
            return false;

        player->SetAtLoginFlag(AT_LOGIN_FIRST);

        CharacterDatabaseTransaction transaction = CharacterDatabase.BeginTransaction();
        player->SaveToDB(transaction, true);
        CharacterDatabase.CommitTransaction(transaction);

        outGuid = player->GetGUID();
        sCharacterCache->AddCharacterCacheEntry(outGuid, accountId, player->GetName(), player->GetNativeGender(),
            player->GetRace(), player->GetClass(), player->GetLevel());

        TC_LOG_INFO("entities.player.character", "Autonomous AI created character: {} {} (account {})",
            player->GetName(), outGuid.ToString(), accountId);

        player->CleanupsBeforeDelete();
        player.reset();
        return true;
    }
}
