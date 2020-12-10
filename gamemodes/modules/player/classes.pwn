#include 							< YSI_Coding\y_hooks >

/* ** Functions ** */

/* ** Definitions ** */
#define CLASS_CIVILIAN              ( 0 )
#define CLASS_POLICE              	( 1 )
#define CLASS_MEDIC					( 2 )

#define MAX_CLASS_BAN_WARNS			( 3 )

/* ** Constants ** */
static const
	Float: default_X 				= -2242.152,
	Float: default_Y 				= 759.0619,
	Float: default_Z 				= 30.0,
	Float: default_Angle 			= 0.0
;

static const CLASS_NAMES 			[ ] [ ] = { "Civilian", "Police", "FBI", "Army", "CIA", "Medic" };
static const CLASS_COLORS 			[ ] = { 0xC0C0C0FF, 0x3E7EFFFF, 0x0035FFFF, 0x954BFFFF, 0x191970FF, 0x00FF8070 };


static
	    CLASS_CIVILIAN_RANGE			[ 2 ],
	    CLASS_POLICE_RANGE				[ 2 ],
	    CLASS_FBI_RANGE					[ 2 ],
	    CLASS_CIA_RANGE 				[ 2 ],
	    CLASS_ARMY_RANGE				[ 2 ],
	    CLASS_MEDIC_RANGE				[ 2 ]
;


/* ** Textdraw Variables ** */
static stock
	Text: g_classBoxTD				= Text: INVALID_TEXT_DRAW,
	Text: g_classTextdrawBox		[ sizeof( CLASS_NAMES ) ] = { Text: INVALID_TEXT_DRAW, ... },
	Text: g_classTextdrawDescrip	[ sizeof( CLASS_NAMES ) ] = { Text: INVALID_TEXT_DRAW, ... },
	Text: g_classTextdrawName		[ sizeof( CLASS_NAMES ) ] = { Text: INVALID_TEXT_DRAW, ... }
;

/* ** Player Variables ** */
new p_Class 						[ MAX_PLAYERS ];

