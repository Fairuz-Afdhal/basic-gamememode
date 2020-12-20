#include <YSI_Coding\y_hooks>

static  p_Kills[MAX_PLAYERS],
        p_Deaths[MAX_PLAYERS],
        p_Skin[MAX_PLAYERS];
new     Float: p_LastPosX[MAX_PLAYERS],
        Float: p_LastPosY[MAX_PLAYERS],
        Float: p_LastPosZ[MAX_PLAYERS];

hook OnPlayerLogin(playerid, accid)
{
    inline _LoadData()
    {
        if(cache_num_rows())
        {
            new score, cash, kills, deaths, class, wanted, pos[32];

            Player_SetAccountID(playerid, accid);
            cache_get_value_int(0, "score", score);
            cache_get_value_int(0, "money", cash);
            cache_get_value_int(0, "kills", kills);
            cache_get_value_int(0, "deaths", deaths);
            cache_get_value(0, "lastpos", pos);
            cache_get_value_int(0, "class", class);
            cache_get_value_int(0, "wanted", wanted);
            sscanf(pos, "p<,>fff", p_LastPosX[playerid], p_LastPosY[playerid], p_LastPosZ[playerid]);

            Player_SetKills(playerid, kills);
            Player_SetDeaths(playerid, deaths);
            SetPlayerScore(playerid, score);
            SetPlayerCash(playerid, cash);
            Player_SetClass(playerid, class);
            SetPlayerWantedLevel(playerid, wanted);

            mysql_tquery(g_SQL, sprintf("UPDATE users SET lastlogged=%d WHERE id=%d", GetServerTime(), accid), "", "");
        }
    }
    MySQL_TQueryInline(g_SQL, using inline _LoadData, "SELECT * FROM users where id = %d", accid);
}

hook OnPlayerConnect(playerid)
{
	ResetPlayerCash(playerid);
}

ptask Player_SavePosition[5000](playerid) 
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    mysql_tquery(g_SQL, sprintf("UPDATE users SET lastpos='%f,%f,%f' WHERE id=%d", x,y,z, Player_GetAccountID(playerid)), "", "");
}


Player_SetKills(playerid, value)
    return p_Kills[playerid] = value;
Player_SetDeaths(playerid, value)
    return p_Deaths[playerid] = value;

Player_GiveScore( playerid, score )
{ 
    SetPlayerScore( playerid, GetPlayerScore( playerid ) + score );
    mysql_tquery(g_SQL, sprintf("UPDATE users SET score=%d WHERE id=%d", GetPlayerScore(playerid), Player_GetAccountID(playerid)), "", "");
}

Player_GiveKill(playerid)
{
    p_Kills[playerid] ++;
    mysql_tquery(g_SQL, sprintf("UPDATE users SET kills=%d WHERE id=%d", Player_GetKills(playerid), Player_GetAccountID(playerid)), "", "");
}

Player_GiveDeath(playerid)
{
    p_Deaths[playerid] ++;
    mysql_tquery(g_SQL, sprintf("UPDATE users SET deaths=%d WHERE id=%d", Player_GetDeaths(playerid), Player_GetAccountID(playerid)), "", "");
}

Player_GetKills(playerid)
    return p_Kills[playerid];

Player_GetDeaths(playerid)
    return p_Deaths[playerid];

