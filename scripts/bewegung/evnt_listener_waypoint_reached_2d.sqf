/*
Function: 
	evnt_listener_waypoint_reached_2d

Description:
	Checks regularly if the distance between 2 objects is less than given distance value;

Parameters:
0:	_argObject		object/vehicle
1:	_argWaypoint	waypoint
2:	_argDistance	integer - Meter
3:	_argCallback	code
*/
_argObject	 =	_this select 0;
_argWaypoint =	_this select 1;
_argDistance =	_this select 2;
_argCallback =	_this select 3;

while { (alive _argObject) && (((getPosASL _argObject) distance2D (waypointPosition _argWaypoint)) > _argDistance) } do {
	sleep 1;
};

if ( (alive _argObject) && !isNil "_argCallback" ) then {
	[_argObject, _argObject, _argDistance] spawn _argCallback;
};