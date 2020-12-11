            /* ** Main Configurations ** */
//#pragma dynamic 7200000*/
#pragma warning	disable 214, 239
#define YSI_NO_VERSION_CHECK
#define YSI_NO_HEAP_MALLOC
#define YSI_NO_CACHE_MESSAGE

        /* ** SA-MP Includes ** */
#include        < a_samp >

#undef MAX_PLAYERS
#define MAX_PLAYERS 200

#include    < YSI_Coding\y_hooks >
#include    < YSI_Coding\y_timers >
#include    < YSI_Coding\y_va >
#include 	< YSI_Data\y_iterate >
#include	< YSI_Data\y_bit >
#include    < YSI_Visual\y_classes >

#include    < a_mysql >
#include 	< izcmd >
#include 	< sscanf2 >
#include 	< streamer >
#include    < Pawn.Regex >
#include    < md-sort >
#include    < formatex >
#include    < strlib >
#include    < Pawn.Raknet >
#include    < gvar >
#include    <geolite>

#include    <server>
#include    <player>
#include    <gta>


main() {}

public OnGameModeInit()
{
    return 1;
}

public OnPlayerConnect(playerid)
{
    return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
    printf("OnPlayerRequestClass %d %d", playerid, classid);
    return 1;
}

public OnPlayerRequestSpawn(playerid)
{
    return 1;
}

public OnPlayerSpawn(playerid)
{
    return 1;
}

public OnPlayerUpdate(playerid)
{
    return 1;
}

public OnPlayerTakePlayerDamage( playerid, issuerid, &Float: amount, weaponid, bodypart )
{
    return 1;
}

public OnPlayerDeathEx( playerid, killerid, reason, Float: damage, bodypart )
{
    return 1;
}
