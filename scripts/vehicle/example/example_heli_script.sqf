/*
Function: 
	example_script

Description:
	The implementation script which implements a hole use case

Parameters:
-
*/

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

_groupMountVehicleHandler = [huron, gruppenfuehrer] execVM "scripts\vehicle\fnc_mount_group.sqf";  

callback = {  
	hint "Boarding complete!";
	_handler = huron call compile preprocessFileLineNumbers "scripts\bewegung\fnc_clear_waypoints_of_vehicle.sqf";

	_fnc_next_wp = {  
		hint "proceding to landing waypoint";
		_handler = huron call compile preprocessFileLineNumbers "scripts\bewegung\fnc_clear_waypoints_of_vehicle.sqf";
		_handler2 = [huron, position w2] call compile preprocessFileLineNumbers "scripts\bewegung\fnc_board_out_helicopter.sqf";
	};

	_wp = (group huron) addWaypoint [(position w1), 5];
	_handler = [huron, _wp, 100, _fnc_next_wp] call compile preprocessFileLineNumbers "scripts\bewegung\evnt_listener_waypoint_reached_2d.sqf";
};  

_boardingCompleteHandle  = [huron, gruppenfuehrer, callback] execVM "scripts\vehicle\evnt_listener_boarding_complete.sqf";
