native UnitAlive takes unit u returns boolean
native GetUnitBuildTime takes integer unitid returns integer//Crashes for heroes
native GetUnitGoldCost takes integer unitid returns integer//Crashes for heroes
native GetUnitWoodCost takes integer unitid returns integer//Crashes for heroes
native GetPlayerUnitTypeCount takes player p, integer unitid returns integer
//counts only alive units/heroes/structures
//counts also units during training; also counts buildings under construction
//counts building during upgrade (like upgrade town hall-->keep in progress, counts as keep)
//counts also heroes during reviving



