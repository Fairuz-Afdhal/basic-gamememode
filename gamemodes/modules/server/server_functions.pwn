SendClientMessagef( playerid, colour, const format[ ], va_args<> )
{
    static
		out[ 144 ];

    va_format( out, sizeof( out ), format, va_start<3> );

	if ( playerid == INVALID_PLAYER_ID ) {
		return SendClientMessageToAll( colour, out );
	} else {
        return SendClientMessage( playerid, colour, out );
    }
}