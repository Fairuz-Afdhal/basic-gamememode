/* ** Includes ** */
#include 							< YSI_Coding\y_hooks >

/* ** Definitions ** */
#define MAX_WANTED_LVL 				2048

static	PlayerText: p_WantedLevelTD		[ MAX_PLAYERS ],
		p_WantedLevel[MAX_PLAYERS];

/* ** Hooks ** */

hook OnPlayerConnect( playerid )
{
    ClearPlayerWantedLevel( playerid );

	p_WantedLevelTD[ playerid ] = CreatePlayerTextDraw( playerid, 555.000000, 124.000000, "_" );
	PlayerTextDrawAlignment( playerid, p_WantedLevelTD[ playerid ], 2 );
	PlayerTextDrawBackgroundColor( playerid, p_WantedLevelTD[ playerid ], 255 );
	PlayerTextDrawFont( playerid, p_WantedLevelTD[ playerid ], 2 );
	PlayerTextDrawLetterSize( playerid, p_WantedLevelTD[ playerid ], 0.280000, 1.299999 );
	PlayerTextDrawColor( playerid, p_WantedLevelTD[ playerid ], -1872621313 );
	PlayerTextDrawSetOutline( playerid, p_WantedLevelTD[ playerid ], 1 );
	PlayerTextDrawSetProportional( playerid, p_WantedLevelTD[ playerid ], 1 );
	PlayerTextDrawSetSelectable( playerid, p_WantedLevelTD[ playerid ], 0 );
}

hook OnPlayerRequestClass(playerid, classid)
{
	PlayerTextDrawHide( playerid, p_WantedLevelTD[ playerid ] );
}

hook OnPlayerFirstSpawn(playerid)
{
	// Show wanted level
	if(p_WantedLevel[ playerid ])
	{
		new string[16];
		format(string, sizeof(string), "] %d ]", p_WantedLevel[playerid]);
		PlayerTextDrawSetString( playerid, p_WantedLevelTD[ playerid ], string);
		PlayerTextDrawShow( playerid, p_WantedLevelTD[ playerid ] );
	}
}

/* ** Hooked Functions ** */
hook function GetPlayerWantedLevel( playerid )
{
	return p_WantedLevel[ playerid ]; // force the variable
}

hook function SetPlayerWantedLevel( playerid, level)
{
	p_WantedLevel[playerid] = level;
    if ((p_WantedLevel[playerid]) < 0 ) // prevent negative wanted level
    	p_WantedLevel[playerid] = 0;

	if (p_WantedLevel[playerid] > 0)
	{
		if (Player_IsSpawned(playerid))
		{
			PlayerTextDrawSetString(playerid, p_WantedLevelTD[playerid], sprintf( "] %d ]", p_WantedLevel[playerid]));
			//if ( ! IsPlayerMovieMode( playerid ) ) PlayerTextDrawShow( playerid, p_WantedLevelTD[ playerid ] );
		}
	}
	else
	{
		PlayerTextDrawHide( playerid, p_WantedLevelTD[ playerid ] );
		//Uncuff( playerid ); // player is not wanted, so auto uncuff
	}
	SetPlayerColorToTeam(playerid);
	return continue(playerid, level);
}

/* ** Functions ** */
stock GivePlayerWantedLevel(playerid, level )
{
	if ( ! IsPlayerConnected( playerid ) || IsPlayerNPC( playerid ) || IsPlayerJailed( playerid ) || IsPlayerDueling( playerid ) || level == 0  || p_Class[ playerid ] != CLASS_CIVILIAN)
	    return 0;
	
	new
		current_wanted = GetPlayerWantedLevel( playerid );

	SendClientMessageFormatted( playerid, -1, ""COL_GOLD"[CRIME]"COL_WHITE" Your wanted level has been %s by %d! Wanted level: %d", current_wanted + level > current_wanted ? ( "increased" ) : ( "decreased" ), level, current_wanted + level );
	SetPlayerWantedLevel( playerid, current_wanted + level);
	return 1;
}


stock ClearPlayerWantedLevel( playerid )
{
	PlayerTextDrawHide( playerid, p_WantedLevelTD[ playerid ] );
    p_WantedLevel[ playerid ] = 0;
	SetPlayerWantedLevel( playerid, 0 );
	SetPlayerColorToTeam( playerid );
}

stock IsWantedPlayerInVehicle( vehicleid )
{
	foreach ( new pID : Player )
	{
		if ( GetPlayerVehicleID( pID ) == vehicleid && GetPlayerWantedLevel( pID ) > 1 )
			return true;
	}
	return false;
}