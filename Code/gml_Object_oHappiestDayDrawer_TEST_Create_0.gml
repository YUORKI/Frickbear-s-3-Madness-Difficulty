audio_stop_all();
InGame = true;
FadeVal = 0;
DarkGBColor = make_color_rgb(0, 47, 51);
LightGBColor = make_color_rgb(224, 248, 208);
LockZone = undefined;

function save_level(arg0)
{
    room_restart();
    var LevelSave = array_create(0);
    var ObjData = 0;
    
    with (oHappiestDayObject)
    {
        if (!variable_instance_exists(self, "MovementDirection"))
        {
            MovementDirection = 0;
            MovementRange = 0;
            BaseTimer = 0;
        }
        
        if (!variable_instance_exists(self, "Variables"))
            Variables = undefined;
        
        ObjData = 
        {
            _ObjID: object_get_name(object_index),
            _x: OriginalX,
            _y: OriginalY,
            _depth: depth,
            _xscale: image_xscale,
            _yscale: image_yscale,
            _angle: image_angle,
            _MovementDirection: MovementDirection,
            _MovementRange: MovementRange,
            _Timer: BaseTimer,
            _Variables: Variables
        };
        array_push(LevelSave, ObjData);
    }
    
    var _string = json_stringify(LevelSave);
    var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
    buffer_write(_buffer, buffer_string, _string);
    buffer_save(_buffer, "leveldata" + string(arg0) + ".txt");
    buffer_delete(_buffer);
    audio_play_sound(sfxBitBoost, 99, false);
}

function load_level(arg0)
{
    instance_destroy(oHappiestDayObject, false);
    var FileName = "leveldata" + string(arg0) + ".txt";
    
    if (file_exists(FileName))
    {
        var _buffer = buffer_load(FileName);
        var _string = buffer_read(_buffer, buffer_string);
        buffer_delete(_buffer);
        var LoadData = json_parse(_string);
        
        while (array_length(LoadData) > 0)
        {
            var Obj = array_pop(LoadData);
            show_debug_message(Obj);
            
            with (instance_create_depth(Obj._x, Obj._y, Obj._depth, asset_get_index(Obj._ObjID)))
            {
                image_xscale = Obj._xscale;
                image_yscale = Obj._yscale;
                image_angle = Obj._angle;
                MovementDirection = Obj._MovementDirection;
                MovementRange = Obj._MovementRange;
                BaseTimer = Obj._Timer;
                Variables = Obj._Variables;
            }
        }
        
        show_debug_message("GAME LOADED! " + _string);
    }
    
    x = oHD_Guard.x;
    y = oHD_Guard.y;
    audio_play_sound(sfxBitPunish, 99, false);
}
