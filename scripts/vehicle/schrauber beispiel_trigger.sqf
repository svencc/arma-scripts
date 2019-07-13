// init-schrauber
this engineOn true;
wphold = (group this) addWaypoint [(position this), 1];
wphold setWaypointType "HOLD";


// trigger


hint "Trigger ausgelöst!";  
  
huron AnimateDoor ["Door_rear_source", 1, false]; 
huron AnimateDoor ["Door_L_source", 1, false]; 
huron AnimateDoor ["Door_R_source", 1, false];  

gruppenfuehrer = [eins, zwei];  
{  
    {   
        _x enableSimulationGlobal true;  
    } foreach units _x;  
} foreach gruppenfuehrer;  
  
_groupMountVehicleHandler	= [huron, gruppenfuehrer] execVM "scripts\vehicle\fnc_mount_group.sqf";

callback = {
	hint "Boarding complete!";

	while {(count (waypoints (group huron))) > 0} do
	{
		deleteWaypoint ((waypoints (group huron)) select 0);
	};
	
	wp = (group huron) addWaypoint [(position w1), 5];
};

_boardingCompleteHandle		= [huron, gruppenfuehrer, callback] execVM "scripts\vehicle\evnt_listener_boarding_complete.sqf";