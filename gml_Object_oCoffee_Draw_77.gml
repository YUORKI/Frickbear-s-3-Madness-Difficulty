var ID = UnknownEnum.Value_40;
var AI = global.AILevels[ID];

if (AI == 21)
{
    ActivationTime = 1;
    global.Timer = max(240, global.Timer);
    
    if (global.Timer < 290)
    {
        with (oHelpy)
            Timer = 0;
    }
}

if (global.Timer < ActivationTime || AI <= 0)
    exit;

set_target_to_ui();
var EdgeT = 16;
var EdgeR = 568;
var EdgeB = 344;
var EdgeL = 72;
var Image = floor((Frame + 10) * 2) % 2;

if (Frame >= 0 && !Cleared)
{
    var Passed = BallX <= EdgeL;
    var Completed = Rallies >= lerp(2, 8, AI / 20) && (AI != 21 || global.Timer > 355);
    
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
            global.Power = 0;
            
            if (AI == 21)
            {
                with (oFoxy)
                    Phase = 344;
            }
        }
    }
}

var SpriteTop = 48 * SpriteDraw;
var SpriteHeight = 96 * SpriteDraw;

if (SpriteDraw > 0)
{
    draw_sprite_part(sCoffee, 2 + Image, 0, 48 - SpriteTop, 96, SpriteHeight, BallX - 32, BallY - SpriteTop);
    draw_sprite_part(sCoffee, 0 + Image, 0, 48 - SpriteTop, 96, SpriteHeight, 8, device_mouse_y_to_gui(0) - SpriteTop);
    draw_sprite_part(sCoffee, 4 + Image, 0, 48 - SpriteTop, 96, SpriteHeight, 568, BunnyY - SpriteTop);
    draw_set_alpha(0.5);
    draw_sprite_part(sCoffeeGrid, 0 + Image, 0, 48 - SpriteTop, 96, SpriteHeight, 8, device_mouse_y_to_gui(0) - SpriteTop);
    draw_sprite_part(sCoffeeGrid, 4 + Image, 0, 48 - SpriteTop, 96, SpriteHeight, 568, BunnyY - SpriteTop);
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
    XSpeed = lerp(2, 5, AI / 20);
    bounce(true);
    YSpeed = XSpeed;
}

Frame += 0.016666666666666666;
surface_reset_target();

enum UnknownEnum
{
    Value_40 = 40
}
