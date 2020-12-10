/*

 * Developed by Simon, edited by Lorenc
 * Module: colours.inc
 * Purpose: colors and its functions
 */

/* ** Colours ** */
#define COL_GREEN               	"{6EF83C}"
#define COL_LGREEN               	"{91FA6B}"
#define COL_AGREEN					"{008000}"
#define COL_RED                 	"{F81414}"
#define COL_BLUE		           	"{00C0FF}"
#define COL_LRED                	"{FFA1A1}"
#define COL_GOLD                	"{FFDC2E}"
#define COL_PLATINUM                "{E0E0E0}"
#define COL_DIAMOND                	"{4EE2EC}"
#define COL_GREY                    "{C0C0C0}"
#define COL_PINK                    "{FF0770}"
#define COL_PURPLE 					"{885EAD}"
#define COL_WHITE                   "{FFFFFF}"
#define COL_ORANGE                  "{FF7500}"
#define COL_GANG                    "{009999}"
#define COL_YELLOW                  "{FFFF00}"
#define COL_BLACK					"{333333}"
#define COL_BRONZE 					"{CD7F32}"
#define COL_FIREMAN 				"{A83434}"
#define COL_EPURPLE					"{551A8B}"
#define COL_MEDIC 					"{00FF80}"
#define COL_FBI                   	"{0035FF}"
#define COL_ARMY                  	"{954BFF}"
#define COL_CIA                   	"{191970}"
#define COL_POLICE              	"{3E7EFF}"
#define COL_MONEY					"{2C6836}"
#define COL_LMONEY					"{426629}"
#define COL_CYAN					"{00FFFFF}"

#define COLOR_RDMZONES 				0x00CC0010
#define COLOR_GREEN             	0x00CC00FF
#define COLOR_RED               	0xFF0000FF
#define COLOR_BLUE                  0x00C0FFFF
#define COLOR_YELLOW            	0xFFFF00FF
#define COLOR_ORANGE            	0xEE9911FF
#define COLOR_GREY                  0xC0C0C0FF
#define COLOR_WHITE                 0xFFFFFFFF
#define COLOR_PINK                  0xFF0770FF
#define COLOR_GOLD                  0xFFDC2EFF
#define COLOR_DEFAULT               0xFFFFFF70
#define COLOR_WANTED2               0xFFFF00FF
#define COLOR_WANTED6               0xFF8500FF
#define COLOR_WANTED12              0xF81414FF
#define COLOR_CONNECT				0x22BB22AA
#define COLOR_DISCONNECT			0xC0C0C0AA
#define COLOR_TIMEOUT				0x990099AA
#define COLOR_KICK					0xFFCC00AA
#define COLOR_EPURPLE				0x551A8BFF
#define COLOR_SILVER				0xC0C0C0FF
#define COLOR_DIMGOLD				0xE5C100FF
#define COLOR_OLDGOLD				0xCFB53BFF
#define COLOR_MONEY					0x2C6836FF
#define COLOR_LMONEY				0x426629FF

#define COLOR_POLICE              	0x3E7EFF70
#define COLOR_FBI                   0x0035FF70
#define COLOR_ARMY                  0x954BFF70
#define COLOR_CIA                   0x19197000
#define COLOR_FIREMAN               0xA8343470
#define COLOR_MEDIC                 0x00FF8070
/* ** Functions ** */
setRed( color, red ) // Set the red intensity on a colour.
{
	if ( red > 0xFF )
	    red	= 0xFF;
	else if ( red < 0x00 )
	    red	= 0x00;

	return ( color & 0x00FFFFFF ) | ( red << 24 );
}

setGreen( color, green ) // Set the green intensity on a colour.
{
	if ( green > 0xFF )
	    green	= 0xFF;
	else if ( green < 0x00 )
	    green	= 0x00;

	return ( color & 0xFF00FFFF ) | ( green << 16 );
}

setBlue( color, blue ) // Set the blue intensity on a colour.
{
	if ( blue > 0xFF )
	    blue	= 0xFF;
	else if ( blue < 0x00 )
	    blue	= 0x00;

	return ( color & 0xFFFF00FF ) | ( blue << 8 );
}

setAlpha( color, alpha ) // Set the alpha intensity on a colour.
{
	if ( alpha > 0xFF )
	    alpha	= 0xFF;
	else if ( alpha < 0x00 )
	    alpha	= 0x00;

	return ( color & 0xFFFFFF00 ) | alpha;
}

stripRed( color ) // Remove all red from a colour.
	return ( color ) & 0x00FFFFFF;

stripGreen( color ) // Remove all green from a colour.
	return ( color ) & 0xFF00FFFF;

stripBlue( color ) // Remove all blue from a colour.
	return ( color ) & 0xFFFF00FF;

stripAlpha( color ) // Remove all alpha from a colour.
	return ( color ) & 0xFFFFFF00;

fillRed( color ) // Fill all red in a colour.
	return ( color ) | 0xFF000000;

fillGreen( color ) // Fill all green in a colour.
	return ( color ) | 0x00FF0000;

fillBlue( color ) // Fill all blue in a colour.
	return ( color ) | 0x0000FF00;

fillAlpha( color ) // Fill all alpha in a colour.
	return ( color ) | 0x000000FF;

getRed( color ) // Get the intensity of red in a colour.
	return ( color >> 24 ) & 0x000000FF;

getGreen( color ) // Get the intensity of green in a colour.
	return ( color >> 16 ) & 0x000000FF;

getBlue( color ) // Get the intensity of blue in a colour.
	return ( color >> 8 ) & 0x000000FF;

getAlpha( color ) // Get the intensity of alpha in a colour.
	return ( color ) & 0x000000FF;

makeColor( red=0, green=0, blue=0, alpha=0 ) // Make a colour with the specified intensities.
	return ( setAlpha( setBlue( setGreen( setRed( 0x00000000, red ), green ), blue ), alpha ) );

setColor( color, red = -1, green = -1, blue = -1, alpha = -1 ) // Set the properties of a colour.
{
	if ( red != -1 )
	    color = setRed    ( color, red );
	if ( green != -1 )
	    color = setGreen  ( color, green );
	if ( blue != -1 )
	    color = setBlue   ( color, blue );
	if ( alpha != -1 )
	    color = setAlpha  ( color, alpha );

	return color;
}
