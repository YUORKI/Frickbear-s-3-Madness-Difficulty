CurrentX = 0;
CurrentY = 0;
TileSize += ((Active - TileSize) / 5);
var ExtrasEntryAmount = 50;
var RowAmount = ceil(ExtrasEntryAmount / 10);
var SelectedName = "";
var ScrollBar = scroll_bar(YOffset, BarDragged, 0 - (TileSize * 16), 30, 640, 330, 56 * (RowAmount + 1), 56);
YOffset = ScrollBar[0];
BarDragged = ScrollBar[1];

for (var i = 0; i < ExtrasEntryAmount; i++)
{
    var TileX = ((CurrentX * 56) + 44 + ((1 - TileSize) * 24)) - 8;
    var TileY = ((CurrentY * 56) + 8 + ((1 - TileSize) * 24)) - (YOffset - 56);
    var CurrentDirection = Timer + ((TileX + TileY) / -2);
    TileX += lengthdir_x(2, CurrentDirection);
    TileY += lengthdir_y(2, CurrentDirection);
    var TileAngle = dsin(CurrentDirection) * 2;
    var Unlocked = UnlockedArray[i];
    
    if (mouse_in_zone(TileX, TileY, 48, 48) && Unlocked && Active)
    {
        shader_set(shFlash);
        
        for (var o = -45; o < 360; o += 90)
            draw_sprite_ext(sTileBase, 0, TileX + round(lengthdir_x(TileSize * 4, o)), TileY + round(lengthdir_y(TileSize * 4, o)), TileSize, TileSize, TileAngle, c_white, 1);
        
        shader_reset();
        SelectedName = NamesArray[i][0];
        
        if (mouse_check_button_pressed(mb_left))
        {
            Active = false;
            
            if (i == FredbearTile)
            {
                global.MicrogameWin = true;
                audio_play_sound(sfxBitBoost, 5, false);
            }
            else
            {
                with (instance_create_depth(0, 0, depth - 1, oJumpscareTest))
                {
                    JumpscareID = is_nonlethal(i) ? UnknownEnum.Value_55 : i;
                    sprite_index = sJumpscare;
                    Side = 0;
                    SideVertical = (i == UnknownEnum.Value_9) ? 1 : -1;
                }
                
                audio_play_sound(sfxBitFail, 5, false);
            }
            
            audio_play_sound(sfxClick, 5, false);
            end_microgame();
        }
    }
    
    if (Unlocked)
    {
        draw_sprite_ext(sTileBase, 0, TileX, TileY, TileSize, TileSize, TileAngle, c_white, 1);
        draw_sprite_ext(sCustomNightFaces, (i == FredbearTile) ? UnknownEnum.Value_55 : i, TileX, TileY, TileSize, TileSize, TileAngle, c_white, 1);
    }
    else
    {
        draw_sprite_ext(sTileBase, 0, TileX, TileY, TileSize, TileSize, TileAngle, c_white, 0.5);
        shader_set(shFlash);
        draw_sprite_ext(sCustomNightFaces, i, TileX, TileY, TileSize, TileSize, TileAngle, c_black, 0.25);
        shader_reset();
    }
    
    CurrentX++;
    
    if (CurrentX == 10)
    {
        CurrentX = 0;
        CurrentY++;
    }
}

Timer = (Timer + (4 * global.MicrogameSpeed)) % 360;
var TopBarOffset = -30 * (1 - TileSize);
draw_set_font(global.FontW97Black);
draw_set_halign(fa_left);
draw_sprite_stretched(sTextBox_Windows, 0, 0, TopBarOffset, 640, 30);
draw_sprite_stretched(sButtonMini, 0, 4, TopBarOffset + 4, 22, 22);
draw_sprite(sButtonMini_Icons, 0, 15, TopBarOffset + 4 + 11);
draw_text(33, 5 + TopBarOffset, "Character Gallery");
draw_set_halign(fa_right);
draw_sprite_stretched(sTextBox_Windows, 1, 456, 4 + TopBarOffset, 180, 22);
draw_text(630, 5 + TopBarOffset, SelectedName);
draw_set_halign(fa_left);
show_debug_message(FredbearTile);

enum UnknownEnum
{
    Value_9 = 9,
    Value_55 = 55
}
