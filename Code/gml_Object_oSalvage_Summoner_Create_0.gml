Offset = -180;
OffsetSpeed = 5;
Summons = [];
Frame = 0;
Surf = -1;
FaceCoords = [[[215, 35]], [[160, 28], [267, 28]], [[126, 48], [212, 26], [299, 41]], [[98, 65], [179, 23], [262, 28], [343, 64]], [[123, 89], [174, 28], [217, 102], [263, 32], [313, 97]]];

function draw_outline_salvage(arg0, arg1, arg2, arg3, arg4)
{
    shader_set(shFlash);
    
    for (var i = -45; i < 360; i += 90)
        draw_sprite_ext(arg1, arg2, arg3 + round(lengthdir_x(1, i)), arg4 + round(lengthdir_y(1, i)), 1, 1, 0, arg0, 1);
    
    shader_reset();
}

audio_play_sound(sfxSalvage_Summon, 4, false);
