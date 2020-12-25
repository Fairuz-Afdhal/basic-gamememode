#include    < YSI_Coding\y_hooks >

new
    Logger:mainlog,
    Logger:playerlog,
    Logger:playermoneylog,
    Logger:systemlog;

hook OnGameModeInit()
{
    mainlog = CreateLog("main");
    playerlog = CreateLog("player/main");
    playermoneylog = CreateLog("player/money");
    systemlog = CreateLog("system");
    
    Log(mainlog, INFO, "log-plugin started");
}


hook OnGameModeExit()
{
    DestroyLog(mainlog);
    DestroyLog(playerlog);
    DestroyLog(playermoneylog);
    DestroyLog(systemlog);
}