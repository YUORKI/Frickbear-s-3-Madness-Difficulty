var ID = UnknownEnum.Value_28;
var AI = global.AILevels[ID];

if (AI <= 0)
    exit;

if (Initialize)
{
    Showtime = global.Timer;
    delay_showtime(AI);
    Initialize = false;
}

if (global.Timer >= Showtime)
{
    if (global.Doors[1])
    {
        simple_sound(sfxBlock, 300, 0, false, 1);
        simple_sound(sfxCartoonDing, 300, 0, false, 0.5);
        block_tokens();
        fuzz_up(UnknownEnum.Value_2);
        delay_showtime(AI);
    }
    else
    {
        jumpscare(ID, 1);
    }
}

if (global.Cam == UnknownEnum.Value_2)
{
    depth = 15;
    var Hours = floor(Showtime / 60);
    var Minutes = (Showtime % 60) / 15;
    draw_sprite(sFuntimeFoxyCutout, 0, global.CamX + 400, global.CamY + 300);
    draw_sprite(sFuntimeFoxyCutout, Hours + 5, global.CamX + 400, global.CamY + 300);
    draw_sprite(sFuntimeFoxyCutout, Minutes + 1, global.CamX + 400, global.CamY + 300);
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_28 = 28
}
