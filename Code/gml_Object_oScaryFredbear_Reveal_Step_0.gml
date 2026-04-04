image_index = clamp(Frame, 0, 10 + (sprite_index == sFredbear_Reveal2));

if (sprite_index == sFredbear_Reveal2 && Frame >= 13)
{
    if (!array_contains(global.UnlockFlags, "FredbearMode"))
        array_push(global.UnlockFlags, "FredbearMode");
    
    audio_stop_all();
    global.Route = UnknownEnum.Value_4;
    global.Night = 6;
    global.StartRoom = NightOpening;
    room_goto(NightOpening);
}

Frame += (((sprite_index == sFredbear_Reveal2) ? 10 : 15) / 60);

enum UnknownEnum
{
    Value_4 = 4
}
