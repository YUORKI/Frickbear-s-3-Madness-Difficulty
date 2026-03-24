var _bounds = (argument_count > 0) ? argument[0] : undefined;
var _buf = global.__display_mouse_bounds__buf;

if (_buf == undefined)
{
    _buf = buffer_create(16, buffer_fixed, 1);
    global.__display_mouse_bounds__buf = _buf;
}

if (display_mouse_bounds_raw(buffer_get_address(_buf)))
{
    if (_bounds == undefined)
        _bounds = array_create(4);
    
    for (var i = 0; i < 4; i++)
        _bounds[i] = buffer_peek(_buf, i * 4, buffer_s32);
    
    return _bounds;
}
else
{
    return undefined;
}
