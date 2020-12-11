/* ** Includes ** */
#include 							< YSI_Coding\y_hooks >

/* ** Hooks ** */
hook OnPlayerConnect(playerid)
{
    new query[256];

	// Ultra fast queries...
	mysql_format(handle, query, sizeof(query), "SELECT * FROM bans WHERE (name='%e' OR ip='%e') LIMIT 0,1", ReturnPlayerName(playerid), ReturnPlayerIP(playerid));
	mysql_tquery(handle, query, "Banning_CheckPlayerBan", "i", playerid);
    return 1;
}

hook OnPlayerPassedBanCheck( playerid )
{
	new query[ 144 ];
	mysql_format( dbHandle, query, sizeof( query ), "SELECT name FROM users WHERE name = '%e' LIMIT 0,1", ReturnPlayerName( playerid ) );
	mysql_tquery( dbHandle, query, "OnPlayerRegisterCheck", "i", playerid );
	return 1;
}

/* ** Functions ** */

/* ** SQL Threads ** */
thread Banning_CheckPlayerBan(playerid)
{
	new rows;
	cache_get_row_count(rows);

	if (rows)
	{
	    new
			bannedUser[24],
			bannedIP[16],
			bannedbyUser[24],
			bannedReason[50],
			bannedExpire = 0,
		;

		cache_get_value_int(0, "EXPIRE", bannedExpire);
		cache_get_value_name(0, "BANBY", bannedbyUser);
		cache_get_value_name(0, "REASON", bannedReason);
		cache_get_value_name(0, "NAME", bannedUser);
		cache_get_value_name(0, "IP", bannedIP);

		if ( !bannedExpire )
		{
			new string[512];
            format(string, sizeof(string), ""COL_WHITE"You are banned from this server.\n"COL_WHITE"If you feel wrongfully banned, please appeal at "COL_BLUE"WJCNR.COM"COL_WHITE"\n\n"COL_RED"Username:"COL_WHITE" %s\n"COL_RED"IP Address:"COL_WHITE" %s\n", bannedUser, bannedIP );
			format(string, sizeof(string), "%s"COL_RED"Reason:"COL_WHITE" %s\n"COL_RED"Server:"COL_WHITE" %s\n"COL_RED"Banned by:"COL_WHITE" %s%s", string, bannedReason, GetServerName( server ), bannedbyUser, strmatch( ReturnPlayerName( playerid ), bannedUser ) ? ("") : ( serial ? ("\n\n"COL_RED"Our ban evasion system picked you up! If this is in error then please visit our forums.") : ("\n\n"COL_RED"Your IP Address is banned, if this is a problem then visit our forums.") ) );
		    ShowPlayerDialog(playerid, DIALOG_BANNED, DIALOG_STYLE_MSGBOX, ""COL_WHITE"Ban Information", string, "Okay", "" );
		    defer Player_Kick(playerid);
		}
		else
		{
			if (GetServerTime() > bannedExpire)
			{
				new query[128];
				SendServerMessage(playerid, "The suspension of this account has expired as of now, this account is available for playing." );
				mysql_format(handle, query, sizeof(query), "DELETE FROM `BANS` WHERE `NAME`= '%e' OR `IP` = '%e'", ReturnPlayerName(playerid), ReturnPlayerIP(playerid));
                mysql_tquery(handle, query, "", "");
			}
		    else
			{
				new string[512];
                format(string, sizeof(string), ""COL_WHITE"You are suspended from this server.\n"COL_WHITE"If you feel wrongfully suspended, please appeal at "COL_BLUE"WJCNR.com"COL_WHITE"\n\n"COL_RED"Username:"COL_WHITE" %s\n"COL_RED"IP Address:"COL_WHITE" %s\n", bannedUser, bannedIP );
				format(string, sizeof(string), "%s"COL_RED"Reason:"COL_WHITE" %s\n"COL_RED"Server:"COL_WHITE" %s\n"COL_RED"Suspended by:"COL_WHITE" %s\n"COL_RED"Expire Time:"COL_WHITE" %s%s", string, bannedReason, GetServerName( server ), bannedbyUser, secondstotime( bannedExpire - GetServerTime( ) ), strmatch( ReturnPlayerName( playerid ), bannedUser ) ? (" ") : ("\n\n"COL_RED"Your IP Address is suspended, if this is a problem, visit our forums."));
			    ShowPlayerDialog( playerid, DIALOG_BANNED, DIALOG_STYLE_MSGBOX, ""COL_WHITE"Suspension Information", string, "Okay", "" );
		      	defer Player_Kick(playerid);
			}
		}
	}
	InterpolateCameraPos(playerid, 1343.996948, -1400.121704, 33.326297, 654.371826, -1400.027343, 32.899177, 15000);
	InterpolateCameraLookAt(playerid, 1339.470458, -1400.027832, 31.204380, 659.131347, -1400.744018, 31.545204, 5000);		
	CallLocalFunction("OnPlayerPassedBanCheck", "d", playerid);
	return 1;
}

