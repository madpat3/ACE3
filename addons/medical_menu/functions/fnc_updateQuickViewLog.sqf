/*
 * Author: Glowbal
 * Update the quick view log
 *
 * Arguments:
 * 0: display <DISPLAY>
 * 1: log collection <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [some_display, log] call ace_medical_menu_fnc_updateQuickViewLog
 *
 * Public: No
 */
#include "script_component.hpp"

private "_logCtrl";

params ["_display", "_logs"];

_logCtrl = _display displayCtrl 215;
lbClear _logCtrl;

{
    _x params ["_message", "_moment", "", "_arguments"];

    if (isLocalized _message) then {
        _message = localize _message;
    };

    {
        if (typeName _x == "STRING" && {isLocalized _x}) then {
            _arguments set [_foreachIndex, localize _x];
        };
    } forEach _arguments;

    _message = format ([_message] + _arguments);
    _logCtrl lbAdd format ["%1 %2", _moment, _message];
    nil
} count _logs;
