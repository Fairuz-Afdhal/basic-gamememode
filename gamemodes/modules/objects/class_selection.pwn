#include 							< YSI_Coding\y_hooks >

new tmpVariable;
hook OnGameModeInit()
{
	CreateDynamicObject( 14846, 242.121002, 77.313003, 1605.078002, 0.000000, 0.000000, 0.000000, .priority = 9999, .streamdistance = -1.0 );
	CreateDynamicObject( 2605, 237.936004, 85.197998, 1604.431030, 0.000000, 0.000000, 80.000000, .priority = 9999, .streamdistance = -1.0 );
	CreateDynamicObject( 2356, 238.682006, 84.823997, 1604.057983, 0.000000, 0.000000, 61.299999, .priority = 9999, .streamdistance = -1.0 );
	CreateDynamicObject( 19623, 236.035995, 86.892997, 1605.670043, 0.000000, 0.000000, -90.000000, .priority = 9999, .streamdistance = -1.0 );
	CreateDynamicObject( 19611, 236.072998, 86.892997, 1604.037963, 0.000000, 0.000000, 0.000000, .priority = 9999, .streamdistance = -1.0 );
	SetDynamicObjectMaterial( CreateDynamicObject( 2960, 229.427993, 85.385002, 1606.333984, 0.000000, 90.000000, 0.000000, .priority = 9999, .streamdistance = -1.0 ), 0, 18217, "mtbfencecs_t", "Metal1_128", -16 );
	SetDynamicObjectMaterial( CreateDynamicObject( 19328, 229.037002, 87.126998, 1605.214965, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 ), 0, 8395, "pyramid", "white", -16 );
	SetDynamicObjectMaterial( CreateDynamicObject( 19328, 229.035003, 87.125000, 1605.713012, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 ), 0, 8395, "pyramid", "white", -16 );
	SetDynamicObjectMaterialText( CreateDynamicObject( 19328, 229.065002, 87.444999, 1606.453979, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 ), 0, ". _________ .", 140, "aRIAL", 30, 1, -16777216, 0, 1 );
	SetDynamicObjectMaterialText( CreateDynamicObject( 19328, 229.065002, 87.444999, 1606.104003, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 ), 0, ". _________ .", 140, "aRIAL", 30, 1, -16777216, 0, 1 );
	SetDynamicObjectMaterialText( CreateDynamicObject( 19328, 229.065002, 87.444999, 1605.754028, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 ), 0, ". _________ .", 140, "aRIAL", 30, 1, -16777216, 0, 1 );
	SetDynamicObjectMaterialText( CreateDynamicObject( 19328, 229.065002, 87.444999, 1605.404052, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 ), 0, ". _________ .", 140, "aRIAL", 30, 1, -16777216, 0, 1 );
	SetDynamicObjectMaterialText( CreateDynamicObject( 19328, 229.065002, 87.444999, 1605.053955, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 ), 0, ". _________ .", 140, "aRIAL", 30, 1, -16777216, 0, 1 );
	SetDynamicObjectMaterialText( CreateDynamicObject( 19328, 229.065002, 87.444999, 1606.223999, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 ), 0, "_____", 140, "aRIAL", 30, 1, -16777216, 0, 1 );
	SetDynamicObjectMaterialText( CreateDynamicObject( 19328, 229.065002, 87.444999, 1606.333984, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 ), 0, "_____", 140, "aRIAL", 30, 1, -16777216, 0, 1 );
	SetDynamicObjectMaterialText( CreateDynamicObject( 19328, 229.065002, 87.444999, 1605.884033, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 ), 0, "_____", 140, "aRIAL", 30, 1, -16777216, 0, 1 );
	SetDynamicObjectMaterialText( CreateDynamicObject( 19328, 229.065002, 87.444999, 1605.994018, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 ), 0, "_____", 140, "aRIAL", 30, 1, -16777216, 0, 1 );
	SetDynamicObjectMaterialText( CreateDynamicObject( 19328, 229.065002, 87.444999, 1605.524047, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 ), 0, "_____", 140, "aRIAL", 30, 1, -16777216, 0, 1 );
	SetDynamicObjectMaterialText( CreateDynamicObject( 19328, 229.065002, 87.444999, 1605.634033, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 ), 0, "_____", 140, "aRIAL", 30, 1, -16777216, 0, 1 );
	SetDynamicObjectMaterial( CreateDynamicObject( 2960, 229.427993, 88.864997, 1606.333984, 0.000000, 90.000000, 0.000000, .priority = 9999, .streamdistance = -1.0 ), 0, 18217, "mtbfencecs_t", "Metal1_128", -16 );
	SetDynamicObjectMaterial( CreateDynamicObject( 2834, 230.143997, 86.521003, 1604.057983, 0.000000, 0.000000, 8.199999, .priority = 9999, .streamdistance = -1.0 ), 0, 6287, "pierc_law2", "bluemetal", -16 );
	SetDynamicObjectMaterialText( CreateDynamicObject( 19328, 229.065002, 87.444999, 1605.284057, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 ), 0, "_____", 140, "aRIAL", 30, 1, -16777216, 0, 1 );
	SetDynamicObjectMaterialText( CreateDynamicObject( 19328, 229.065002, 87.444999, 1605.163940, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 ), 0, "_____", 140, "aRIAL", 30, 1, -16777216, 0, 1 );
	SetDynamicObjectMaterial( CreateDynamicObject( 19377, 228.938995, 87.805999, 1605.038940, 0.000000, 0.000000, 0.000000, .priority = 9999, .streamdistance = -1.0 ), 0, 19377, "none", "none", 1 );
	CreateDynamicObject( 927, 229.072006, 89.900001, 1605.298950, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 );
	CreateDynamicObject( 927, 229.072006, 84.360000, 1605.698974, 0.000000, 180.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 );
	CreateDynamicObject( 927, 229.072006, 82.709999, 1606.699951, 0.000000, -90.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 );
	SetDynamicObjectMaterialText( CreateDynamicObject( 19328, 229.054992, 87.705001, 1606.413940, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 ), 0, "7'", 140, "arial", 40, 1, -16777216, 0, 1 );
	SetDynamicObjectMaterialText( CreateDynamicObject( 19328, 229.054992, 87.705001, 1606.063964, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 ), 0, "6'", 140, "arial", 40, 1, -16777216, 0, 1 );
	SetDynamicObjectMaterialText( CreateDynamicObject( 19328, 229.054992, 87.705001, 1605.713989, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 ), 0, "5'", 140, "arial", 40, 1, -16777216, 0, 1 );
	SetDynamicObjectMaterialText( CreateDynamicObject( 19328, 229.054992, 87.705001, 1605.364013, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 ), 0, "4'", 140, "arial", 40, 1, -16777216, 0, 1 );
	SetDynamicObjectMaterialText( CreateDynamicObject( 19328, 229.054992, 87.705001, 1605.014038, 0.000000, 0.000000, 90.000000, .priority = 9999, .streamdistance = -1.0 ), 0, "3'", 140, "arial", 40, 1, -16777216, 0, 1 );
	tmpVariable = CreateDynamicObject( 18066, 229.000000, 86.862998, 1006.598999, -8.199999, 0.000000, -90.000000, .priority = 9999, .streamdistance = -1.0 );
	SetDynamicObjectMaterialText( tmpVariable, 0, "SF-CNR", 130, "IMPACT", 70, 0, -16777216, 0, 1 );
	SetDynamicObjectMaterialText( tmpVariable, 1, "SF-CNR", 130, "IMPACT", 70, 0, -16777216, 0, 1 );
	SetDynamicObjectMaterialText( tmpVariable, 2, "SF-CNR", 130, "IMPACT", 70, 0, -16777216, 0, 1 );
	SetDynamicObjectMaterialText( tmpVariable, 3, "SF-CNR", 130, "IMPACT", 70, 0, -16777216, 0, 1 );
    return 1;
}