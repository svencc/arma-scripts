/*
Function: 
	evnt_listener_dismount_all_cargo

Description:
	Let a all units in heli cargo dismount

Parameters:
0:	_argVehicle			object/vehicle
1:	_argDismountTime	number
*/
params ["_argVehicle", "_argDismountTime"];

{
	sleep _argDismountTime;
	unassignVehicle _x;
	moveOut _x;
} foreach assignedCargo _argVehicle;