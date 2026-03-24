global.ControlsOptions = [87, 83, 65, 68, 32, 1, 16, 2, 27];

function remapFunction()
{
    var controlslist = ds_list_create();
    ds_list_add(controlslist, global.ControlsOptions[0]);
    ds_list_add(controlslist, global.ControlsOptions[1]);
    ds_list_add(controlslist, global.ControlsOptions[2]);
    ds_list_add(controlslist, global.ControlsOptions[3]);
    ds_list_add(controlslist, global.ControlsOptions[4]);
    ds_list_add(controlslist, global.ControlsOptions[5]);
    ds_list_add(controlslist, global.ControlsOptions[6]);
    ds_list_add(controlslist, global.ControlsOptions[7]);
    ds_list_add(controlslist, global.ControlsOptions[8]);
    
    if (mouse_check_button(mb_any))
        check_mouse = true;
    
    if (keyboard_lastkey != vk_nokey || check_mouse)
    {
        var newbind = 0;
        
        if (keyboard_lastkey != vk_nokey)
            newbind = keyboard_lastkey;
        else
            newbind = mouse_lastbutton;
        
        var keyisalreadyused = ds_list_find_index(controlslist, newbind);
        
        if (keyisalreadyused == -1)
        {
            global.ControlsOptions[Position] = newbind;
            remap = false;
        }
        else
        {
        }
        
        keyboard_lastkey = vk_nokey;
        check_mouse = false;
    }
    
    ds_list_destroy(controlslist);
}

function key_name(arg0)
{
    if (arg0 >= 48 && arg0 < 91)
        return chr(arg0);
    
    switch (arg0)
    {
        case -1:
            return "No Key";
        
        case 0:
            return "Undefined";
        
        case 1:
            return "Left Mouse button";
        
        case 2:
            return "Right Mouse button";
        
        case 3:
            return "Middle mouse button";
        
        case 4:
            return "Mouse side button 1";
        
        case 5:
            return "Mouse side button 2";
        
        case 8:
            return "Backspace";
        
        case 9:
            return "Tab";
        
        case 13:
            return "Enter";
        
        case 16:
            return "Shift";
        
        case 17:
            return "Ctrl";
        
        case 18:
            return "Alt";
        
        case 19:
            return "Pause/Break";
        
        case 20:
            return "CAPS";
        
        case 27:
            return "Esc";
        
        case 33:
            return "Page Up";
        
        case 32:
            return "Space";
        
        case 34:
            return "Page Down";
        
        case 35:
            return "End";
        
        case 36:
            return "Home";
        
        case 37:
            return "Left Arrow";
        
        case 38:
            return "Up Arrow";
        
        case 39:
            return "Right Arrow";
        
        case 40:
            return "Down Arrow";
        
        case 45:
            return "Insert";
        
        case 46:
            return "Delete";
        
        case 91:
            return "Windows";
        
        case 93:
            return "Menu";
        
        case 96:
            return "Numpad 0";
        
        case 97:
            return "Numpad 1";
        
        case 98:
            return "Numpad 2";
        
        case 99:
            return "Numpad 3";
        
        case 100:
            return "Numpad 4";
        
        case 101:
            return "Numpad 5";
        
        case 102:
            return "Numpad 6";
        
        case 103:
            return "Numpad 7";
        
        case 104:
            return "Numpad 8";
        
        case 105:
            return "Numpad 9";
        
        case 106:
            return "Numpad *";
        
        case 107:
            return "Numpad +";
        
        case 109:
            return "Numpad -";
        
        case 110:
            return "Numpad .";
        
        case 111:
            return "Numpad /";
        
        case 112:
            return "F1";
        
        case 113:
            return "F2";
        
        case 114:
            return "F3";
        
        case 115:
            return "F4";
        
        case 116:
            return "F5";
        
        case 117:
            return "F6";
        
        case 118:
            return "F7";
        
        case 119:
            return "F8";
        
        case 120:
            return "F9";
        
        case 121:
            return "F10";
        
        case 122:
            return "F11";
        
        case 123:
            return "F12";
        
        case 144:
            return "Num Lock";
        
        case 145:
            return "Scroll Lock";
        
        case 162:
            return "Left Ctrl";
        
        case 163:
            return "Right Ctrl";
        
        case 164:
            return "Left Alt";
        
        case 165:
            return "Right Alt";
        
        case 186:
            return ";";
        
        case 187:
            return "=";
        
        case 188:
            return ",";
        
        case 189:
            return "-";
        
        case 190:
            return ".";
        
        case 191:
            return "\\";
        
        case 192:
            return "`";
        
        case 219:
            return "/";
        
        case 220:
            return "[";
        
        case 221:
            return "]";
        
        case 222:
            return "'";
        
        case 226:
            return "< >";
        
        case 1000:
            return "PRESS ANY KEY NOT IN USE";
        
        default:
            return string(arg0);
    }
}

function is_mouse_input(arg0)
{
    if (arg0 < 6)
        return true;
    
    return false;
}

function input_check(arg0)
{
    var actual_input = global.Settings[0][arg0];
    
    if (is_mouse_input(actual_input))
        return mouse_check_button(actual_input);
    else
        return keyboard_check(actual_input);
}

function input_check_pressed(arg0)
{
    var actual_input = global.Settings[0][arg0];
    
    if (is_mouse_input(actual_input))
        return mouse_check_button_pressed(actual_input);
    else
        return keyboard_check_pressed(actual_input);
}

function input_check_released(arg0)
{
    var actual_input = global.Settings[0][arg0];
    
    if (is_mouse_input(actual_input))
        return mouse_check_button_released(actual_input);
    else
        return keyboard_check_released(actual_input);
}

function cur_key_name(arg0)
{
    return key_name(global.Settings[0][arg0]);
}
