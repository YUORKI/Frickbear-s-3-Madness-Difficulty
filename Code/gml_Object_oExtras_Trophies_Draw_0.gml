var TopBarOffset = -224 * (1 - TileSize);
draw_set_font(global.FontW97Black);
draw_set_halign(fa_left);
draw_sprite_stretched(sTextBox_Windows, 0, TopBarOffset, 0, 224, 360);
draw_sprite_stretched(sTextBox_Windows, 1, TopBarOffset + 28, 4, 192, 22);
var TrophyText = "Trophies: " + string(TrophiesNum) + "/42" + ((ForbiddenTrophiesNum == 0) ? "" : string(" (+{0})", ForbiddenTrophiesNum));
draw_text(TopBarOffset + 33, 5, TrophyText);
draw_sprite_stretched(sTextBox_Windows, 2, TopBarOffset + 4, 28, 216, 328);
draw_sprite_stretched(sButtonMini, 0, TopBarOffset + 4, 4, 22, 22);
draw_sprite(sButtonMini_Icons, 0, TopBarOffset + 4 + 11, 15);
CurrentX = 0;
CurrentY = 0;
YOffset += ((mouse_wheel_up() - mouse_wheel_down()) * 56);
TileSize += ((Active - TileSize) / 5);
var ExtrasEntryAmount = array_length(Trophies);
var RowAmount = ceil(ExtrasEntryAmount / 7);

if (!(global.UnlockedTrophies[UnknownEnum.Value_42] || global.UnlockedTrophies[UnknownEnum.Value_43] || global.UnlockedTrophies[UnknownEnum.Value_44] || global.UnlockedTrophies[UnknownEnum.Value_45] || global.UnlockedTrophies[UnknownEnum.Value_46]))
    RowAmount--;

YOffset = clamp(YOffset, 56 * (7 - RowAmount), 56);

for (var i = 0; i < ExtrasEntryAmount; i++)
{
    var TileX = (CurrentX * 56) + 240 + ((1 - TileSize) * 24);
    var TileY = ((CurrentY * 56) - 40) + YOffset + ((1 - TileSize) * 24);
    CurrentX++;
    
    if (CurrentX == 7)
    {
        CurrentX = 0;
        CurrentY++;
    }
    
    var CurrentDirection = Timer + ((TileX + TileY) / -2);
    TileX += lengthdir_x(2, CurrentDirection);
    TileY += lengthdir_y(2, CurrentDirection);
    var TileAngle = dsin(CurrentDirection) * 2;
    var Unlocked = true;
    
    if (i >= UnknownEnum.Value_42 && !global.UnlockedTrophies[i])
    {
        CurrentX--;
    }
    else
    {
        if (mouse_in_zone(TileX, TileY, 48, 48) && Active)
        {
            shader_set(shFlash);
            
            for (var o = -45; o < 360; o += 90)
                draw_sprite_ext(sTileBase, 0, TileX + round(lengthdir_x(TileSize * 4, o)), TileY + round(lengthdir_y(TileSize * 4, o)), TileSize, TileSize, TileAngle, c_white, 1);
            
            shader_reset();
            var Text = global.UnlockedTrophies[i] ? get_trophy_name(i) : "???";
            
            if (i >= UnknownEnum.Value_42)
                Text += " (FORBIDDEN)";
            else if (i >= UnknownEnum.Value_35)
                Text += " (PLATINUM)";
            else if (i >= UnknownEnum.Value_28)
                Text += " (GOLD)";
            else if (i >= UnknownEnum.Value_14)
                Text += " (SILVER)";
            else
                Text += " (BRONZE)";
            
            Text += ("\n\n" + ((Trophies[i].Display || global.UnlockedTrophies[i]) ? Trophies[i].Desc : "???"));
            draw_text_ext(TopBarOffset + 10, 30, Text, 14, 202);
            global.ExtrasNotifs.TrophyNotifs[i] = false;
        }
        
        if (global.UnlockedTrophies[i])
        {
            draw_sprite_ext(sTrophyIcons, i, TileX, TileY, TileSize, TileSize, TileAngle, c_white, 1);
            
            if (global.ExtrasNotifs.TrophyNotifs[i])
                draw_sprite_ext(sExtrasNotification, 0, TileX, TileY, TileSize, TileSize, TileAngle, c_white, 1);
        }
        else
        {
            draw_sprite_ext(sTileBase, 0, TileX, TileY, TileSize, TileSize, TileAngle, c_white, 0.5);
            shader_set(shFlash);
            draw_sprite_ext(sCustomNightFaces, Trophies[i].Icon, TileX, TileY, TileSize, TileSize, TileAngle, c_black, 0.25);
            shader_reset();
        }
    }
}

Timer = (Timer + 4) % 360;
var Quit = clicked(4, 4, 22, 22) || input_check_pressed(UnknownEnum.Value_1);

if (Active && Quit && TileSize > 0.5)
{
    audio_play_sound(sfxBump, 5, false);
    Active = false;
    oExtras.Active = true;
}

if (TileSize < 0.01 && oExtras.Active)
    instance_destroy();

enum UnknownEnum
{
    Value_1 = 1,
    Value_14 = 14,
    Value_28 = 28,
    Value_35 = 35,
    Value_42 = 42,
    Value_43,
    Value_44,
    Value_45,
    Value_46
}
