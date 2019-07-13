hint "Trigger ausgelöst!";  
  
huron AnimateDoor ["Door_rear_source", 1, false]; 
huron AnimateDoor ["Door_L_source", 1, false]; 
huron AnimateDoor ["Door_R_source", 1, false];  

gruppenfuehrer = [eins, zwei];  
{  
    {   
        _x enableSimulationGlobal true;  
    } foreach units _x;  
} foreach gruppenfuehrer;  
  
_groupMountVehicleHandler = [huron, gruppenfuehrer] execVM "scripts\werkzeug\nehme_werkzeug.sqf";  
 
_groupMountVehicleHandler = [huron, gruppenfuehrer] spawn {
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
};



callback = {
	hint "Boarding complete!";
	while {(count (waypoints (group huron))) > 0} do
	{
		deleteWaypoint ((waypoints (group huron)) select 0);
	};
	wp = (group huron) addWaypoint [(position w1), 5];
}; 

_boardingCompleteHandle = [huron, gruppenfuehrer, callback] spawn { 
	_argVehicle =	_this select 0;
	_argGroups =	_this select 1;
	_argCallback =	_this select 2;

	if (isNil "_argCallback") then {
		hint "is null"	;
	};

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
	hint "All IN!";



	if (!isNil "_argCallback") then {
		[] spawn _argCallback;
	};
};

//--- vehicle		object
//--- groups[]		List
//--- callback		code