/* ** Hooks ** */
hook OnGameModeInit()
{
    CLASS_CIVILIAN_RANGE[0] = Class_Add(0, default_X, default_Y, default_Z, default_Angle);
    CLASS_CIVILIAN_RANGE[1] = Class_Add(1, default_X, default_Y, default_Z, default_Angle);

	// Textdraws
	g_classBoxTD = TextDrawCreate(40.000000, 170.000000, "_");
	TextDrawBackgroundColor(g_classBoxTD, 255);
	TextDrawFont(g_classBoxTD, 1);
	TextDrawLetterSize(g_classBoxTD, 0.500000, 16.000000);
	TextDrawColor(g_classBoxTD, -1);
	TextDrawSetOutline(g_classBoxTD, 0);
	TextDrawSetProportional(g_classBoxTD, 1);
	TextDrawSetShadow(g_classBoxTD, 1);
	TextDrawUseBox(g_classBoxTD, 1);
	TextDrawBoxColor(g_classBoxTD, 144);
	TextDrawTextSize(g_classBoxTD, 170.000000, 10.000000);

	for ( new i = 0; i < sizeof( g_classTextdrawBox ); i ++ )
	{
		g_classTextdrawBox[ i ] = TextDrawCreate(40.000000, 138.000000, "_");
		TextDrawBackgroundColor(g_classTextdrawBox[ i ], 255);
		TextDrawFont(g_classTextdrawBox[ i ], 1);
		TextDrawLetterSize(g_classTextdrawBox[ i ], 0.500000, 3.000000);
		TextDrawColor(g_classTextdrawBox[ i ], -1);
		TextDrawSetOutline(g_classTextdrawBox[ i ], 0);
		TextDrawSetProportional(g_classTextdrawBox[ i ], 1);
		TextDrawSetShadow(g_classTextdrawBox[ i ], 1);
		TextDrawUseBox(g_classTextdrawBox[ i ], 1);
		TextDrawBoxColor(g_classTextdrawBox[ i ], CLASS_COLORS[ i ]);
		TextDrawTextSize(g_classTextdrawBox[ i ], 170.000000, 10.000000);

		new string[256];

		switch ( i )
		{
			case 0: {
				strcat( string,	"- Pilih banyak tipe job~n~" \
										"- Bisa rob store dan players~n~" \
										"- Bisa membuat gang dengan civilian~n~" \
										"~g~~h~- Bisa diakses semua player" );
			}
			case 1:	{
				strcat( string,	"- Melindungi kota dari kriminal~n~" \
										"- Akses ke locker weapon~n~" \
										"- Bisa arrest dan jail~n~" \
										"~g~~h~- Bisa diakses semua player" );
			}
			case 2:	{
				strcat( string,	"- Melindungi kota dari kriminal~n~" \
										"- Akses ke locker weapon~n~" \
										"- Bisa arrest dan jail~n~" \
										"- Bisa membuat roadblock di jalan~n~" \
										"- Bisa menaruh spike trap di jalan~n~" \
										"~r~~h~- Memerlukan 10,000XP atau lebih" );
			}
			case 3: {
				strcat( string,	"- Melindungi kota dari kriminal~n~" \
										"- Akses ke locker weapon~n~" \
										"- Bisa arrest dan jail~n~" \
										"- Bisa membuat roadblock di jalan~n~" \
										"- Bisa menaruh spike trap di jalan~n~" \
										"- Bisa menggunakan kendaraan berat~n~" \
										"~r~~h~- Membutuhkan level polisi 81 atau lebih" );
			}
			case 4: {
				strcat( string,	"- Melindungi kota dari kriminal~n~" \
										"- Akses ke locker weapon~n~" \
										"- Bisa arrest dan jail~n~" \
										"- Bisa membuat roadblock di jalan~n~" \
										"- Bisa menaruh spike trap di jalan~n~" \
										"- Tidak terlihat di radar~n~" \
										"~r~~h~- Membutuhkan level polisi 61 atau lebih" );
			}
			case 5: {
				strcat( string,	"- Membantu civilian ataupun police~n~" \
										"- Akses ke mobil paramedic~n~" \
										"- Bisa heal player di mobil ambulans~n~" \
										"~g~~h~- Bisa diakses semua player" );
			}
		}

		g_classTextdrawDescrip[ i ] = TextDrawCreate(43.000000, 171.000000, string);
		TextDrawBackgroundColor(g_classTextdrawDescrip[ i ], 0);
		TextDrawFont(g_classTextdrawDescrip[ i ], 1);
		TextDrawLetterSize(g_classTextdrawDescrip[ i ], 0.190000, 1.100000);
		TextDrawColor(g_classTextdrawDescrip[ i ], -1);
		TextDrawSetOutline(g_classTextdrawDescrip[ i ], 1);
		TextDrawSetProportional(g_classTextdrawDescrip[ i ], 1);

		g_classTextdrawName[ i ] = TextDrawCreate(46.000000, 141.000000, CLASS_NAMES[ i ] );
		TextDrawBackgroundColor(g_classTextdrawName[ i ], 0);
		TextDrawFont(g_classTextdrawName[ i ], 3);
		TextDrawLetterSize(g_classTextdrawName[ i ], 0.550000, 2.099999);
		TextDrawColor(g_classTextdrawName[ i ], i == 0 ? 0x000000FF : 0xFFFFFFFF );
		TextDrawSetOutline(g_classTextdrawName[ i ], 1);
		TextDrawSetProportional(g_classTextdrawName[ i ], 1);
		TextDrawSetSelectable(g_classTextdrawName[ i ], 0);
	}
	return 1;
}

ShowPlayerClassTextdraw( playerid, classid ) {
	for ( new i = 0; i < sizeof( CLASS_COLORS ); i ++ ) if ( i != classid ) {
		TextDrawHideForPlayer( playerid, g_classTextdrawBox[ i ] );
		TextDrawHideForPlayer( playerid, g_classTextdrawDescrip[ i ] );
		TextDrawHideForPlayer( playerid, g_classTextdrawName[ i ] );
	}

    TextDrawShowForPlayer( playerid, g_classBoxTD );
	TextDrawShowForPlayer( playerid, g_classTextdrawBox[ classid ] );
	TextDrawShowForPlayer( playerid, g_classTextdrawDescrip[ classid ] );
	TextDrawShowForPlayer( playerid, g_classTextdrawName[ classid ] );
}