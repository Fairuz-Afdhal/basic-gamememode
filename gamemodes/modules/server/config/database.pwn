/* * Database Configuration * */
#define MYSQL_HOST				"127.0.0.1"
#define MYSQL_USER				"root"
#define MYSQL_PASS				""
#define MYSQL_DATABASE			"wjcnr_v3"

/* * Includes * */
#include        < YSI_Coding\y_hooks >

new MySQL: g_SQL;

hook OnGameModeInit()
{
    new MySQLOpt:options = mysql_init_options();
    mysql_set_option(options, AUTO_RECONNECT, true); //disable auto-reconnect
    
    g_SQL = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASS, MYSQL_DATABASE, options);

    if(mysql_errno() != 0) 
		print("[MySQL]: Could not connect to database!");
	else
		print( "[MySQL]: Connection to database is successful." );
    
    // enable mysql logs
	mysql_log( ERROR | WARNING );
    return true;
}