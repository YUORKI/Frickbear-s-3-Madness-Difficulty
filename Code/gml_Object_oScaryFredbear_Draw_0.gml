var Offset = FadeOffset * binary_to_sign(floor(Frame / 2) % 2);
var HeadX = 320 + Offset;
var HeadY = 120 + (dsin(Frame) * 2) + EyeOffset;
var FloatingHeadOffset = FadeOffsetHeads * binary_to_sign(floor(Frame / 2) % 2) * -1;
draw_sprite(sScaryFreadbear_Heads, 0, FloatingHeadOffset + 10, 45 + (dsin(Frame) * 4));
draw_sprite(sScaryFreadbear_Heads, 1, FloatingHeadOffset + 166, 8 + (dsin(Frame - 30) * 4));
draw_sprite(sScaryFreadbear_Heads, 2, FloatingHeadOffset + 330, 61 + (dsin(Frame - 60) * 4));
draw_sprite(sScaryFreadbear_Heads, 3, FloatingHeadOffset + 477, 14 + (dsin(Frame - 90) * 4));
draw_sprite(sScaryFredbear, 1, HeadX, 196 + (dsin(Frame + 30) * 4) + (EyeOffset / 4));
draw_sprite(sScaryFredbear, 0, HeadX, HeadY);

if (EntranceFrame <= 4)
{
    if (EntranceFrame < 2)
    {
        Eyes = UnknownEnum.Value_4;
    }
    else if (EntranceFrame == 2)
    {
        Eyes = UnknownEnum.Value_1;
        EyeOffsetSpeed = 5;
    }
    else if (EntranceFrame < 2.7)
    {
        if (EyeOffsetSpeed <= 0)
            Eyes = UnknownEnum.Value_0;
    }
    else if (EntranceFrame < 2.8)
    {
        Eyes = UnknownEnum.Value_1;
    }
    else if (EntranceFrame < 2.9)
    {
        Eyes = UnknownEnum.Value_0;
    }
    else if (EntranceFrame < 3)
    {
        Eyes = UnknownEnum.Value_1;
    }
    else if (EntranceFrame < 4)
    {
        Eyes = UnknownEnum.Value_0;
    }
    else
    {
        Eyes = UnknownEnum.Value_2;
        EyeOffsetSpeed = 4;
        audio_play_sound(musFredbearIntro, 10, true);
    }
}

switch (Eyes)
{
    case UnknownEnum.Value_0:
    case UnknownEnum.Value_1:
    case UnknownEnum.Value_2:
        draw_sprite(sScaryFredbear_Eyes, Eyes, HeadX - 24, HeadY - 8);
        draw_sprite(sScaryFredbear_Eyes, Eyes, HeadX + 24, HeadY - 8);
        break;
    
    case UnknownEnum.Value_3:
        draw_sprite(sScaryFredbear_Eyes, 0, HeadX - 48, HeadY - 8);
        draw_sprite(sScaryFredbear_Eyes, 0, HeadX + 16, HeadY - 8);
        break;
    
    case UnknownEnum.Value_4:
        break;
}

if (FadeIn)
{
    FadeOffset -= (FadeOffset / FadeSpeed);
    EntranceFrame += 0.016666666666666666;
}
else
{
    FadeOffset += ((10 + FadeOffset) / FadeSpeed);
}

if (ShowMasks)
    FadeOffsetHeads -= (FadeOffsetHeads / FadeSpeed);
else
    FadeOffsetHeads += ((10 + FadeOffsetHeads) / FadeSpeed);

EyeOffsetSpeed = lerp(EyeOffsetSpeed, (0 - EyeOffset) * 0.5, 0.25);
EyeOffset += EyeOffsetSpeed;
Frame++;

if (keyboard_check_pressed(vk_shift))
{
    FadeIn = !FadeIn;
    FadeSpeed = 5;
}

FadeOffset = clamp(FadeOffset, 0, 450);
FadeOffsetHeads = clamp(FadeOffsetHeads, 0, 640);

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4
}
