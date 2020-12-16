#include 		< YSI_Coding\y_hooks >

/* ** Variables ** */


/* ** Hooks ** */
hook OnPlayerConnect(playerid)
{
	TogglePlayerSpectating(playerid, true);
	defer Camera_Login(playerid);
	return 1;
}

hook OnPlayerRequestClass(playerid, classid)
{
    SetSpawnInfo(playerid, 0, 270, p_LastPosX[playerid], p_LastPosY[playerid], p_LastPosZ[playerid], 10.0, 0, 0, 0, 0, 0, 0);
	SpawnPlayer(playerid);
	return 0;
}

hook OnPlayerRequestSpawn(playerid)
{
	if(!Player_IsLoggedIn(playerid))
		return 0;
	return 1;
}

hook OnPlayerLogin(playerid, accountid)
{
	
	TogglePlayerSpectating(playerid, false);
	return 1;
}

timer Camera_Login[300](playerid) 
{
	InterpolateCameraPos(playerid, 1343.996948, -1400.121704, 33.326297, 654.371826, -1400.027343, 32.899177, 15000);
	InterpolateCameraLookAt(playerid, 1339.470458, -1400.027832, 31.204380, 659.131347, -1400.744018, 31.545204, 5000);
	return 1;	
}