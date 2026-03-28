draw_set_font(global.FontW97Black);
var SelectedItem = "";
var TopBarOffset = -30 * (1 - TileSize);
draw_set_halign(fa_center);

for (var i = 0; i < array_length(OptionTitles); i++)
{
    if (i == 7 && !BossMenuUnlocked)
        break;
    
    if (i == 8 && !BuildingViewerUnlocked)
        break;
    
    var ButtonX = 28 + (200 * (i % 3));
    var ButtonY = (57 + (146 * floor(i / 3))) - BarOffset;
    ButtonX += ((1 - TileSize) * 92);
    ButtonY += ((1 - TileSize) * 65);
    var CurrentDirection = Timer + ((ButtonX + ButtonY) / -4);
    ButtonX += round(lengthdir_x(2, CurrentDirection));
    ButtonY += round(lengthdir_y(2, CurrentDirection));
    ButtonX = round(ButtonX);
    ButtonY = round(ButtonY);
    var TileAngle = 0;
    var Hovered = mouse_in_zone(ButtonX, ButtonY, 184, 130);
    
    if (mouse_in_zone(ButtonX, ButtonY, 184, 130) && Active)
    {
        shader_set(shFlash);
        
        for (var o = -45; o < 360; o += 90)
            draw_sprite_ext(sExtras_TopButtons, i, ButtonX + round(lengthdir_x(TileSize * 4, o)), ButtonY + round(lengthdir_y(TileSize * 4, o)), TileSize, TileSize, 0, c_white, 1);
        
        shader_reset();
        SelectedItem = OptionDescs[i];
        
        if (mouse_check_button_pressed(mb_left))
        {
            Active = false;
            audio_play_sound(sfxClick, 5, false);
            instance_destroy(oExtras_AnimatronicSelect);
            instance_destroy(oExtras_ConceptArtGallery);
            instance_destroy(oExtras_Minigames);
            instance_destroy(oExtras_Trophies);
            instance_destroy(oExtras_Statistics);
            instance_destroy(oExtras_MusicPlayer);
            instance_destroy(oExtras_Bosses);
            instance_destroy(oExtras_BuildingViewer);
            
            switch (i)
            {
                case 0:
                    instance_create_depth(0, 0, depth, oExtras_AnimatronicSelect);
                    break;
                
                case 1:
                    instance_create_depth(-220, 0, depth - 2, oExtras_ConceptArtGallery);
                    break;
                
                case 2:
                    instance_create_depth(-220, 0, depth - 2, oExtras_Minigames);
                    break;
                
                case 3:
                    instance_create_depth(-220, 0, depth - 2, oExtras_Trophies);
                    break;
                
                case 4:
                    instance_create_depth(-220, 0, depth - 2, oExtras_Statistics);
                    break;
                
                case 5:
                    instance_create_depth(-220, 0, depth - 2, oExtras_MusicPlayer);
                    break;
                
                case 6:
                    instance_create_depth(-220, 0, depth - 1, oExtras_Credits);
                    break;
                
                case 7:
                    instance_create_depth(-220, 0, depth - 2, oExtras_Bosses);
                    break;
                
                case 8:
                    instance_create_depth(-220, 0, depth - 2, oExtras_BuildingViewer);
                    break;
            }
            
            WaitToGoBack = true;
            PrevColor = 0;
            CurColor = i + 1;
            ColorTrans = 0;
        }
    }
    
    var Alpha = 1;
    draw_sprite_ext(sExtras_TopButtons, i, ButtonX, ButtonY, TileSize, TileSize, 0, c_white, Alpha);
    
    if (round(TileSize * 50) < 50)
        draw_text_transformed(ButtonX + round(92 * TileSize), ButtonY + round(105 * TileSize), OptionTitles[i], TileSize, TileSize, 0);
    else
        draw_text(ButtonX + round(92 * TileSize), ButtonY + round(105 * TileSize), OptionTitles[i]);
}

draw_set_halign(fa_left);
draw_sprite_stretched(sTextBox_Windows, 0, 0, TopBarOffset, 640, 30);
draw_text(33, 5 + TopBarOffset, "Extras Menu");
var Quit = clicked(4, TopBarOffset + 4, 22, 22) || input_check_pressed(UnknownEnum.Value_1);
draw_sprite_stretched(sButtonMini, 0, 4, TopBarOffset + 4, 22, 22);
draw_sprite(sButtonMini_Icons, 0, 15, TopBarOffset + 4 + 11);
draw_set_halign(fa_right);
draw_sprite_stretched(sTextBox_Windows, 1, 156, 4 + TopBarOffset, 480, 22);
draw_text(630, 5 + TopBarOffset, SelectedItem);
var ScrollBar = scroll_bar(BarOffset, BarDragged, 0, 30, 640 - (TileSize * 16), 330, 476, 73);

if (Active)
{
    BarOffset = ScrollBar[0];
    BarDragged = ScrollBar[1];
}

if (Active && Quit && TileSize > 0.5)
{
    audio_stop_all();
    audio_play_sound(sfxBump, 10, false);
    room_goto(TitleScreenMap);
}

if (Active)
{
    TileSize += ((1 - TileSize) / 5);
    
    if (WaitToGoBack)
    {
        WaitToGoBack = false;
        PrevColor = CurColor;
        CurColor = 0;
        ColorTrans = 0;
    }
}
else
{
    TileSize -= (TileSize / 5);
}

Timer = (Timer + 4) % 360;

if (round(TransitionPercent * 180) > 0)
{
    draw_rectangle_color(0, 0, 640, 180 * TransitionPercent, c_black, c_black, c_black, c_black, false);
    draw_rectangle_color(0, 360, 640, 360 - (180 * TransitionPercent), c_black, c_black, c_black, c_black, false);
    TransitionPercent *= 0.9;
}

draw_set_halign(fa_left);
ColorTrans += ((1 - ColorTrans) / 20);

enum UnknownEnum
{
    Value_1 = 1
}
