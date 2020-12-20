/* ** Includes ** */
#include 							< YSI_Coding\y_hooks >

#define SERVER_NAME					"West Java Cops and Robbers v3.0.0"
#define SERVER_MODE_TEXT 			"WJCNR"
#define SERVER_MAP 					"Los Santos"
#define SERVER_LANGUAGE				"Bahasa Indonesia"
#define SERVER_WEBSITE				"www.wjcnr.com"
#define SERVER_IP					"samp.wjcnr.com:7777"
#define UPDATE_CODENAME				""

/* ** Server Operator ** */
#define SERVER_OPERATOR 			"Fairuz"
#define SERVER_OPERATOR_ACC_ID 		1

#define SERVER_RULES_URL            "34.92.109.65/en_rules.txt"	
#define SERVER_CHANGES_DIRECTORY 	"changelogs"

/* ** Hooks ** */
hook OnGameModeInit( )
{
	// set server query information
	printf("[WJ-CNR] WJ-CNR successfully initialized. (Compiled date: %s %s)", __date,__time);

	//new modetext[32];
	//format(modetext, sizeof(modetext), ""SERVER_MODE_TEXT" %s "UPDATE_CODENAME"", GetServerVersion());
	SetGameModeText( "Cops and Robbers" );
	SetServerRule( "hostname", SERVER_NAME );
	SetServerRule( "language", SERVER_LANGUAGE );
	SetServerRule( "mapname", SERVER_MAP );

	// simple gameplay rules
	UsePlayerPedAnims( );
	AllowInteriorWeapons( 0 );
	EnableStuntBonusForAll( 0 );
	DisableInteriorEnterExits( );

	// start ColAndreas
	//CA_Init();

	return true;
}

SetServerRule( const rule[ ], const value[ ] ) {
	return SendRconCommand( sprintf( "%s %s", rule, value ) );
}