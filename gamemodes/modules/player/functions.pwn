timer Player_Kick[500](playerid)
{
	KickPlayer(playerid);
} 

KickPlayer( playerid )
{
    SetPVarInt( playerid, "banned_connection", 1 );
    Kick( playerid );
    return 1;
}