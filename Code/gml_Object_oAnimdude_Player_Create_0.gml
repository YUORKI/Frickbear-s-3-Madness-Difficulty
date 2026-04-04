Speed = 2;
YVelocity = 0;
Level = 0;
LevelQueue = get_animdude_levels(global.AILevels[UnknownEnum.Value_41] == 21);

function generate_level(arg0)
{
    instance_destroy(oAnimdude_Object);
    var CurrentLevel = LevelQueue[arg0];
    
    for (var Y = 0; Y < 5; Y++)
    {
        for (var X = 0; X < 10; X++)
        {
            if (CurrentLevel[Y][X] != -1)
                instance_create_depth(X * 32, Y * 32, 0, CurrentLevel[Y][X]);
        }
    }
}

generate_level(Level);
AnimdudeSurf = -1;
Completed = false;
StartupFrames = 180;
StuckOnWallCounter = 0;
WindowSize = 0;
Lives = 50;
x = 0;
y = 96;
CountdownFont = font_add_sprite_ext(sFontNightOpening, "NECimndlesghtuo1234567890 Pa", true, 4);
audio_play_sound(sfxBitBoost, 10, false);

enum UnknownEnum
{
    Value_41 = 41
}
