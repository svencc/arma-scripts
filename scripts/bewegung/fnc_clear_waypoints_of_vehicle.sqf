/*
Function: 
	fnc_clear_waypoints_of_vehicle

Description:
	Clears all Waypoints of given vehicle

Parameters:
0: _argVehicle	object/vehicle
*/
_argVehicle =	_this;

while {(count (waypoints (group _argVehicle))) > 0} do
{
	deleteWaypoint ((waypoints (group _argVehicle)) select 0);
};