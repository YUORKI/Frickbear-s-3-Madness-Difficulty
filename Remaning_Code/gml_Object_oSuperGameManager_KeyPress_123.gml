if (room == CheatRoom)
{
    room_goto(TitleScreenMap);
    exit;
}

if (!(keyboard_check(ord("C")) && keyboard_check(ord("D"))))
    exit;

with (all)
{
    if (object_index != oSuperGameManager)
        instance_destroy();
}

audio_stop_all();
application_surface_draw_enable(true);
room_goto(CheatRoom);
