#define function%1(%2)                      forward%1(%2); public%1(%2)
#define RandomEx(%0,%1)                     (random((%1) - (%0)) + (%0))
#define HOLDING(%0)                         ((newkeys & (%0)) == (%0))
#define PRESSED(%0)                         (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define RELEASED(%0)                        (((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))
#define SendUsage(%0,%1)                    (SendClientMessagef(%0,-1,"{FFAF00}[USAGE]"COL_WHITE" " # %1))
#define SendError(%0,%1) 			        (SendClientMessagef(%0,-1,"{F81414}[ERROR]"COL_WHITE" " # %1))
#define SendServerMessage(%0,%1)            (SendClientMessagef(%0,-1,"{C0C0C0}[SERVER]"COL_WHITE" " # %1))
#define SendClientMessageToAllf(%0) (SendClientMessagef(INVALID_PLAYER_ID, %0))

SendClientMessagef( playerid, colour, const format[], va_args<> )
{
    static
		out[ 144 ];

    va_format( out, sizeof( out ), format, va_start<3> );

	if(playerid == INVALID_PLAYER_ID){
		return SendClientMessageToAll(colour, out);
	} else {
        return SendClientMessage(playerid, colour, out);
    }
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

stock GetRangeIP(szIP[ ], iSize = sizeof(szIP))
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
