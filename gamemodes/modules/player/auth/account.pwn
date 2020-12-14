/* ** Includes ** */
#include 							< YSI_Coding\y_hooks >

static BitArray: p_PlayerLogged< MAX_PLAYERS >,
		p_AccountID[ MAX_PLAYERS ];

/* ** Hooks ** */
hook OnPlayerConnect(playerid)
{
	inline OnPlayerBannedCheck()
	{
        if (cache_num_rows())
		{
			new
				bannedUser[24],
				bannedIP[16],
				bannedbyUser[24],
				bannedReason[50],
				Timestamp: bannedExpire = Timestamp:0,
				bannedexpireDate[64];
			
			cache_get_value_int(0, "EXPIRE", _:bannedExpire);
			cache_get_value_name(0, "BANBY", bannedbyUser);
			cache_get_value_name(0, "REASON", bannedReason);
			cache_get_value_name(0, "NAME", bannedUser);
			cache_get_value_name(0, "IP", bannedIP);
		
			if (!bannedExpire)
			{
				new string[512];
				format(string, sizeof(string), ""COL_WHITE"You are banned from this server.\n"COL_WHITE"If you feel wrongfully banned, please appeal at "COL_BLUE"WJCNR.COM"COL_WHITE"\n\n"COL_RED"Username:"COL_WHITE" %s\n"COL_RED"IP Address:"COL_WHITE" %s\n", bannedUser, bannedIP );
				format(string, sizeof(string), "%s"COL_RED"Reason:"COL_WHITE" %s\n"COL_RED"Banned by:"COL_WHITE" %s\n\n"COL_RED"Your IP Address is banned, if this is a problem then visit our forums.", string, bannedReason, bannedbyUser);
				Dialog_Show(playerid, DIALOG_STYLE_MSGBOX, ""COL_WHITE"Ban Information", string, "Okay", "");
				defer Player_Kick(playerid);
			}
			else
			{
				if (GetServerTime() > _:bannedExpire)
				{
					new query[256];
					SendServerMessage(playerid, "The suspension of this account has expired as of now, this account is available for playing." );
					mysql_format(g_SQL, query, sizeof(query), "DELETE FROM `BANS` WHERE `NAME`= '%e' OR `IP` = '%e'", ReturnPlayerName(playerid), ReturnPlayerIP(playerid));
					mysql_tquery(g_SQL, query, "", "");
					return 1;
				}
				else
				{
					new string[512];
					TimeFormat(bannedExpire, ISO6801_FULL_LOCAL, bannedexpireDate);
					format(string, sizeof(string), ""COL_WHITE"You are suspended from this server.\n"COL_WHITE"If you feel wrongfully suspended, please appeal at "COL_BLUE"WJCNR.com"COL_WHITE"\n\n"COL_RED"Username:"COL_WHITE" %s\n"COL_RED"IP Address:"COL_WHITE" %s\n", bannedUser, bannedIP );
					format(string, sizeof(string), "%s"COL_RED"Reason:"COL_WHITE" %s\n"COL_RED"Suspended by:"COL_WHITE" %s\n"COL_RED"Expire Time:"COL_WHITE" %s%s", string, bannedReason, bannedbyUser, bannedexpireDate, isequal(ReturnPlayerName( playerid ), bannedUser) ? (" ") : ("\n\n"COL_RED"Your IP Address is suspended, if this is a problem, visit our forums."));
					Dialog_Show(playerid, DIALOG_STYLE_MSGBOX, ""COL_WHITE"Suspension Information", string, "Okay", "" );
					defer Player_Kick(playerid);
				}
			}
		}
		else{
			InterpolateCameraPos(playerid, 1343.996948, -1400.121704, 33.326297, 654.371826, -1400.027343, 32.899177, 15000);
			InterpolateCameraLookAt(playerid, 1339.470458, -1400.027832, 31.204380, 659.131347, -1400.744018, 31.545204, 5000);		
			CallLocalFunction("OnPlayerPassedBanCheck", "d", playerid);
		}
	}

	static const query[] = "SELECT * FROM bans WHERE (name='%e' OR ip='%e') LIMIT 0,1";
	MySQL_TQueryInline(g_SQL, using inline OnPlayerBannedCheck, query, ReturnPlayerName(playerid), ReturnPlayerIP(playerid));
    return 1;
}

