#include <YSI_Coding\y_hooks>

new
    BitArray:PlayerSpawn<MAX_PLAYERS>;

hook OnPlayerConnect(playerid)
{
    Bit_Set(PlayerSpawn, playerid, false);
    return 1;
}

hook OnPlayerSpawn(playerid)
{
    Bit_Set(PlayerSpawn, playerid, true);
    return 1;
}

hook OnPlayerDeathEx( playerid, killerid, reason, Float: damage, bodypart )
{
    Bit_Set(PlayerSpawn, playerid, false);
    return 1;
}

KickPlayer( playerid )
{
    SetPVarInt( playerid, "banned_connection", 1 );
    Kick( playerid );
    return 1;
}

timer Player_Kick[500](playerid)
{
	KickPlayer(playerid);
} 

forward OnPlayerUpdateEx(playerid);
ptask PlayerPerSecondTimer[1000](playerid) {
    if(Player_IsSpawned(playerid)) {
        CallLocalFunction("OnPlayerUpdateEx", "i", playerid);
    }
}

Player_IsSpawned(playerid) return Bit_Get(PlayerSpawn, playerid);