#include <YSI_Coding\y_hooks>

new
    BitArray:PlayerSpawn<MAX_PLAYERS>,
    BitArray:PlayerJustConnected<MAX_PLAYERS>;

forward OnPlayerFirstSpawn(playerid);


hook OnPlayerConnect(playerid)
{
    Bit_Set(PlayerSpawn, playerid, false);
    Bit_Set(PlayerJustConnected, playerid, true);
}

hook OnPlayerSpawn(playerid)
{
    Bit_Set(PlayerSpawn, playerid, true);
	if(Bit_Get(PlayerJustConnected, playerid))
	{
	    Bit_Set(PlayerJustConnected, playerid, false);
        CallLocalFunction( "OnPlayerFirstSpawn", "d", playerid);
    }
}

hook OnPlayerDeath( playerid, killerid, reason, Float: damage, bodypart )
{
    Bit_Set(PlayerSpawn, playerid, false);
}

forward OnPlayerUpdateEx(playerid);
ptask PlayerPerSecondTimer[1000](playerid) {
    if(Player_IsSpawned(playerid)) {
        CallLocalFunction("OnPlayerUpdateEx", "i", playerid);
    }
}

public OnPlayerFirstSpawn(playerid)
{
    return 1;
}

Player_IsSpawned(playerid) return Bit_Get(PlayerSpawn, playerid);

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