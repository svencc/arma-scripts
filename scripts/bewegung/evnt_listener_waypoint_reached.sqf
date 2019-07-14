/*
Function: 
	evnt_listener_waypoint_reached

Description:
	Checks regularly if the distance between 2 objects is less than given distance value;

Parameters:
0:	_argObject		object/vehicle
1:	_argObject2		object/vehicle
2:	_argDistance	integer - Meter
3:	_argHeightOverGround	integer - Meter
4:	_argCallback	code
*/
params ["_argObject1", "_argObject2", "_argDistance", "_argHeightOverGround", "_argCallback"];

while { (alive _argObject1) && !( (((getPos _argObject1) distance (getPos _argObject2)) < _argDistance) && ((getPos _argObject1) select 2 < _argHeightOverGround) ) } do {
	sleep 1;
};

if ( (alive _argObject1) && !isNil "_argCallback" ) then {
	[_argObject1, _argObject2, _argDistance, _argHeightOverGround] spawn _argCallback;
};