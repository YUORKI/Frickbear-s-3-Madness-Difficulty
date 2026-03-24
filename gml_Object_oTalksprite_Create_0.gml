BounceFrame = 0;
x = 960;
BaseY = y - 8;
CurrentImage = 0;
Image = 0;
LeaveAcceleration = 10;
Enter = true;
Sprite = -1;
CharacterSpeaking = 0;
SecondarySprite = sNOTHING;
SecondaryImage = 0;
CharOffset = 0;
CharOffsetSpeed = 0;

function switch_chars(arg0, arg1 = 0)
{
    CharacterSpeaking = arg1;
    SecondaryImage = CurrentImage;
    Image = arg0;
}

function draw_everything()
{
    draw_set_alpha(1);
    y = BaseY + ((dsin(BounceFrame) * 10) / ((floor(BounceFrame / 90) * 2) + 1));
    BounceFrame = min(BounceFrame + 45, 900);
    
    if (Enter == true)
    {
        x += (((room_width / 2) - x) / 10);
    }
    else
    {
        x += LeaveAcceleration;
        LeaveAcceleration -= 1;
    }
    
    if (x < -320)
        instance_destroy();
    
    if (Image != CurrentImage)
    {
        CurrentImage = Image;
        BounceFrame = 0;
    }
    
    draw_sprite(sprite_index, !CharacterSpeaking ? CurrentImage : SecondaryImage, x + CharOffset, y);
    draw_sprite(SecondarySprite, CharacterSpeaking ? CurrentImage : SecondaryImage, (x + CharOffset) - 640, y);
    draw_rectangle_color(0, lerp(232, 361, abs(x - 320) / 320), 640, 361, c_black, c_black, c_black, c_black, false);
    CharOffsetSpeed = lerp(CharOffsetSpeed, ((CharacterSpeaking * 640) - CharOffset) * 0.2, 0.4);
    CharOffset += CharOffsetSpeed;
}
