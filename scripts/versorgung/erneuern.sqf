palette = _this;


// Entferne alte Getränkeboxen
boxes = nearestObjects [palette, ["Land_PaperBox_01_small_closed_brown_food_F", "Land_PaperBox_01_small_closed_white_med_F"], 1];
{
	deleteVehicle _x;
} forEach boxes;

// Erstelle neue Getränkeboxen
box1 = "Land_PaperBox_01_small_closed_brown_food_F" createVehicle position palette;
box2 = "Land_PaperBox_01_small_closed_brown_food_F" createVehicle position palette;
box3 = "Land_PaperBox_01_small_closed_brown_food_F" createVehicle position palette;
box1 attachTo [palette, [0.400, 0.500, 0.300] ]; 
box2 attachTo [palette, [0.400, 0, 0.300] ]; 
box3 attachTo [palette, [0.400, -0.500, 0.300] ]; 


box4 = "Land_PaperBox_01_small_closed_white_med_F" createVehicle position palette;
box5 = "Land_PaperBox_01_small_closed_white_med_F" createVehicle position palette;
box6 = "Land_PaperBox_01_small_closed_white_med_F" createVehicle position palette;
box4 attachTo [palette, [-0.350, 0.500, 0.300] ]; 
box5 attachTo [palette, [-0.350, 0, 0.300] ]; 
box6 attachTo [palette, [-0.350, -0.500, 0.300] ]; 


boxen_getreanke = [box1,box2,box3];
// Füge Verpflegung zu den Boxen hinzu

//clearmagazinecargoglobal box;
//clearweaponcargoglobal box;
//clearitemcargoglobal box;

{
	_x addItemCargoGlobal ["ACE_WaterBottle", 40];
	_x addItemCargoGlobal ["ACE_Canteen", 10];

	_x addItemCargoGlobal ["ACE_MRE_LambCurry", 10];
	_x addItemCargoGlobal ["ACE_MRE_BeefStew", 10];
	_x addItemCargoGlobal ["ACE_MRE_CreamTomatoSoup", 10];
	_x addItemCargoGlobal ["ACE_MRE_CreamChickenSoup", 10];
	_x addItemCargoGlobal ["ACE_MRE_SteakVegetables", 10];
	_x addItemCargoGlobal ["ACE_MRE_MeatballsPasta", 10];
	_x addItemCargoGlobal ["ACE_MRE_ChickenHerbDumplings", 10];

	// _x addItemCargoGlobal ["ACE_Humanitarian_Ration", 1];
} foreach boxen_getreanke;



// Füge Verpflegung zu den Medizin Boxen hinzu
boxen_medizin = [box4,box5,box6];
{
	_x addItemCargoGlobal ["ACE_personalAidKit", 1];
	_x addItemCargoGlobal ["ACE_surgicalKit", 1];

	_x addItemCargoGlobal ["ACE_fieldDressing", 40];
	_x addItemCargoGlobal ["ACE_elasticBandage", 20];
	_x addItemCargoGlobal ["ACE_quikclot", 20];	
	_x addItemCargoGlobal ["ACE_packingBandage", 20];	
	
	_x addItemCargoGlobal ["ACE_tourniquet", 20];	
	
	_x addItemCargoGlobal ["ACE_bodyBag", 10];

	_x addItemCargoGlobal ["ACE_morphine", 25];
	_x addItemCargoGlobal ["ACE_epinephrine", 25];
	_x addItemCargoGlobal ["ACE_atropine", 20];

	_x addItemCargoGlobal ["ACE_bloodIV", 15];
	_x addItemCargoGlobal ["ACE_bloodIV_500", 10];
	_x addItemCargoGlobal ["ACE_bloodIV_250", 20];

	_x addItemCargoGlobal ["ACE_plasmaIV", 15];
	_x addItemCargoGlobal ["ACE_plasmaIV_500", 10];
	_x addItemCargoGlobal ["ACE_plasmaIV_250", 20];
	
	_x addItemCargoGlobal ["ACE_salineIV", 15];
	_x addItemCargoGlobal ["ACE_salineIV_500", 10];
	_x addItemCargoGlobal ["ACE_salineIV_250", 20];	
} foreach boxen_medizin;

