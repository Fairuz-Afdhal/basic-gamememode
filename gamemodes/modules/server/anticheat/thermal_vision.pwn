/*******************************************************
*
...  West Java Cops and Robbers Anticheats
*
*******************************************************/


/* ** Includes ** */
#include 							< YSI_Coding\y_hooks >

/* ** Hooks ** */
hook OnPlayerUpdate(playerid) 
{
    if (!AC_NightThermalVisionHack(playerid)) {
        return Y_HOOKS_BREAK_RETURN_0;
    } else {
        return Y_HOOKS_CONTINUE_RETURN_1;
    }
}

/* ** Functions ** */
static AC_NightThermalVisionHack(playerid) // Created by wups
{
    static
    	weapon;

    weapon = GetPlayerWeapon( playerid );
    if ( weapon == 44 || weapon == 45 )
    {
        static
            HoldingFire[ MAX_PLAYERS ],
            IsHoldingFire[ MAX_PLAYERS char ],
            CanHoldAgain[ MAX_PLAYERS char ],
            keys, lr, tick
      	;

        GetPlayerKeys( playerid, keys, lr, lr);
        tick = GetTickCount( );

        if ( keys & KEY_FIRE )
        {
            if ( !IsHoldingFire{ playerid } && CanHoldAgain{ playerid } )
            {
                IsHoldingFire{ playerid } = 1;
                HoldingFire[ playerid ] = tick;
                CanHoldAgain{ playerid } = 0;
            }
        }
        else if ( !CanHoldAgain{ playerid } ) CanHoldAgain{ playerid } = 1;

        if ( IsHoldingFire{ playerid } )
        {
            if ( tick - 1500 <= HoldingFire[ playerid ] )
            {
                return 0;
            }
            else
            {
                IsHoldingFire{ playerid } = 0;
                return 1;
            }
        }
    }
    return 1;
}