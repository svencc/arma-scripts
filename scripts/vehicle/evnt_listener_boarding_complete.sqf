/*
Function: 
	evnt_listener_boarding_complete

Description:
	Checks regularly if a List of groups as completely boarded a vehicle.
	A given callback function is executed after boarding is completed.

Parameters:
0:	_argVehicle		object/vehicle
1:	_argGroups[]	array with groups to mount the vehicle
2:	_argCallback	code (optional) - If present it gets executed after boarding is completed
*/
_argVehicle =	_this select 0;
_argGroups =	_this select 1;
_argCallback =	_this select 2;

_allIn = false; 
while { 
!		_allIn; 
} do { 
	_allInIteration = true; 
	{ 
		{   
			_allInIteration = _allInIteration &&  (-1 < (_argVehicle getCargoIndex _x)); 
		} foreach units _x;  
	} foreach _argGroups;  

	_allIn = _allInIteration; 
	sleep 1;  
}; 

if (!isNil "_argCallback") then {
	[] spawn _argCallback;
};