thread OnAdvanceBanCheck(playerid, szBannedBy[], szReason[], szIP[])
{
	new szPlayerNameBanned[MAX_PLAYER_NAME], szSerial[41], rows;
	GetPlayerName(playerid, szPlayerNameBanned, MAX_PLAYER_NAME);

	cache_get_row_count(rows);
	if (rows)
        SendError(playerid, "Player ini telah dibanned");

	else
	{

		new szCountry[16], query[512];
		GetIpCountry(szIP, szCountry, sizeof (szCountry));
		mysql_format( handle, query, sizeof( query ), "INSERT INTO `BANS`(`NAME`,`IP`,`REASON`,`BANBY`,`DATE`,`EXPIRE`,`SERVER`,`SERIAL`,`COUNTRY`) VALUES ('%e','%e','%e','%e',%d,%d,0,'%e','%e')", szPlayerNameBanned, szIP, szReason, szBannedBy, GetServerTime( ), lol_time, szSerial, szCountry );
		mysql_tquery(handle, query, "", "");
	}
	defer Player_Kick( playerid );
    return 1;
}

thread OnUserAvailabilityCheck(adminid, target_user[], szBannedBy[], szReason[], szIP[] )
{
	new rows;
	cache_get_row_count(rows);
	if(rows)
	{
		new query[256], szlastIP[ 24 ];
		cache_get_value( 0, "LAST_IP", szlastIP );

		mysql_format( handle, query, sizeof( query ), "SELECT `NAME` FROM `BANS` WHERE `NAME` = '%e' LIMIT 0,1", target_user );
		mysql_tquery( handle, query, "OnBannedCheck", "issss", adminid, target_user, szBannedBy, szReason, szlastIP );		
		return 1;
	}
	else return SendError( adminid, "User tidak ditemukan.");
}

thread OnBannedCheck(adminid, target_user[], szBannedBy[], szReason[], szlastIP[])
{
	new rows;
	cache_get_row_count( rows );
	if( rows ) return SendError(adminid, "User ini sudah dibanned.");
	
	new query[512];
	mysql_format( handle, query, sizeof( query ), "INSERT INTO `BANS`(`NAME`,`IP`,`REASON`,`BANBY`,`DATE`,`EXPIRE`) VALUES ('%e','%e','%e','%e',%d,0)", target_user, szlastIP, szReason, szBannedBy, GetServerTime( ) );
	mysql_tquery(handle, query, "", "");

	AddAdminLogLineFormatted( "%s(%d) has offline banned %s", ReturnPlayerName( adminid ), adminid, target_user );
	if ( !p_AdminHide[adminid]){
		SendGlobalMessage( -1, ""COL_PINK"[ADMIN]"COL_WHITE" %s has banned %s "COL_GREEN"[REASON: %s]", ReturnPlayerName( adminid ), target_user, szReason );
	} else {
		SendGlobalMessage( -1, ""COL_PINK"[ADMIN]"COL_WHITE" Admin has banned %s "COL_GREEN"[REASON: %s]", target_user, szReason );		
	}
	return 1;
}