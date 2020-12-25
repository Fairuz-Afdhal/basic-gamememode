#include 		< YSI_Coding\y_hooks >

/* ** Variables ** */
static p_Class[MAX_PLAYERS];

enum {
    CLASS_CIVILIAN = 0,
    CLASS_POLICE,
	CLASS_MEDIC
}

/* ** Hooks ** */
hook OnPlayerConnect(playerid)
{
	TogglePlayerSpectating(playerid, true);
	defer Camera_Login(playerid);
}

hook OnPlayerRequestClass(playerid, classid)
{
	SetSpawnInfo(playerid, 0, Player_GetSkin(playerid), p_LastPosX[playerid], p_LastPosY[playerid], p_LastPosZ[playerid], 10.0, 0, 0, 0, 0, 0, 0);
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
}

SetPlayerColorToTeam( playerid )
{
/*#if defined __cnr__chuffsec
	if ( IsPlayerSecurityDriver( playerid ) ) return SetPlayerColor( playerid, COLOR_SECURITY );
#endif*/
	switch( p_Class[ playerid ] )
	{
	    case CLASS_POLICE:
	    {
	    	SetPlayerColor( playerid, COLOR_POLICE );
			//if ( p_inFBI{ playerid } ) SetPlayerColor( playerid, COLOR_FBI );
			//if ( p_inCIA{ playerid } ) SetPlayerColor( playerid, COLOR_CIA );
			//if ( p_inArmy{ playerid } ) SetPlayerColor( playerid, COLOR_ARMY );
	    }
		case CLASS_MEDIC:
		{
			SetPlayerColor(playerid, COLOR_MEDIC);
		}
	    default:
	    {
	    	new
	    		default_color = COLOR_DEFAULT;

	    	// set color according to wanted level
			if ( GetPlayerWantedLevel(playerid) >= 12 ) default_color = COLOR_WANTED12;
			else if ( GetPlayerWantedLevel(playerid) >= 6 ) default_color = COLOR_WANTED6;
			else if ( GetPlayerWantedLevel(playerid) >= 1 ) default_color = COLOR_WANTED2;
		    //else if ( p_GangID[ playerid ] != INVALID_GANG_ID ) default_color = g_gangData[ p_GangID[ playerid ] ] [ E_COLOR ];

		    // set alpha for invisible players to 0
	    	//if ( IsPlayerHiddenFromRadar( playerid ) ) {
	    		//default_color = setAlpha( default_color, 0x00 );
	    	//}

	    	// force the color on the player
	    	return SetPlayerColor( playerid, default_color);
		}
	}
	return 1;
}

timer Camera_Login[300](playerid) 
{
	InterpolateCameraPos(playerid, 1343.996948, -1400.121704, 33.326297, 654.371826, -1400.027343, 32.899177, 15000);
	InterpolateCameraLookAt(playerid, 1339.470458, -1400.027832, 31.204380, 659.131347, -1400.744018, 31.545204, 5000);	
}

Player_GetClass(playerid)
	return p_Class[playerid];

Player_SetClass(playerid, class)
	return p_Class[playerid] = class;