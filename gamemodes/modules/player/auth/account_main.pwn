/* ** Includes ** */
#include 	< YSI_Coding\y_hooks >

static BitArray: p_PlayerLogged< MAX_PLAYERS >,
		p_AccountID[ MAX_PLAYERS ];

/* ** Hooks ** */
hook OnPlayerConnect(playerid)
{
	CallLocalFunction("PlayerTextdraw_Unload", "d", playerid);
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
			
			cache_get_value_int(0, "expire", _:bannedExpire);
			cache_get_value_name(0, "banby", bannedbyUser);
			cache_get_value_name(0, "reason", bannedReason);
			cache_get_value_name(0, "name", bannedUser);
			cache_get_value_name(0, "ip", bannedIP);
		
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
			Dialog_ShowCallback(playerid, using inline _anotherresponse, DIALOG_STYLE_MSGBOX, ""COL_WHITE"Login", ""COL_WHITE"Are you sure you want to leave the server?", "Yes", "No" );

		}
		else{
			if(isnull(inputtext)){
				SendError(playerid, "Password tidak bisa kosong.");
			}

			inline const _response_load()
			{
				if (!cache_num_rows()){
					// There was an error loading the data.  Try again.
					SendError(playerid, "There was an error while loading your account, please relogin.");
					Account_LoginDialog(playerid);
					return;
				}

				// Get the password hash and unique (user) ID.
				new accid,
					hash[128];
				
				if (!cache_get_value(0, "password", hash) || !cache_get_value_int(0, "id", accid)){
					// There was an error loading the data.  Try again.
					SendError(playerid, "There's an error while loading your account, please try again.");
					Account_LoginDialog(playerid);
					return;
				}

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
						SendError(playerid, "Invalid password.");
						Account_LoginDialog(playerid);
					}
				}
				
				BCrypt_CheckInline(inputtext, hash, using inline Account_PasswordCheck);
			}

			MySQL_TQueryInline(g_SQL, using inline _response_load, "SELECT `password`, `id` FROM `users` WHERE `name` = '%e'", ReturnPlayerName(playerid));
		}
	}

	new string[256];
	format(string, sizeof(string), "\
	"COL_WHITE"Welcome back, "COL_GREEN"%s\n \n\
	"COL_WHITE"Masukan password untuk login\n\n", \
	ReturnPlayerName(playerid));

	Dialog_ShowCallback(playerid, using inline _response, DIALOG_STYLE_PASSWORD, ""COL_WHITE"WJCNR - Login", string, "Login", "Leave");
}

hook OnPlayerLogin(playerid, accountid)
{
	SendServerMessage(playerid, "You successfully logged in.");
	GameTextForPlayer(playerid, sprintf("~w~Welcome,~n~~g~%s", ReturnPlayerName(playerid)), 5000, 1);
}


Player_IsLoggedIn(playerid) return Bit_Get(p_PlayerLogged, playerid);

Player_SetAccountID(playerid, value) {
    return p_AccountID[playerid] = value;
}

Player_GetAccountID(playerid) {
    return p_AccountID[playerid];
}