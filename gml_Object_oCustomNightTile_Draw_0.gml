var RelativeMouseX = device_mouse_x_to_gui(0) - x;
var RelativeMouseY = device_mouse_y_to_gui(0) - y;
var Unlocked = global.UnlockedAnimatronics[TileID];
depth = oCustomNightMenu.depth + 1;
image_index = 0;
var SPCharacters = [UnknownEnum.Value_6, UnknownEnum.Value_14, UnknownEnum.Value_17, UnknownEnum.Value_19, UnknownEnum.Value_31, UnknownEnum.Value_37, UnknownEnum.Value_39, UnknownEnum.Value_42, UnknownEnum.Value_41, UnknownEnum.Value_40];
var DiffLimit = 20;

if (global.Cheats[UnknownEnum.Value_1] && array_contains(SPCharacters, TileID))
    DiffLimit++;

if (Unlocked && (TileID < 40 || global.Cheats[UnknownEnum.Value_0]))
{
    if (0 < RelativeMouseX && RelativeMouseX < 48 && -48 < RelativeMouseY && RelativeMouseY < 0 && mouse_check_button_pressed(mb_left) && !oCustomNightMenu.ChallengesOpen)
    {
        if (global.AILevels[TileID] > 0)
            global.AILevels[TileID] = 0;
        else
            global.AILevels[TileID] = 20;
        
        audio_play_sound(sfxBump, 1, false);
    }
    
    if (0 < RelativeMouseX && RelativeMouseX < 16 && 0 < RelativeMouseY && RelativeMouseY < 16 && mouse_check_button(mb_left) && !oCustomNightMenu.ChallengesOpen)
    {
        image_index = 1;
        
        if ((mouse_check_button_pressed(mb_left) || (ClickFrame > 15 && (ClickFrame % 2) == 0)) && global.AILevels[TileID] != 0)
        {
            audio_play_sound(sfxTick, 1, false);
            global.AILevels[TileID] -= 1;
        }
    }
    
    if (16 < RelativeMouseX && RelativeMouseX < 32 && 0 < RelativeMouseY && RelativeMouseY < 16 && mouse_check_button(mb_left) && !oCustomNightMenu.ChallengesOpen)
    {
        image_index = 2;
        
        if ((mouse_check_button_pressed(mb_left) || (ClickFrame > 15 && (ClickFrame % 2) == 0)) && global.AILevels[TileID] != DiffLimit)
        {
            audio_play_sound(sfxTick, 1, false);
            global.AILevels[TileID] += 1;
        }
    }
}
else
{
    image_index = 3;
}

if (!mouse_check_button(mb_left))
    ClickFrame = 0;
else
    ClickFrame += 1;

global.AILevels[TileID] = clamp(global.AILevels[TileID], 0, DiffLimit);
draw_self();
draw_sprite(sCustomNightCounter, global.AILevels[TileID], x + 32, y);
var FaceActivity = 0;
var FaceSprite = oCustomNightMenu.SPRITE_FaceActive;

if (global.AILevels[TileID] == 0)
    FaceSprite = oCustomNightMenu.SPRITE_FaceInactive;

draw_sprite(sTileBase, !Unlocked, x, y - 48);

if (Unlocked)
    draw_sprite(FaceSprite, TileID, x, y - 48);

if ((0 < RelativeMouseX && RelativeMouseX < 48 && -48 < RelativeMouseY && RelativeMouseY < 16) && (TileID < 40 || global.Cheats[UnknownEnum.Value_0]))
{
    var TextName = "???";
    var TextDesc;
    
    if (TileID >= 20)
        TextDesc = "This animatronic is unavailable.";
    else
        TextDesc = "This animatronic has yet to be unlocked.";
    
    if (Unlocked)
        TextDesc = global.Descriptions[TileID][0] + ": " + global.Descriptions[TileID][1];
    
    depth = oCustomNightMenu.depth - 1;
    
    with (oCustomNightMenu)
        draw_text_ext(5, oCustomNightMenu.WindowY, TextDesc, 14, 462);
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_6 = 6,
    Value_14 = 14,
    Value_17 = 17,
    Value_19 = 19,
    Value_31 = 31,
    Value_37 = 37,
    Value_39 = 39,
    Value_40,
    Value_41,
    Value_42
}
