#define MAX_REGISTER_TEXTDRAWS      (22)
#define MAX_LOGIN_TEXTDRAWS			(4)
#define COLOR_LOGIN_TD_HOVERING		(0x00C100FF)
#define COLOR_REGISTER_TD_HOVERING  (0xFF000085)

static
	PlayerText: LoginTextDraw[MAX_PLAYERS][MAX_LOGIN_TEXTDRAWS],
	PlayerText: RegisterTextDraw[MAX_PLAYERS][MAX_REGISTER_TEXTDRAWS]
    ;

Textdraw_Register(playerid)
{
    RegisterTextDraw[playerid][0] = CreatePlayerTextDraw(playerid, 277.400085, 101.399917, "box");
    PlayerTextDrawLetterSize(playerid, RegisterTextDraw[playerid][0], 0.000000, 25.012474);PlayerTextDrawTextSize(playerid, RegisterTextDraw[playerid][0], 512.106445, 0.000000);PlayerTextDrawAlignment(playerid, RegisterTextDraw[playerid][0], 1);PlayerTextDrawColor(playerid, RegisterTextDraw[playerid][0], -1);PlayerTextDrawUseBox(playerid, RegisterTextDraw[playerid][0], 1);PlayerTextDrawBoxColor(playerid, RegisterTextDraw[playerid][0], 133);PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][0], 0);PlayerTextDrawSetOutline(playerid, RegisterTextDraw[playerid][0], 0);PlayerTextDrawBackgroundColor(playerid, RegisterTextDraw[playerid][0], 255);PlayerTextDrawFont(playerid, RegisterTextDraw[playerid][0], 1);PlayerTextDrawSetProportional(playerid, RegisterTextDraw[playerid][0], 1);PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][0], 0);

	RegisterTextDraw[playerid][1] = CreatePlayerTextDraw(playerid, 144.900054, 98.800018, "");
	PlayerTextDrawLetterSize(playerid, RegisterTextDraw[playerid][1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, RegisterTextDraw[playerid][1], 124.000000, 207.772872);
	PlayerTextDrawAlignment(playerid, RegisterTextDraw[playerid][1], 1);
	PlayerTextDrawColor(playerid, RegisterTextDraw[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, RegisterTextDraw[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterTextDraw[playerid][1], 153);
	PlayerTextDrawFont(playerid, RegisterTextDraw[playerid][1], 5);
	PlayerTextDrawSetProportional(playerid, RegisterTextDraw[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][1], 0);
	PlayerTextDrawSetPreviewModel(playerid, RegisterTextDraw[playerid][1], 0);
	PlayerTextDrawSetPreviewRot(playerid, RegisterTextDraw[playerid][1], 0.000000, 0.000000, 0.000000, 1.000000);

    RegisterTextDraw[playerid][2] = CreatePlayerTextDraw(playerid, 207.199340, 313.302551, "PlayerName");
	PlayerTextDrawLetterSize(playerid, RegisterTextDraw[playerid][2], 0.298000, 1.483332);
	PlayerTextDrawTextSize(playerid, RegisterTextDraw[playerid][2], -0.649999, 120.680145);
	PlayerTextDrawAlignment(playerid, RegisterTextDraw[playerid][2], 2);
	PlayerTextDrawColor(playerid, RegisterTextDraw[playerid][2], -1);
	PlayerTextDrawUseBox(playerid, RegisterTextDraw[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, RegisterTextDraw[playerid][2], 133);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, RegisterTextDraw[playerid][2], 1);
	PlayerTextDrawBackgroundColor(playerid, RegisterTextDraw[playerid][2], 255);
	PlayerTextDrawFont(playerid, RegisterTextDraw[playerid][2], 2);
	PlayerTextDrawSetProportional(playerid, RegisterTextDraw[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][2], 0);

    RegisterTextDraw[playerid][3] = CreatePlayerTextDraw(playerid, 366.000000, 116.000000, "box");
	PlayerTextDrawLetterSize(playerid, RegisterTextDraw[playerid][3], 0.000000, 2.149996);
	PlayerTextDrawTextSize(playerid, RegisterTextDraw[playerid][3], 504.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, RegisterTextDraw[playerid][3], 1);
	PlayerTextDrawColor(playerid, RegisterTextDraw[playerid][3], -1);
	PlayerTextDrawUseBox(playerid, RegisterTextDraw[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, RegisterTextDraw[playerid][3], 252645375);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, RegisterTextDraw[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterTextDraw[playerid][3], 255);
	PlayerTextDrawFont(playerid, RegisterTextDraw[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, RegisterTextDraw[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, RegisterTextDraw[playerid][3], true);

			
    RegisterTextDraw[playerid][4] = CreatePlayerTextDraw(playerid, 320.000000, 118.000000, "Password:");
	PlayerTextDrawLetterSize(playerid, RegisterTextDraw[playerid][4], 0.279000, 1.401664);
	PlayerTextDrawAlignment(playerid, RegisterTextDraw[playerid][4], 2);
	PlayerTextDrawColor(playerid, RegisterTextDraw[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, RegisterTextDraw[playerid][4], 1);
	PlayerTextDrawBackgroundColor(playerid, RegisterTextDraw[playerid][4], 255);
	PlayerTextDrawFont(playerid, RegisterTextDraw[playerid][4], 2);
	PlayerTextDrawSetProportional(playerid, RegisterTextDraw[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][4], 0);

	RegisterTextDraw[playerid][5] = CreatePlayerTextDraw(playerid, 320.500000, 157.301635, "Email:");
	PlayerTextDrawLetterSize(playerid, RegisterTextDraw[playerid][5], 0.279000, 1.401664);
	PlayerTextDrawAlignment(playerid, RegisterTextDraw[playerid][5], 2);
	PlayerTextDrawColor(playerid, RegisterTextDraw[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, RegisterTextDraw[playerid][5], 1);
	PlayerTextDrawBackgroundColor(playerid, RegisterTextDraw[playerid][5], 255);
	PlayerTextDrawFont(playerid, RegisterTextDraw[playerid][5], 2);
	PlayerTextDrawSetProportional(playerid, RegisterTextDraw[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][5], 0);

	RegisterTextDraw[playerid][6] = CreatePlayerTextDraw(playerid, 366.000000, 154.000305, "box");
	PlayerTextDrawLetterSize(playerid, RegisterTextDraw[playerid][6], 0.000000, 2.149996);
	PlayerTextDrawTextSize(playerid, RegisterTextDraw[playerid][6], 504.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, RegisterTextDraw[playerid][6], 1);
	PlayerTextDrawColor(playerid, RegisterTextDraw[playerid][6], -1);
	PlayerTextDrawUseBox(playerid, RegisterTextDraw[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid, RegisterTextDraw[playerid][6], 252645375);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, RegisterTextDraw[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterTextDraw[playerid][6], 255);
	PlayerTextDrawFont(playerid, RegisterTextDraw[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, RegisterTextDraw[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][6], 0);
	PlayerTextDrawSetSelectable(playerid, RegisterTextDraw[playerid][6], true);

	RegisterTextDraw[playerid][8] = CreatePlayerTextDraw(playerid, 366.000000, 192.902679, "box");
	PlayerTextDrawLetterSize(playerid, RegisterTextDraw[playerid][8], 0.000000, 2.149996);
	PlayerTextDrawTextSize(playerid, RegisterTextDraw[playerid][8], 504.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, RegisterTextDraw[playerid][8], 1);
	PlayerTextDrawColor(playerid, RegisterTextDraw[playerid][8], -1);
	PlayerTextDrawUseBox(playerid, RegisterTextDraw[playerid][8], 1);
	PlayerTextDrawBoxColor(playerid, RegisterTextDraw[playerid][8], 252645375);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, RegisterTextDraw[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterTextDraw[playerid][8], 255);
	PlayerTextDrawFont(playerid, RegisterTextDraw[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, RegisterTextDraw[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][8], 0);
	PlayerTextDrawSetSelectable(playerid, RegisterTextDraw[playerid][8], true);

	RegisterTextDraw[playerid][9] = CreatePlayerTextDraw(playerid, 374.499420, 156.800048, "N/A");
	PlayerTextDrawLetterSize(playerid, RegisterTextDraw[playerid][9], 0.279000, 1.401664);
	PlayerTextDrawAlignment(playerid, RegisterTextDraw[playerid][9], 1);
	PlayerTextDrawColor(playerid, RegisterTextDraw[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, RegisterTextDraw[playerid][9], 1);
	PlayerTextDrawBackgroundColor(playerid, RegisterTextDraw[playerid][9], 255);
	PlayerTextDrawFont(playerid, RegisterTextDraw[playerid][9], 2);
	PlayerTextDrawSetProportional(playerid, RegisterTextDraw[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][9], 0);

	RegisterTextDraw[playerid][15] = CreatePlayerTextDraw(playerid, 481.000000, 311.743896, "Sign Up");
	PlayerTextDrawLetterSize(playerid, RegisterTextDraw[playerid][15], 0.229497, 1.214998);
	PlayerTextDrawTextSize(playerid, RegisterTextDraw[playerid][15], 12.000000, 46.000000);
	PlayerTextDrawAlignment(playerid, RegisterTextDraw[playerid][15], 2);
	PlayerTextDrawColor(playerid, RegisterTextDraw[playerid][15], -1);
	PlayerTextDrawUseBox(playerid, RegisterTextDraw[playerid][15], 1);
	PlayerTextDrawBoxColor(playerid, RegisterTextDraw[playerid][15], 6815816);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, RegisterTextDraw[playerid][15], 1);
	PlayerTextDrawBackgroundColor(playerid, RegisterTextDraw[playerid][15], 255);
	PlayerTextDrawFont(playerid, RegisterTextDraw[playerid][15], 2);
	PlayerTextDrawSetProportional(playerid, RegisterTextDraw[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][15], 0);
	PlayerTextDrawSetSelectable(playerid, RegisterTextDraw[playerid][15], true);

	RegisterTextDraw[playerid][16] = CreatePlayerTextDraw(playerid, 336.797363, 286.388488, "SKIN:");
	PlayerTextDrawLetterSize(playerid, RegisterTextDraw[playerid][16], 0.279000, 1.401664);
	PlayerTextDrawAlignment(playerid, RegisterTextDraw[playerid][16], 2);
	PlayerTextDrawColor(playerid, RegisterTextDraw[playerid][16], -1);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, RegisterTextDraw[playerid][16], 1);
	PlayerTextDrawBackgroundColor(playerid, RegisterTextDraw[playerid][16], 255);
	PlayerTextDrawFont(playerid, RegisterTextDraw[playerid][16], 2);
	PlayerTextDrawSetProportional(playerid, RegisterTextDraw[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][16], 0);
			
	RegisterTextDraw[playerid][17] = CreatePlayerTextDraw(playerid, 378.400756, 286.685028, "ld_beat:left");
	PlayerTextDrawLetterSize(playerid, RegisterTextDraw[playerid][17], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, RegisterTextDraw[playerid][17], 12.000000, 16.000000);
	PlayerTextDrawAlignment(playerid, RegisterTextDraw[playerid][17], 1);
	PlayerTextDrawColor(playerid, RegisterTextDraw[playerid][17], -1);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, RegisterTextDraw[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterTextDraw[playerid][17], 255);
	PlayerTextDrawFont(playerid, RegisterTextDraw[playerid][17], 4);
	PlayerTextDrawSetProportional(playerid, RegisterTextDraw[playerid][17], 0);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][17], 0);
	PlayerTextDrawSetSelectable(playerid, RegisterTextDraw[playerid][17], true);

	RegisterTextDraw[playerid][18] = CreatePlayerTextDraw(playerid, 473.406555, 286.685028, "ld_beat:right");
	PlayerTextDrawLetterSize(playerid, RegisterTextDraw[playerid][18], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, RegisterTextDraw[playerid][18], 12.000000, 16.000000);
	PlayerTextDrawAlignment(playerid, RegisterTextDraw[playerid][18], 1);
	PlayerTextDrawColor(playerid, RegisterTextDraw[playerid][18], -1);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, RegisterTextDraw[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterTextDraw[playerid][18], 255);
	PlayerTextDrawFont(playerid, RegisterTextDraw[playerid][18], 4);
	PlayerTextDrawSetProportional(playerid, RegisterTextDraw[playerid][18], 0);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][18], 0);
	PlayerTextDrawSetSelectable(playerid, RegisterTextDraw[playerid][18], true);
			
	RegisterTextDraw[playerid][19] = CreatePlayerTextDraw(playerid, 431.900238, 287.416778, "0");
	PlayerTextDrawLetterSize(playerid, RegisterTextDraw[playerid][19], 0.400000, 1.600000);
	PlayerTextDrawAlignment(playerid, RegisterTextDraw[playerid][19], 2);
	PlayerTextDrawColor(playerid, RegisterTextDraw[playerid][19], -1);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][19], 0);
	PlayerTextDrawSetOutline(playerid, RegisterTextDraw[playerid][19], 1);
	PlayerTextDrawBackgroundColor(playerid, RegisterTextDraw[playerid][19], 255);
	PlayerTextDrawFont(playerid, RegisterTextDraw[playerid][19], 2);
	PlayerTextDrawSetProportional(playerid, RegisterTextDraw[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][19], 0);
			
	RegisterTextDraw[playerid][20] = CreatePlayerTextDraw(playerid, 368.800292, 122.633346, "[]");
	PlayerTextDrawLetterSize(playerid, RegisterTextDraw[playerid][20], 0.191495, 1.057499);
	PlayerTextDrawAlignment(playerid, RegisterTextDraw[playerid][20], 1);
	PlayerTextDrawColor(playerid, RegisterTextDraw[playerid][20], -1);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][20], 0);
	PlayerTextDrawSetOutline(playerid, RegisterTextDraw[playerid][20], 1);
	PlayerTextDrawBackgroundColor(playerid, RegisterTextDraw[playerid][20], 255);
	PlayerTextDrawFont(playerid, RegisterTextDraw[playerid][20], 2);
	PlayerTextDrawSetProportional(playerid, RegisterTextDraw[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, RegisterTextDraw[playerid][20], 0);

    PlayerTextDrawSetString(playerid, RegisterTextDraw[playerid][2], ReturnPlayerName(playerid));
	
    PlayerTextDrawShow(playerid, RegisterTextDraw[playerid][0]);
	PlayerTextDrawShow(playerid, RegisterTextDraw[playerid][1]);
	PlayerTextDrawShow(playerid, RegisterTextDraw[playerid][2]);
	PlayerTextDrawShow(playerid, RegisterTextDraw[playerid][3]);
	PlayerTextDrawShow(playerid, RegisterTextDraw[playerid][4]);
	PlayerTextDrawShow(playerid, RegisterTextDraw[playerid][5]);
	PlayerTextDrawShow(playerid, RegisterTextDraw[playerid][6]);
	//PlayerTextDrawShow(playerid, RegisterTextDraw[playerid][8]);
	PlayerTextDrawShow(playerid, RegisterTextDraw[playerid][9]);
	PlayerTextDrawShow(playerid, RegisterTextDraw[playerid][15]);
	PlayerTextDrawShow(playerid, RegisterTextDraw[playerid][16]);
	PlayerTextDrawShow(playerid, RegisterTextDraw[playerid][17]);
	PlayerTextDrawShow(playerid, RegisterTextDraw[playerid][18]);
	PlayerTextDrawShow(playerid, RegisterTextDraw[playerid][19]);
		    
	SelectTextDraw(playerid, COLOR_REGISTER_TD_HOVERING);
}

Textdraw_Login(playerid)
{
    LoginTextdraw[playerid][0] = CreatePlayerTextDraw(playerid, 254.499908, 103.666770, "");
	PlayerTextDrawLetterSize(playerid, LoginTextdraw[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, LoginTextdraw[playerid][0], 131.000000, 190.000000);
	PlayerTextDrawAlignment(playerid, LoginTextdraw[playerid][0], 1);
	PlayerTextDrawColor(playerid, LoginTextdraw[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, LoginTextdraw[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, LoginTextdraw[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, LoginTextdraw[playerid][0], 153);
	PlayerTextDrawFont(playerid, LoginTextdraw[playerid][0], 5);
	PlayerTextDrawSetProportional(playerid, LoginTextdraw[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, LoginTextdraw[playerid][0], 0);
	PlayerTextDrawSetPreviewModel(playerid, LoginTextdraw[playerid][0], 1);
	PlayerTextDrawSetPreviewRot(playerid, LoginTextdraw[playerid][0], 0.000000, 0.000000, 0.000000, 1.000000);

	LoginTextdraw[playerid][1] = CreatePlayerTextDraw(playerid, 320.300109, 303.167022, "PlayerName");
	PlayerTextDrawLetterSize(playerid, LoginTextdraw[playerid][1], 0.400000, 1.600000);
	PlayerTextDrawTextSize(playerid, LoginTextdraw[playerid][1], 0.000000, 127.419876);
	PlayerTextDrawAlignment(playerid, LoginTextdraw[playerid][1], 2);
	PlayerTextDrawColor(playerid, LoginTextdraw[playerid][1], -1);
    PlayerTextDrawUseBox(playerid, LoginTextdraw[playerid][1], 1);
    PlayerTextDrawBoxColor(playerid, LoginTextdraw[playerid][1], 153);
    PlayerTextDrawSetShadow(playerid, LoginTextdraw[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, LoginTextdraw[playerid][1], 1);
    PlayerTextDrawBackgroundColor(playerid, LoginTextdraw[playerid][1], 255);
    PlayerTextDrawFont(playerid, LoginTextdraw[playerid][1], 2);
    PlayerTextDrawSetProportional(playerid, LoginTextdraw[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, LoginTextdraw[playerid][1], 0);

    LoginTextdraw[playerid][2] = CreatePlayerTextDraw(playerid, 256.899993, 322.599914, "box");
    PlayerTextDrawLetterSize(playerid, LoginTextdraw[playerid][2], 0.000000, 2.222089);
    PlayerTextDrawTextSize(playerid, LoginTextdraw[playerid][2], 383.920013, 0.000000);
    PlayerTextDrawAlignment(playerid, LoginTextdraw[playerid][2], 1);
    PlayerTextDrawColor(playerid, LoginTextdraw[playerid][2], -1);
    PlayerTextDrawUseBox(playerid, LoginTextdraw[playerid][2], 1);
    PlayerTextDrawBoxColor(playerid, LoginTextdraw[playerid][2], 133);
    PlayerTextDrawSetShadow(playerid, LoginTextdraw[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, LoginTextdraw[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, LoginTextdraw[playerid][2], 255);
    PlayerTextDrawFont(playerid, LoginTextdraw[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid, LoginTextdraw[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, LoginTextdraw[playerid][2], 0);

	LoginTextdraw[playerid][3] = CreatePlayerTextDraw(playerid, 320.799957, 324.949707, "SIGN IN");
	PlayerTextDrawLetterSize(playerid, LoginTextdraw[playerid][3], 0.305999, 1.290832);
	PlayerTextDrawTextSize(playerid, LoginTextdraw[playerid][3], 10.000000, 113.000000);
	PlayerTextDrawAlignment(playerid, LoginTextdraw[playerid][3], 2);
	PlayerTextDrawColor(playerid, LoginTextdraw[playerid][3], -1);
	PlayerTextDrawUseBox(playerid, LoginTextdraw[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, LoginTextdraw[playerid][3], -2139062017);
	PlayerTextDrawSetShadow(playerid, LoginTextdraw[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, LoginTextdraw[playerid][3], 1);
	PlayerTextDrawBackgroundColor(playerid, LoginTextdraw[playerid][3], 255);
	PlayerTextDrawFont(playerid, LoginTextdraw[playerid][3], 2);
	PlayerTextDrawSetProportional(playerid, LoginTextdraw[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, LoginTextdraw[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, LoginTextdraw[playerid][3], true);
}

hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid)
{
	if (playertextid == RegisterTextDraw[playerid][3])
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
		format(string, sizeof(string), ""COL_RED"Password harus 3-24 karakter.\n\n"COL_GREY"Jangan pernah share password dengan siapapun!");
		Dialog_ShowCallback(playerid, using inline _response, DIALOG_STYLE_INPUT, ""COL_WHITE"Account - Register", string, "Register", "Leave");

	}
    if (playertextid == RegisterTextDraw[playerid][15])
	{
		new password[MAX_PASSWORD_LENGTH +1];
		GetPVarString(playerid, "Password", password, MAX_PASSWORD_LENGTH);

		if (!(3 <= strlen(password) <= 24))
		{
		    new string[234 +1];

		    if (!(MIN_PASSWORD_LENGTH <= strlen(password) <= MAX_PASSWORD_LENGTH))
		        SendError(playerid, "Password harus 3-24 karakter.");
		}
		else
		{
            CancelSelectTextDraw(playerid);
		}
	}
    if (playertextid == RegisterTextDraw[playerid][17])
	{
	    new
	        current = GetPVarInt(playerid, "CurrentPreviewModel");

		if (current <= 0)
		{
		    PlayerPlaySound(playerid, 1085, 0.00, 0.00, 0.00);
		}
		else
		{
		    SetPVarInt(playerid, "CurrentPreviewModel", (current -1));
		    
		    PlayerTextDrawHide(playerid, RegisterTextDraw[playerid][1]);
		    PlayerTextDrawSetPreviewModel(playerid, RegisterTextDraw[playerid][1], (current -1));
		    
		    PlayerTextDrawShow(playerid, RegisterTextDraw[playerid][1]);
		    
		    new string[3 +1];
		    format(string, sizeof(string), "%i", (current -1));
		    PlayerTextDrawSetString(playerid, RegisterTextDraw[playerid][19], string);
		}
	}
    if (playertextid == RegisterTextDraw[playerid][18])
	{
	    new
	        current = GetPVarInt(playerid, "CurrentPreviewModel");
	        
		if (current > 310)
		{
		    PlayerPlaySound(playerid, 1085, 0.00, 0.00, 0.00);
		}
		else
		{
		    SetPVarInt(playerid, "CurrentPreviewModel", (current +1));
		    
		    PlayerTextDrawHide(playerid, RegisterTextDraw[playerid][1]);
		    PlayerTextDrawSetPreviewModel(playerid, RegisterTextDraw[playerid][1], (current +1));
		    
		    PlayerTextDrawShow(playerid, RegisterTextDraw[playerid][1]);
		    
		    new string[3 +1];
		    format(string, sizeof(string), "%i", (current +1));
		    PlayerTextDrawSetString(playerid, RegisterTextDraw[playerid][19], string);
        }
    }
    return 1;
}