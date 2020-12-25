/* ** Includes ** */
#include 							< YSI_Coding\y_hooks >

/* ** Variables ** */
static
	Text: g_WorldDayTD,
	g_WorldClockSeconds = 0,
	g_WorldDayCount = 0,
	g_WorldWeather = 10
;

/* ** Hooks ** */
hook OnGameModeInit()
{
   	g_WorldDayTD = TextDrawCreate(501.000000, 6.000000, "Monday");
	TextDrawBackgroundColor(g_WorldDayTD, 255);
	TextDrawFont(g_WorldDayTD, 3);
	TextDrawLetterSize(g_WorldDayTD, 0.5, 2.0);
	TextDrawSetOutline(g_WorldDayTD, 2);
	TextDrawSetProportional(g_WorldDayTD, 1);
}

hook OnPlayerConnect(playerid)
{
	UpdatePlayerTime(playerid);
}

hook OnPlayerUpdateEx(playerid)
{
    SetPlayerWeather(playerid, ( GetPlayerInterior( playerid ) || GetPlayerVirtualWorld( playerid ) ) ? 1 : g_WorldWeather );
    UpdatePlayerTime(playerid);
}

hook OnServerUpdate()
{
    // set the world time at the query
	SendRconCommand( sprintf( "worldtime %s, %s", GetDayToString(g_WorldDayCount), TimeConvert(g_WorldClockSeconds++)));

 	if(g_WorldClockSeconds >= 1440)
 	{
 		// call a function when the server day ends
 		CallLocalFunction( "OnServerGameDayEnd", "");
 	    g_WorldClockSeconds = 0;
        g_WorldDayCount = (g_WorldDayCount == 6 ? 0 : g_WorldDayCount + 1);
		g_WorldWeather = randarg(1, 4, 7, 10, 11, 12);
		TextDrawSetString(g_WorldDayTD, GetDayToString(g_WorldDayCount));
	}
}

hook OnPlayerSpawn(playerid)
{
	TogglePlayerClock(playerid, true);
}

hook PlayerTextdraw_Load(playerid)
{
	TextDrawShowForPlayer(playerid, g_WorldDayTD);
}

hook PlayerTextdraw_Unload(playerid)
{
	TextDrawHideForPlayer(playerid, g_WorldDayTD);
}

/* ** Functions ** */
stock GetDayToString(day)
{
	static
	    string[ 10 ];

	switch( day )
	{
		case 0: string = "Monday";
		case 1: string = "Tuesday";
		case 2: string = "Wednesday";
		case 3: string = "Thursday";
		case 4: string = "Friday";
		case 5: string = "Saturday";
		case 6: string = "Sunday";
		default: string = "Bugged";
	}
	return string;
}

stock UpdatePlayerTime( playerid ) {
    return SetPlayerTime( playerid, floatround( g_WorldClockSeconds / 60 ), g_WorldClockSeconds - floatround( ( g_WorldClockSeconds / 60 ) * 60 ) );
}

stock SetWorldWeather( weatherid ) {
    g_WorldWeather = weatherid;
}

stock SetWorldClock( seconds ) {
    g_WorldClockSeconds = ! ( 0 <= seconds <= 1440 ) ? 0 : seconds;
}