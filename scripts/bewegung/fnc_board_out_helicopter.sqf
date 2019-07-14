/*
Function: 
	fnc_board_out_helicopter

Description:
	Boards out all mounted infatry from a helicpter on specified positione (and lands near that waypoint)

Parameters:
0: _argHelicpoter	Object/Vehicle
1: _argPosition		Position
*/

_argHelicpoter = _this select 0;
_argPosition = _this select 1;

dismountCallback = {
	_vehicle = _this select 0;
	_handler = [_vehicle, 1] call compile preprocessFileLineNumbers "scripts\vehicle\fnc_dismount_all.sqf";
};

_wp0 = (group _argHelicpoter) addWaypoint [_argPosition, 100];
_wp0 setWaypointType "MOVE";

_wp1 = (group _argHelicpoter) addWaypoint [_argPosition, 100];
_wp1 setWaypointType "SCRIPTED";
_wp1 setWaypointScript "A3\functions_f\waypoints\fn_wpLand.sqf";

_test = "xxx";

_wp1 setWaypointStatements ["true", "[(vehicle this)] spawn dismountCallback;"];
