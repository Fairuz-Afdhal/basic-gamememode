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

#include    < log-plugin >
#include    < a_mysql >
#include    < samp_bcrypt >

#include    < YSI_Coding\y_hooks >
#include    < YSI_Coding\y_timers >
#include    < YSI_Coding\y_va >
#include 	< YSI_Data\y_iterate >
#include	< YSI_Data\y_bit >
#include    < YSI_Visual\y_dialog >
#include    < YSI_Visual\y_inline >
#include    < YSI_Extra\y_inline_bcrypt >
#include    < YSI_Extra\y_inline_mysql >

#include 	< izcmd >
#include 	< sscanf2 >
#include 	< streamer >
#include    < Pawn.Regex >
#include    < md-sort >
#include    < formatex >
#include    < strlib >
#include    < Pawn.Raknet >
#include    < gvar >
#include    < geolite >
#include    < chrono >
#include    < progress2 >

#include    <server>
#include    <gta>
#include    <player>
//#include    <admin>
#include    <objects>

main() {}

public OnGameModeInit()
{
    return 1;
}

public OnPlayerConnect(playerid)
{
    return 1;
}

public OnPlayerRequestSpawn(playerid)
{
    return 1;
}

public OnPlayerSpawn(playerid)
{
 	CallLocalFunction("PlayerTextdraw_Load", "d", playerid);
    return 1;
}

public OnPlayerUpdate(playerid)
{
    return 1;
}

public OnPlayerUpdateEx(playerid)
{
    return 1;
}

public OnPlayerDamage(&playerid, &Float:amount, &issuerid, &weapon, &bodypart)
{
    return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    Player_GiveDeath(playerid);
    Player_GiveKill(killerid);
    return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
    SetPlayerPosFindZ(playerid, fX, fY, fZ);
	printf("Admin %s Teleported To %f, %f, %f", ReturnPlayerName(playerid), fX, fY, fZ);
	return 1;
}

CMD:kill(playerid, params[])
{
    new Float:health;
    GetPlayerHealth(playerid, health);
    DamagePlayer(playerid, health);
    return 1;
}

CMD:slap(playerid, params[])
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    SetPlayerPos(playerid, x, y, z + 25.0);
    return 1;
}