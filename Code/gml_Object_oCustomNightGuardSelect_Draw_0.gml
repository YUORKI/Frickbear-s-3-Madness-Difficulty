var RelativeMouseX = device_mouse_x_to_gui(0) - x;
var RelativeMouseY = device_mouse_y_to_gui(0) - y;

if (instance_exists(oCustomNightMenu))
{
    depth = oCustomNightMenu.depth - 1;
    
    if (oCustomNightMenu.ChallengesOpen)
        exit;
}

image_index = 0;

if (0 < RelativeMouseX && RelativeMouseX < 16 && 0 < RelativeMouseY && RelativeMouseY < 16 && mouse_check_button(mb_left))
{
    image_index = 1;
    
    if (mouse_check_button_pressed(mb_left))
    {
        audio_play_sound(sfxTick, 1, false);
        global.Guard -= 1;
    }
}

if (16 < RelativeMouseX && RelativeMouseX < 32 && 0 < RelativeMouseY && RelativeMouseY < 16 && mouse_check_button(mb_left))
{
    image_index = 2;
    
    if (mouse_check_button_pressed(mb_left))
    {
        audio_play_sound(sfxTick, 1, false);
        global.Guard += 1;
    }
}

var GuardNum = 4 - !global.UnlockedAnimatronics[UnknownEnum.Value_68];

if (global.GuardAmount > 4)
    GuardNum = global.GuardAmount;

global.Guard = (global.Guard + GuardNum) % GuardNum;
draw_self();
draw_sprite(sCustomNightCounter, global.Guard, x + 32, y);
draw_sprite(sTileBase, 0, x, y - 48);
draw_sprite(FaceSprites, global.Guard, x, y - 48);

enum UnknownEnum
{
    Value_68 = 68
}
