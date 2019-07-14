/*
Function: 
	example_script

Description:
	The implementation script which implements a hole use case

Parameters:
-
*/

// Türen öffnen
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
	params ["_argObject1", "_argObject2", "_argDistance"];
	
	// Türen schließen
	_argObject1 AnimateDoor ["Door_rear_source", 0, false];   
	_argObject1 AnimateDoor ["Door_L_source", 0, false];   
	_argObject1 AnimateDoor ["Door_R_source", 0, false];    

	// Warte auf Türen
	sleep 2;

	_argObject1 call compile preprocessFileLineNumbers "scripts\bewegung\fnc_clear_waypoints_of_vehicle.sqf";

	// Definition callback für nächsten (zweiten) wegpunkt
	_fnc_next_wp = {
		params ["_argObject1", "_argObject2"];

		_argObject1 call compile preprocessFileLineNumbers "scripts\bewegung\fnc_clear_waypoints_of_vehicle.sqf";
		[_argObject1, position w2] call compile preprocessFileLineNumbers "scripts\bewegung\fnc_board_out_helicopter.sqf";

		callbackAction = {
			params["_argObject1", "_argObject2", "_argDistance"];

			// Türen öffnen
			_argObject1 AnimateDoor ["Door_rear_source", 1, false];   
			_argObject1 AnimateDoor ["Door_L_source", 1, false];   
			_argObject1 AnimateDoor ["Door_R_source", 1, false];    

		};

		_handler = [_argObject1, w2, 300, 15,  callbackAction] execVM  "scripts\bewegung\evnt_listener_waypoint_reached.sqf";
	};

	// Nächster (erster) Wegpunkt
	_wp = (group _argObject1) addWaypoint [(position w1), 5];
	_handler = [_argObject1, _wp, 100, _fnc_next_wp] call compile preprocessFileLineNumbers "scripts\bewegung\evnt_listener_waypoint_reached_2d.sqf";
};  

_boardingCompleteHandle  = [huron, gruppenfuehrer, callback] execVM "scripts\vehicle\evnt_listener_boarding_complete.sqf";
