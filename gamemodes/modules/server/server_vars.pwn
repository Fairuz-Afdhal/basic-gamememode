/*

 * Developed by Lorenc
 * Module: servervars.inc
 * Purpose: savable server variables
 */

/* ** Error Checking ** */
#if !defined __wjcnr_servervars
	#define __wjcnr_servervars
#else
	#endinput
#endif

/* ** Includes ** */
#include 							< YSI_Coding\y_hooks >

/* ** Macros ** */
#define GetServerVariableInt		GetGVarInt
#define GetServerVariableFloat		GetGVarFloat
#define GetServerVariableString 	GetGVarString

#define UpdateServerVariableString(%0,%1) \
	(UpdateServerVariable(%0, .string_value = (%1), .type = GLOBAL_VARTYPE_STRING))

#define UpdateServerVariableInt(%0,%1) \
	(UpdateServerVariable(%0, .int_value = (%1), .type = GLOBAL_VARTYPE_INT))

#define UpdateServerVariableFloat(%0,%1) \
	(UpdateServerVariable(%0, .float_value = (%1), .type = GLOBAL_VARTYPE_FLOAT))

#define IsValidServerVariable(%0) \
	(GetGVarType(%0) != GLOBAL_VARTYPE_NONE)

/* ** Hooks ** */
hook OnGameModeInit() 
{
	mysql_tquery(handle, "SELECT * FROM server", "OnLoadServerVariables", "" );
	return 1;
}

/* ** Functions ** */
function OnLoadServerVariables()
{
	new rows;
	cache_get_row_count(rows);

	if(rows)
	{
		new variable_name[64];
		new string_value[256];

		for( new i = 0; i < rows; i ++ )
		{
			new variable_type; 
			cache_get_value_name_int(i, "TYPE", variable_type);

			cache_get_value_name(i, "NAME", variable_name);
			new intVal, Float: floatVal;
			switch (variable_type)
			{
				case GLOBAL_VARTYPE_INT: cache_get_value_name_int(i, "INT_VAL", intVal ), SetGVarInt( variable_name, intVal);
				case GLOBAL_VARTYPE_STRING: cache_get_value_name(i, "STRING_VAL", string_value ), SetGVarString( variable_name, string_value );
				case GLOBAL_VARTYPE_FLOAT: cache_get_value_name_float(i, "FLOAT_VAL", floatVal ), SetGVarFloat( variable_name, floatVal );
			}
		}

		// safe method for modules
		CallLocalFunction("OnServerVariablesLoaded", "");
	}
	printf("[SERVER] %d server variables have been loaded.", rows );
	return 1;
}

UpdateServerVariable(const variable_name[ 64 ], int_value = 0, Float: float_value = 0.0, string_value[ 128 ] = '\0', type = GLOBAL_VARTYPE_NONE )
{
	static
		query[ 256 ];

	switch ( type )
	{
		case GLOBAL_VARTYPE_INT: 
		{
			mysql_format( handle, query, sizeof ( query ), "UPDATE server SET int_val=%d WHERE name='%e'", int_value, variable_name );
			SetGVarInt( variable_name, int_value );
		}
		case GLOBAL_VARTYPE_STRING: 
		{
			mysql_format( handle, query, sizeof ( query ), "UPDATE server SET string_val='%e' WHERE name ='%e'", string_value, variable_name );
			SetGVarString( variable_name, string_value );
		}
		case GLOBAL_VARTYPE_FLOAT: 
		{
			mysql_format( handle, query, sizeof ( query ), "UPDATE server SET float_val=%f WHERE name ='%e'", float_value, variable_name );
			SetGVarFloat( variable_name, float_value );
		}
		default: {
			return; // prevent a query from being fired
		}
	}
	mysql_single_query( query );
}

AddServerVariable( const variable_name[ 64 ], const value[ 128 ], type )
{
	static
		query[ 300 ];

	switch ( type )
	{
		case GLOBAL_VARTYPE_INT: {
			mysql_format( handle, query, sizeof ( query ), "INSERT IGNORE INTO `SERVER`(`NAME`,`INT_VAL`,`TYPE`) VALUES ('%e',%d,%d)", variable_name, strval( value ), type );
		}
		case GLOBAL_VARTYPE_STRING: {
			mysql_format( handle, query, sizeof ( query ), "INSERT IGNORE INTO `SERVER`(`NAME`,`STRING_VAL`,`TYPE`) VALUES ('%e','%e',%d)", variable_name, value, type );
		}
		case GLOBAL_VARTYPE_FLOAT: {
			mysql_format( handle, query, sizeof ( query ), "INSERT IGNORE INTO `SERVER`(`NAME`,`FLOAT_VAL`,`TYPE`) VALUES ('%e',%f,%d)", variable_name, floatstr( value ), type );
		}
		default: 
		{
			return; // prevent a query from being fired
		}
	}
	mysql_single_query( query );
}
