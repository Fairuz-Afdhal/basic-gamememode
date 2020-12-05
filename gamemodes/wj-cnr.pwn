            /* ** Main Configurations ** */
//#pragma dynamic 7200000*/
#pragma warning	disable 214, 239
#define YSI_NO_VERSION_CHECK
#define YSI_NO_HEAP_MALLOC
#define YSI_NO_CACHE_MESSAGE

        /* ** SA-MP Includes ** */
#include        < a_samp >
#include        < YSI_Coding\y_hooks >
#include        < YSI_Coding\y_timers >
#include        < YSI_Coding\y_va >
#include 	< YSI_Data\y_iterate >
#include        < a_mysql >
#include 	< izcmd >
#include 	< sscanf2 >
//#include	< colandreas >
#include 	< streamer >
#include        < Pawn.Regex >
#include        < gvar >
#include 	< GPS >
#include 	< merrandom >
#include 	< MathParser >
#include 	< md-sort >
#include	< Pawn.RakNet >
#include	< evf >
#include        < progress2 >
#include	< nex-ac >
#include        < samp_bcrypt >
#include        < formatex >
#include        < strlib >
#include        <server>
#include        <player>

main() {}

public OnGameModeInit()
{
        return 1;
}

public OnPlayerTakePlayerDamage( playerid, issuerid, &Float: amount, weaponid, bodypart )
{
        return 1;
}