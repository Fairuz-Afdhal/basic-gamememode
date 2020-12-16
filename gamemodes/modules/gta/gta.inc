#include    < YSI_Game\y_vehicledata >
#include    < weapon-config >
#include    < map-zones >

#include    < YSI_Coding\y_hooks >

hook OnGameModeInit()
{
    SetVehiclePassengerDamage(true);
    SetDisableSyncBugs(true);
    SetCustomVendingMachines(true);
    return 1;
}