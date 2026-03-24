var ID = UnknownEnum.Value_40;
var AI = 10;
var BunnyFactor = global.MicrogameLevel * 48;
var EdgeT = 16;
var EdgeR = 640 - (72 + BunnyFactor);
var EdgeB = 344;
var EdgeL = 16 + (56 + BunnyFactor);
var Image = floor((Frame + 10) * 2) % 2;

if (Frame >= 0 && !Cleared)
{
    var Passed = BallX <= EdgeL;
    var Completed = Rallies >= 5;
    
    if (abs(device_mouse_y_to_gui(0) - BallY) > 48 || Passed)
        EdgeL = -32;
    
    if ((BallX + XSpeed) <= EdgeL && !Passed)
    {
        BallX = EdgeL;
        XSpeed *= -1;
        bounce(true);
    }
    else if ((BallX + XSpeed) >= EdgeR && !Completed)
    {
        BallX = EdgeR;
        XSpeed *= -1;
        Rallies++;
        bounce(true);
    }
    else
    {
        BallX += XSpeed;
    }
    
    if ((BallY + YSpeed) <= EdgeT)
    {
        BallY = EdgeT;
        YSpeed *= -1;
        bounce(false);
    }
    else if ((BallY + YSpeed) >= EdgeB)
    {
        BallY = EdgeB;
        YSpeed *= -1;
        bounce(false);
    }
    else
    {
        BallY += YSpeed;
    }
    
    if (XSpeed > 0 && !Completed)
        BunnySpeed = lerp(BunnySpeed, (BallY - BunnyY) * 0.5, 0.1);
    else
        BunnySpeed *= 0.8;
    
    BunnyY += BunnySpeed;
    
    if (abs(BallX - 320) > 352)
    {
        Cleared = true;
        audio_play_sound(sfxCoffeeWarning, 15, false);
        
        if (BallX < 320)
        {
            audio_play_sound(sfxBitExplosion, 15, false);
            global.MicrogameWin = false;
            end_microgame();
        }
    }
}

var SpriteTop = 48 * SpriteDraw;
var SpriteHeight = 96 * SpriteDraw;

if (SpriteDraw > 0)
{
    draw_sprite_part(sCoffee, 2 + Image, 0, 48 - SpriteTop, 96, SpriteHeight, BallX - 32, BallY - SpriteTop);
    draw_sprite_part(sCoffee, 0 + Image, 0, 48 - SpriteTop, 96, SpriteHeight, (40 + BunnyFactor) - 32, device_mouse_y_to_gui(0) - SpriteTop);
    draw_sprite_part(sCoffee, 4 + Image, 0, 48 - SpriteTop, 96, SpriteHeight, 600 - (32 + BunnyFactor), BunnyY - SpriteTop);
    draw_set_alpha(0.5);
    draw_sprite_part(sCoffeeGrid, 0 + Image, 0, 48 - SpriteTop, 96, SpriteHeight, (40 + BunnyFactor) - 32, device_mouse_y_to_gui(0) - SpriteTop);
    draw_sprite_part(sCoffeeGrid, 4 + Image, 0, 48 - SpriteTop, 96, SpriteHeight, 600 - (32 + BunnyFactor), BunnyY - SpriteTop);
    draw_set_alpha(1);
}

if (!Cleared && SpriteDraw < 1)
    SpriteDraw += (1/120);
else if (Cleared && SpriteDraw > 0)
    SpriteDraw -= 0.016666666666666666;

if (Frame < 0 && ((Frame + 10) % 1) == 0.016666666666666666)
    audio_play_sound(sfxCoffeeWarning, 15, false);

if (Frame == 0)
{
    XSpeed = -5 * global.MicrogameSpeed;
    bounce(true);
    YSpeed = XSpeed;
}

Frame += 0.016666666666666666;

enum UnknownEnum
{
    Value_40 = 40
}
