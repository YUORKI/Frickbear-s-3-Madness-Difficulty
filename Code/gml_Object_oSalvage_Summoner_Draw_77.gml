set_target_to_ui();
var SummonAmount = array_length(Summons);
draw_sprite_ext(sBossSalvage_SummonerTVs, SummonAmount + 4, 320, Offset * 0.5, 1, -1, 0, c_white, 1);
draw_sprite(sBossSalvage_SummonerTVs, SummonAmount + 4, 320, Offset * 0.5);
draw_sprite(sBossSalvage_SummonerTVs, SummonAmount - 1, 320, Offset);

if (!surface_exists(Surf))
    Surf = surface_create(480, 176);

surface_set_target(Surf);
draw_clear_alpha(c_white, 0);
draw_sprite(sBossSalvage_SummonerTVs, SummonAmount + 9, 240, 0);
gpu_set_colorwriteenable(1, 1, 1, 0);
var Coords = FaceCoords[SummonAmount - 1];

for (var i = 0; i < 10; i++)
    draw_sprite_ext(sBossSalvage_WarningTape, 0, -189 + ((Frame % 189) * binary_to_sign(i % 2)), i * 20, 5, 1, 0, c_white, 1);

for (var i = 0; i < array_length(Coords); i++)
{
    draw_outline_salvage(16777215, sCustomNightFaces, Summons[i], Coords[i][0], Coords[i][1]);
    draw_sprite(sCustomNightFaces, Summons[i], Coords[i][0], Coords[i][1]);
}

var Frames_Static = 15;
var Frames_Fading = 30;
var Frames_Total = 120;
var Alpha = 1;

if (Frame > Frames_Static)
    Alpha = clamp((((Frames_Static + Frames_Fading) - Frame) / Frames_Fading) * random_range(0.75, 1.25), 0.25, 1);

draw_sprite_ext(sStatic, Frame, 0, 0, 1, 1, 0, c_white, Alpha);
gpu_set_colorwriteenable(1, 1, 1, 1);
surface_reset_target();
draw_surface(Surf, 80, Offset);

if (Frame < Frames_Total)
{
    OffsetSpeed = lerp(OffsetSpeed, (0 - Offset) * 0.2, 0.25);
}
else
{
    OffsetSpeed = lerp(OffsetSpeed, (-240 - Offset) * 0.15, 0.1);
    
    if (Frame == Frames_Total)
        OffsetSpeed = 15;
    
    if (Frame > (Frames_Total + 30))
        instance_destroy();
}

if ((Frame % 45) == 0 && Frame < Frames_Total)
    audio_play_sound(sfxCoffeeWarning, 4, false);

Offset += OffsetSpeed;
Frame++;
surface_reset_target();
