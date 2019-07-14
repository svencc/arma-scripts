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