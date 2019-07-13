/*
Function: 
	fnc_mount_group

Description:
	Let a list of groups (infantry) mount a vehicle

Parameters:
0:	_vehicle	object/vehicle
1:	_groups[]	array with groups to mount the vehicle
*/
_argVehicle =	_this select 0;
_argGroups =	_this select 1;

{  
	{   
		_x assignAsCargo _argVehicle; 
	} foreach units _x;  
} foreach _argGroups;  

{  
	(units _x) orderGetIn true;  
} foreach _argGroups;