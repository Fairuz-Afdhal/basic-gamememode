#define function%1(%2)                      forward%1(%2); public%1(%2)
#define RandomEx(%0,%1)                     (random(%1 - %0 + 1) + %0)
#define HOLDING(%0)                         ((newkeys & (%0)) == (%0))
#define PRESSED(%0)                         (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define RELEASED(%0)                        (((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))
#define SendUsage(%0,%1)                    (va_SendClientMessage(%0,-1,"{FFAF00}[USAGE]"COL_WHITE" " # %1))
#define SendError(%0,%1) 			        (va_SendClientMessage(%0,-1,"{F81414}[ERROR]"COL_WHITE" " # %1))
#define SendServerMessage(%0,%1)            (va_SendClientMessage(%0,-1,"{C0C0C0}[SERVER]"COL_WHITE" " # %1))
#define thread                              function // used to look pretty for mysql
#define BCRYPT_COST 12

new Timestamp:gTime;

enum {
    ENEX_STREAMER_IDENTIFIER = 100,     // Entrance/Exits around San Fierro
    HOUSES_STREAMER_IDENTIFIER,         // Entrance/Exit for houses around San Andreas.
    FURNITURE_STREAMER_IDENTIFIER       // Furniture Objects
}

IsTextContainsIP(const string[])
{
    new Regex: r = Regex_New( "(.*?)([0-9]{1,3})\\.([0-9]{1,3})\\.([0-9]{1,3})\\.([0-9]{1,3})(.*?)" );

    new check = Regex_Check(string, r);

    Regex_Delete(r);
  
    return check;
}

Player_RangeBan(playerid)
{
	if (!IsPlayerConnected(playerid))
	    return 0;

	new szBan[ 24 ], szIP[ 16 ];

	GetPlayerIp(playerid, szIP, sizeof(szIP));
    GetRangeIP(szIP, sizeof(szIP));

	format(szBan, sizeof(szBan), "banip %s", szIP);
	SendRconCommand(szBan);

	KickPlayerTimed(playerid);

	return 1;
}

GetRangeIP(szIP[ ], iSize = sizeof(szIP))
{
	new
		iCount = 0
	;
	for(new i; szIP[ i ] != '\0'; i ++)
	{
	    if (szIP[i] == '.' && (iCount ++) == 1)
	    {
	        strdel(szIP, i, strlen( szIP));
	        break;
	    }
	}
	format(szIP, iSize, "%s.*.*", szIP);
}

IsValidSkin( skinid ) {
	return ! ( skinid == 74 || skinid > 311 || skinid < 0 );
}

forward OnServerUpdate();
task _OnServerTick[1000]()
{
	CallLocalFunction( "OnServerUpdate", "" );
    gTime = Now();
}

stock GetServerTime() 
	return _:gTime;

TimeConvert( seconds )
{
	new szTime[32];
 	format(szTime, sizeof(szTime), "%02d:%02d", floatround(seconds / 60), seconds - floatround((seconds / 60) * 60));
	return szTime;
}

randarg( ... )
	return getarg( random( numargs( ) ) );