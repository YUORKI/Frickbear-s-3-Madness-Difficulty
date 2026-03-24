Speed = 2 * global.MicrogameSpeed;
YVelocity = 0;
Level = 0;
var O = -1;
var F = oAnimdude_Floor;
var I = oAnimdude_Wall;
var W = oAnimdude_SpikeTrap;
var w = oAnimdude_SpikeTrap2;
var X = oAnimdude_SpikeTrap3;
var Q = oAnimdude_Fireball;
var T = oAnimdude_FakeFloor;
var G = oAnimdude_Trophy;
var S = oAnimdude_Switch;
X = oAnimdude_Dragon;
var t = oAnimdude_FakeTrophy;
LevelQueue = [];

switch (global.MicrogameLevel)
{
    case 0:
        array_push(LevelQueue, [[O, O, O, O, O, O, O, O, O, I], [O, O, O, O, O, O, O, O, O, I], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [F, F, F, F, F, F, O, F, F, F]]);
        array_push(LevelQueue, [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, G, O], [O, O, O, O, O, O, O, F, F, O], [O, O, O, O, F, F, O, O, O, O], [F, F, F, O, O, O, O, O, O, O]]);
        break;
    
    case 1:
        array_push(LevelQueue, [[O, O, O, O, O, O, O, O, O, I], [O, O, O, O, O, O, O, O, O, I], [O, O, O, O, O, O, w, O, O, O], [O, O, O, O, O, O, O, O, O, O], [F, F, F, F, F, F, F, F, F, F]]);
        array_push(LevelQueue, [[O, O, O, O, O, O, O, O, O, I], [O, O, W, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, T, O, O, O, G, O], [F, F, F, F, F, O, O, F, F, F]]);
        break;
    
    case 2:
        array_push(LevelQueue, [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, S, O, O, O, O, O], [O, O, O, O, O, O, O, X, O, O], [F, F, F, F, F, F, F, O, O, F]]);
        array_push(LevelQueue, [[O, O, O, O, O, O, Q, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, I, O, Q, O, O, O, O, G, O], [F, F, F, O, F, F, O, F, F, F]]);
        break;
}

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
StartupFrames = 0;
WindowSize = 0;
Lives = 1;
x = 0;
y = 96;
CountdownFont = font_add_sprite_ext(sFontNightOpening, "NECimndlesghtuo1234567890 Pa", true, 4);
audio_play_sound(sfxBitBoost, 10, false);
global.MicrogameWin = false;
