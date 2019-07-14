/*
Function: 
	fnc_dismount_all

Description:
	Let a all units in heli cargo dismount

Parameters:
0:	_argVehicle			object/vehicle
1:	_argDismountTime	number
*/
_argVehicle			=	_this select 0;
_argDismountTime	=	_this select 1;

{
	sleep _argDismountTime;
	unassignVehicle _x;
	moveOut _x;
} foreach assignedCargo _argVehicle;