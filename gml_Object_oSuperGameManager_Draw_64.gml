depth = -99;
draw_set_font(global.FontW97Black);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

for (var i = 0; i < array_length(global.TrophyQueue); i++)
{
    var obj = global.TrophyQueue[i];
    draw_sprite_ext(sTrophyPopup, 0, obj._x, obj._y, 1, 1, 0, c_white, 0.75);
    draw_sprite(sTrophyIcons, obj.TrophyID, obj._x + 4, obj._y + 4);
    draw_text(obj._x + 56, obj._y + 9, "TROPHY UNLOCKED!");
    draw_text_ext(obj._x + 56, obj._y + 34, obj.Name, 14, 182);
    
    if (obj.Timer < 120)
    {
        obj._x += (400 - obj._x) / 5;
    }
    else
    {
        obj._x += ((obj._x - 400) + 1) / 2;
        
        if (obj._x > 640)
        {
            array_delete(global.TrophyQueue, i, 1);
            i--;
        }
    }
    
    obj.Timer++;
}

if (global.Settings[3][3] != 0)
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    draw_set_font(global.FontW97White);
    var Text = format_as_timer((global.Settings[3][3] == 1) ? global.RunTime : global.Playtime, true);
    
    for (var i = 0; i < 360; i += 45)
        draw_text_color(5 + round(lengthdir_x(1, i)), 355 + round(lengthdir_y(1, i)), Text, c_black, c_black, c_black, c_black, 1);
    
    draw_text(5, 355, Text);
}

draw_set_valign(fa_top);

if (keyboard_check_pressed(vk_tab) && global.DevMode)
{
    screen_save(working_directory + "ScreensScreen_" + string(ScreenshotsTaken++) + ".png");
    audio_play_sound(sfxCamSwitch, 10, false);
}
