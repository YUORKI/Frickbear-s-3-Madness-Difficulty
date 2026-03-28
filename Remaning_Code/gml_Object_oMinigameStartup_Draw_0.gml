shader_set(shRecolor);
var Pal = Palettes[global.Night - 1];
replace_color(13695200, 7389320, 5662772, 3354368, Pal[0], Pal[1], Pal[2], Pal[3]);
var Colors = [13695200, 7389320, 5662772, 3354368];

if (Startup)
{
    for (var i = 0; i < array_length(BlockLengths); i++)
    {
        var Start = 0;
        var End = 640;
        var Color = 0;
        
        if ((i % 2) == 1)
            Color = Colors[2];
        
        if (i != 0)
            Start = BlockLengths[i - 1];
        
        if (i != (array_length(BlockLengths) - 1))
            End = BlockLengths[i];
        
        draw_rectangle_color(0, Start, 640, End, Color, Color, Color, Color, false);
    }
    
    if ((Frame % 30) == 0)
    {
        BlockLengths = [];
        var End = 0;
        
        while (End < 640)
        {
            End += (irandom_range(1, 8) * 8);
            array_push(BlockLengths, End);
        }
    }
    
    if (Frame >= 180)
    {
        Startup = false;
        audio_stop_sound(sfxMinigameStartup);
        audio_play_sound(sfxBitCollect, 10, false);
        Frame = 0;
    }
}
else
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    draw_set_font(global.FontHanddrawn);
    draw_set_color(Colors[0]);
    var LocationText1 = " LOCATION " + string(global.Night) + " :";
    draw_sprite_ext(sMinigameStartupBG, 0, 0, 0, 2, 2, 0, c_white, 1);
    draw_text_transformed(8, 48, LocationText1, 2, 2, 0);
    var TextLength = string_width(LocationText1) * 2;
    draw_set_halign(fa_center);
    draw_set_font(global.FontW97White);
    draw_text_ext_transformed(TextLength + ((640 - TextLength) / 2), 32, LocationNames[global.Night - 1], 11, (600 - TextLength) / 2, 2, 2, 0);
    draw_set_halign(fa_center);
    var Text = "Let's go salvage!";
    Text = string_copy(Text, 0, floor((Frame - 60) / 8));
    draw_text_transformed(320, 314, Text, 2, 2, 0);
    draw_set_color(c_white);
    var GuardImage = global.Guard * 4;
    GuardImage += (floor(Frame / 8) % 2);
    
    if ((floor(Frame / 8) % 4) == 3)
        GuardImage += 1;
    
    draw_sprite_ext(Sprite, GuardImage, (Frame * 2) + 40, 260, 2, 2, 0, c_white, 1);
    
    if ((floor(Frame / 8) % 2) == 0 && (floor((Frame - 1) / 8) % 2) == 1 && Frame > 60 && Frame < 200)
        audio_play_sound(sfxBump, 10, false, 0.5);
    
    draw_sprite_ext(sMinigameStartupBuilding, 0, 0, 84, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sMinigameStartupBuilding, global.Night, 640, 84, -2, 2, 0, c_white, 1);
    
    if (Frame == 60)
        audio_play_sound(sfxAntonballIntermission, 10, false, 0.75);
    
    if (Frame == 300)
    {
        var Destinations = [MinigameMaze_1, MinigameMaze_2, MinigameMaze_3, MinigameMaze_4, MinigameMaze_5];
        room_goto(Destinations[global.Night - 1]);
    }
}

Frame++;
draw_set_valign(fa_top);
shader_reset();
