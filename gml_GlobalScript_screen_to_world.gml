function screen_to_world(arg0, arg1, arg2, arg3)
{
    var mx = (2 * ((arg0 / window_get_width()) - 0.5)) / arg3[0];
    var my = (2 * ((arg1 / window_get_height()) - 0.5)) / arg3[5];
    var camX = -((arg2[12] * arg2[0]) + (arg2[13] * arg2[1]) + (arg2[14] * arg2[2]));
    var camY = -((arg2[12] * arg2[4]) + (arg2[13] * arg2[5]) + (arg2[14] * arg2[6]));
    var camZ = -((arg2[12] * arg2[8]) + (arg2[13] * arg2[9]) + (arg2[14] * arg2[10]));
    
    if (arg3[15] == 0)
        return [arg2[2] + (mx * arg2[0]) + (my * arg2[1]), arg2[6] + (mx * arg2[4]) + (my * arg2[5]), arg2[10] + (mx * arg2[8]) + (my * arg2[9]), camX, camY, camZ];
    else
        return [arg2[2], arg2[6], arg2[10], camX + (mx * arg2[0]) + (my * arg2[1]), camY + (mx * arg2[4]) + (my * arg2[5]), camZ + (mx * arg2[8]) + (my * arg2[9])];
}
