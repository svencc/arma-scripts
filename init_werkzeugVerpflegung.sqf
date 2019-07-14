_this addAction ["<t color='#FFFFFF'>Hole Werkzeugkoffer aus dem Schrank</t>",        
{       
 _nul = _this execVM "scripts\werkzeug\nehme_werkzeug.sqf";     
},    
[],    
6,    
true,    
true,    
"",    
"",    
2   
]; 

_this addAction ["<t color='#FFFFFF'>Verstaue Werkzeugkoffer im Schrank</t>",        
{       
 _nul = player execVM "scripts\werkzeug\zuruecklegen_werkzeug.sqf";     
},    
[],    
6,    
true,    
true,    
"",    
"_items = items player; ""ToolKit"" in _items;",
2 
];



// ------ heli go ---------------------------------------------------------------
this addAction ["<t color='#FFFFFF'>Verstaue Werkzeugkoffer im Schrank</t>",         
{        
 _nul = [] spawn fnc_heligo; 
},     
[],     
6,     
true,     
true,     
"",     
"_items = items player; ""ToolKit"" in _items;", 
2  
];


fnc_heligo = {
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
   
_groupMountVehicleHandler = [huron, gruppenfuehrer] execVM "scripts\vehicle\fnc_mount_group.sqf"; 
 
callback = { 
 hint "Boarding complete!"; 
 while {(count (waypoints (group huron))) > 0} do 
 { 
  deleteWaypoint ((waypoints (group huron)) select 0); 
 }; 
 wp = (group huron) addWaypoint [(position w1), 5]; 
}; 
 
_boardingCompleteHandle  = [huron, gruppenfuehrer, callback] execVM "scripts\vehicle\evnt_listener_boarding_complete.sqf";
};





