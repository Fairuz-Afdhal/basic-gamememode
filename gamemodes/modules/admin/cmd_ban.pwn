/* ** Functions ** */
stock OfflineBan(adminid, target_user[], szBannedBy[], szReason[])
{
	new query[256];
	mysql_format(handle, query, sizeof( query ), "SELECT name, last_ip FROM users WHERE name='%e' LIMIT 0,1", target_user);
	mysql_tquery(handle, query, "OnUserAvailabilityCheck", "isss", adminid, target_user, szBannedBy, szReason);
	return 1;
}

stock AdvancedBan(playerid, szBannedBy[], szReason[], szIP[ ])
{
	new
		szPlayerNameBanned[ MAX_PLAYER_NAME ], query[256];

	GetPlayerName( playerid, szPlayerNameBanned, MAX_PLAYER_NAME );

	mysql_format(handle, query, sizeof(query), "SELECT name FROM bans WHERE name='%e' LIMIT 0,1", szPlayerNameBanned);
	mysql_tquery(handle, query, "OnAdvanceBanCheck", "isssi", playerid, szBannedBy, szReason, szIP);
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

		new query[512];
		mysql_format( handle, query, sizeof( query ), "INSERT INTO bans(name,ip,reason,banby,date,expire) VALUES ('%e','%e','%e','%e',%d,%d)", szPlayerNameBanned, szIP, szReason, szBannedBy, GetServerTime() );
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
		cache_get_value(0, "LAST_IP", szlastIP );

		mysql_format(handle, query, sizeof( query ), "SELECT `NAME` FROM `BANS` WHERE `NAME` = '%e' LIMIT 0,1", target_user);
		mysql_tquery(handle, query, "OnBannedCheck", "issss", adminid, target_user, szBannedBy, szReason, szlastIP);		
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
	mysql_format(handle, query, sizeof( query ), "INSERT INTO `BANS`(`NAME`,`IP`,`REASON`,`BANBY`,`DATE`,`EXPIRE`) VALUES ('%e','%e','%e','%e',%d,0)", target_user, szlastIP, szReason, szBannedBy, GetServerTime( ) );
	mysql_tquery(handle, query, "", "");
	return 1;
}