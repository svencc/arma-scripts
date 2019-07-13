terminal = (_this select 0);
palette = (_this select 1);

 terminal addAction ["<t color='#FFFFFF'>Neue Versorgungsgüter</t>",        
{       
 _nul = palette execVM "scripts\versorgung\erneuern.sqf";     
},    
[],    
6,    
true,    
true,    
"",    
"",    
2   
];

// Initialisiere Palette
_nul = palette execVM "scripts\versorgung\erneuern.sqf";     