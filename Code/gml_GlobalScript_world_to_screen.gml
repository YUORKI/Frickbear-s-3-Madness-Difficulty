function world_to_screen(arg0, arg1, arg2, arg3, arg4)
{
    var cx, cy;
    
    if (arg4[15] == 0)
    {
        var w = (arg3[2] * arg0) + (arg3[6] * arg1) + (arg3[10] * arg2) + arg3[14];
        
        if (w == 0)
            return [-1, -1];
        
        cx = arg4[8] + ((arg4[0] * ((arg3[0] * arg0) + (arg3[4] * arg1) + (arg3[8] * arg2) + arg3[12])) / w);
        cy = arg4[9] + ((arg4[5] * ((arg3[1] * arg0) + (arg3[5] * arg1) + (arg3[9] * arg2) + arg3[13])) / w);
    }
    else
    {
        cx = arg4[12] + (arg4[0] * ((arg3[0] * arg0) + (arg3[4] * arg1) + (arg3[8] * arg2) + arg3[12]));
        cy = arg4[13] + (arg4[5] * ((arg3[1] * arg0) + (arg3[5] * arg1) + (arg3[9] * arg2) + arg3[13]));
    }
    
    var WindowWidth = 640;
    var WindowHeight = 360;
    return [(0.5 + (0.5 * cx)) * WindowWidth, WindowHeight - ((0.5 + (0.5 * cy)) * WindowHeight)];
}
