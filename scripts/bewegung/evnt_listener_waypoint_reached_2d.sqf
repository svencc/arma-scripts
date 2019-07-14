/*
Function: 
	evnt_listener_waypoint_reached_2d

Description:
	Checks regularly if the distance between 2 objects is less than given distance value;

Parameters:
0:	_argObject		object/vehicle
1:	_argWaypoint		object/vehicle
2:	_argDistance	integer - Meter
3:	_argCallback	code
*/
_argObject	 =	_this select 0;
_argWaypoint =	_this select 1;
_argDistance =	_this select 2;
_argCallback =	_this select 3;


while { (((getPosASL _argObject) distance2D (waypointPosition _argWaypoint)) > _argDistance) } do {
	hint str ((getPosASL _argObject) distance2D (waypointPosition _argWaypoint));
	sleep 1;
};

hint "wp reached!";

if (!isNil "_argCallback") then {
	[] spawn _argCallback;
};