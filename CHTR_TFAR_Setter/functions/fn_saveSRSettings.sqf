/*
 * Authors: Chatter and M3ales
 * Gets the active LR Radio of the Player(TFAR_fnc_activeSwRadio)
 * Sets the profileNamespace variable "CHTR_TFAR_QoL_SettingsSW" to have the settings of current raido by calling "TFAR_fnc_getSwSettings"
 * Outputs "SaveLR Settings" as an indication of what was done.
 * 
 *
 * Arguments:
 * _showResult (optional): If true will display a message at the top right using ace_common_fnc_displayTextPicture on success
 *
 * Return Value:
 * None
 *
 * Example:
 * call CHTR_TFAR_Setter_fnc_saveLRSettings
 *
 * Public: No
 */
#include "function_macros.hpp"

params[["_showResult", true, [true]]];

LOG("Saving SR Settings");
_radioData = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
[false, _radioData] call FUNC(setRadioData);

if(_showResult) then {
	["Saved SR Settings", QUOTE(ICON_PATH(interact_root))] call ace_common_fnc_displayTextPicture;
};
//check it saved correctly, return result
0