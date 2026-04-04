ButtonVal = 0;
ClickFrame = 0;

function start_night()
{
    audio_stop_sound(musCustomNight);
    global.Night = "Custom";
    global.Route = UnknownEnum.Value_0;
    global.SummonedAnimatronics = [];
    room_goto(NightOpening);
}

enum UnknownEnum
{
    Value_0
}
