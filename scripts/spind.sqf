// Befülle alle Spinde mit Ausrüstung

_spinde = [
	kiste_1_2_1, kiste_1_2_2,
	kiste_1_3_1, kiste_1_3_2,
	kiste_1_4_1, kiste_1_4_2,
	kiste_1_5_1, kiste_1_5_2,
	kiste_1_6_1, kiste_1_6_2,
	kiste_1_7_1, kiste_1_7_2,
	kiste_1_8_1, kiste_1_8_2,
	kiste_1_9_1, kiste_1_9_2,
	kiste_1_10_1, kiste_1_10_2,
	kiste_1_11_1, kiste_1_11_2,

	kiste_2_2_1, kiste_2_2_2,
	kiste_2_3_1, kiste_2_3_2,
	kiste_2_4_1, kiste_2_4_2,
	kiste_2_5_1, kiste_2_5_2,
	kiste_2_6_1, kiste_2_6_2,
	kiste_2_7_1, kiste_2_7_2,
	kiste_2_8_1, kiste_2_8_2,
	kiste_2_9_1, kiste_2_9_2,
	kiste_2_10_1, kiste_2_10_2,
	kiste_2_11_1, kiste_2_11_2
];

_spinde_mit_navipad = [
	kiste_1_1_1, kiste_1_1_2,
	kiste_tacco, kiste_hoffi
];

_spinde_mit_jpc_rifleman = [
	kiste_1_1_1, kiste_1_1_2,
	kiste_tacco, kiste_hoffi
];

{ 
	clearmagazinecargoglobal _x;
	clearweaponcargoglobal _x;
	clearitemcargoglobal _x;

	_x addItemCargoGlobal["ItemMap",1]; 
	_x addItemCargoGlobal["ItemCompass",1]; 
	_x addItemCargoGlobal["ItemWatch",1];
	_x addweaponcargoglobal ["Binocular",1];
	_x addItemCargoGlobal["BWA3_Vest_JPC_Leader_Tropen",1]; 
	_x addItemCargoGlobal["BWA3_OpsCore_Tropen",1];
	_x addItemCargoGlobal["BWA3_G_Combat_clear",1];
	_x addItemCargoGlobal["BWA3_G_Combat_orange",1];
	_x addItemCargoGlobal["BWA3_G_Combat_black",1];

	_x addItemCargoGlobal["ACE_fieldDressing",2];
	_x addItemCargoGlobal["ACE_CableTie",1];
	_x addItemCargoGlobal["ACE_morphine",2];
	_x addItemCargoGlobal["ACE_packingBandage",1];
	_x addItemCargoGlobal["ACE_EarPlugs",1];
	_x addItemCargoGlobal["ACE_tourniquet",1];
	_x addItemCargoGlobal["ACE_quikclot",1];

} forEach _spinde;


{
	_x addItemCargoGlobal["BWA3_ItemNaviPad ",1];
} forEach _spinde_mit_navipad;


{
	clearmagazinecargoglobal _x;
	clearweaponcargoglobal _x;
	clearitemcargoglobal _x;

	_x addItemCargoGlobal["ItemMap",1]; 
	_x addItemCargoGlobal["ItemCompass",1]; 
	_x addItemCargoGlobal["ItemWatch",1];
	_x addweaponcargoglobal ["Binocular",1];
	_x addItemCargoGlobal["BWA3_Vest_JPC_Rifleman_Tropen",1]; 
	_x addItemCargoGlobal["BWA3_OpsCore_Tropen",1];
	_x addItemCargoGlobal["BWA3_G_Combat_clear",1];
	_x addItemCargoGlobal["BWA3_G_Combat_orange",1];
	_x addItemCargoGlobal["BWA3_G_Combat_black",1];

	_x addItemCargoGlobal["ACE_fieldDressing",2];
	_x addItemCargoGlobal["ACE_CableTie",1];
	_x addItemCargoGlobal["ACE_morphine",2];
	_x addItemCargoGlobal["ACE_packingBandage",1];
	_x addItemCargoGlobal["ACE_EarPlugs",1];
	_x addItemCargoGlobal["ACE_tourniquet",1];
	_x addItemCargoGlobal["ACE_quikclot",1];
} forEach _spinde_mit_jpc_rifleman;