hook OnPlayerPassedBanCheck( playerid )
{
	inline OnPlayerDataLoad()
	{
		if(cache_num_rows())
		{
			Account_LoginDialog(playerid);
		}
		else
		{
			Account_RegisterDialog(playerid);
		}
	}
	static const query[] = "SELECT name FROM users WHERE name = '%e' LIMIT 0,1";
	MySQL_TQueryInline(g_SQL, using inline OnPlayerDataLoad, query, ReturnPlayerName(playerid));
	return 1;
}
/* ** Functions ** */
Account_RegisterDialog(playerid)
{
	inline _response(response, listitem, string:inputtext[])
	#pragma unused listitem
	{
		if(!response){
            Kick(playerid);
		}
		else
		{
			Account_Create(playerid, inputtext);
		}
	}
    
	new string[256];
	format(string, sizeof(string), ""COL_WHITE"Akun ("COL_RED"%s"COL_WHITE") belum teregistrasi.\n\n"COL_RED"Password harus 3-24 karakter.\n\n"COL_GREY"Jangan pernah share password dengan siapapun!", ReturnPlayerName(playerid));
	Dialog_ShowCallback(playerid, using inline _response, DIALOG_STYLE_INPUT, ""COL_WHITE"Account - Register", string, "Register", "Leave");
	return 1;
}

Account_Create(playerid, password[])
{
	if (!(3 <= strlen(password) <= 24)) {
    	SendError(playerid, "Invalid length on the password. It should be between 3-24 characters" );
   		Account_RegisterDialog(playerid);
	}
    inline const OnPasswordHash(string:hash[])
    {
        Account_InsertToDatabase(playerid, hash);
    }
    BCrypt_HashInline(password, BCRYPT_COST, using inline OnPasswordHash);	
}

Account_InsertToDatabase(playerid, const hash[]) 
{
    inline const OnRegister() {
        Player_SetAccountID(playerid, cache_insert_id());

		
        CallLocalFunction("OnPlayerRegister", "i", playerid);
        TogglePlayerSpectating(playerid, false);
        Bit_Set(p_PlayerLogged, playerid, true);
        
    }

	static const query[] = "INSERT INTO users (name, password) VALUES ('%e', '%e')";
	MySQL_TQueryInline(g_SQL, using inline OnRegister, query, ReturnPlayerName(playerid), hash);
}

Account_LoginDialog(playerid)
{
	inline _response(response, listitem, string:inputtext[])
	{
		#pragma unused listitem
		if(!response)
		{
			inline _anotherresponse(response2, listitem2, string:inputtext2[]) 
			#pragma unused listitem2, response2, inputtext2
			{
      			Kick(playerid);
			}
			Dialog_ShowCallback(playerid, using inline _anotherresponse, DIALOG_STYLE_MSGBOX, ""COL_WHITE"Account - Authentication", ""COL_WHITE"Are you sure you want to leave the server?", "Yes", "No" );

		}
		else{
			if(isnull(inputtext)){
				SendError(playerid, "Password tidak bisa kosong.");
			}

			inline const _response_load()
			{
				if (!cache_num_rows()){
					// There was an error loading the data.  Try again.
					SendError(playerid, "Login failed - please try again.");
					Account_LoginDialog(playerid);
					return;
				}

				// Get the password hash and unique (user) ID.
				new accid,
					hash[128];
				
				if (!cache_get_value(0, "password", hash) || !cache_get_value_int(0, "id", accid)){
					// There was an error loading the data.  Try again.
					SendError(playerid, "Login failed - please try again.");
					Account_LoginDialog(playerid);
					return;
				}
		
				// Called when the comparison between the stored and entered
				// passwords is complete (so the login is complete).
				inline const Account_PasswordCheck(bool:same)
				{
					// Are the passwords the same?
					if (same){
						// The player logged in.  Tell everything else so they can
						// respond appropriately (start loading data etc.)
						CallLocalFunction("OnPlayerLogin", "dd", playerid, accid);
					}
					else
					{
						SendError(playerid, "Login failed - unknown username or password.");
						
						// Try again.
						Account_LoginDialog(playerid);
					}
				}
				
				// Check that the DB hash is equal to `inputtext` after hashing.
				BCrypt_CheckInline(inputtext, hash, using inline Account_PasswordCheck);
			}

			MySQL_TQueryInline(g_SQL, using inline _response_load, "SELECT `password`, `id` FROM `users` WHERE `name` = '%e'", ReturnPlayerName(playerid));
		}
	}

	new string[256];
	format(string, sizeof(string), ""COL_WHITE"Akun ("COL_GREEN"%s"COL_WHITE") telah teregistrasi.\n\
	Masukan password untuk login.\n\n\
	"COL_GREY"Jika kamu bukan pemilik akun ini, keluar lalu masuk dengan nickname lain.", ReturnPlayerName(playerid));
	Dialog_ShowCallback(playerid, using inline _response, DIALOG_STYLE_PASSWORD, ""COL_WHITE"Account - Authentication", string, "Login", "Leave");
}

Player_IsLoggedIn(playerid) return Bit_Get(p_PlayerLogged, playerid);

Player_SetAccountID(playerid, value) {
    return p_AccountID[playerid] = value;
}

Player_GetAccountID(playerid) {
    return p_AccountID[playerid];
}

hook OnPlayerLogin(playerid, accountid)
{
	printf("Login completed %d", accountid);
}