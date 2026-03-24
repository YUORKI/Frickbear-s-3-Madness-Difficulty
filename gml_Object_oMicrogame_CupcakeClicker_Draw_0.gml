if (!surface_exists(global.MinigameSurface))
    global.MinigameSurface = surface_create(160, 144);

surface_set_target(global.MinigameSurface);
draw_clear_alpha(c_black, 0);
var TexC = 3354368;
var TexCLight = 13695200;
draw_rectangle_color(0, 0, 160, 144, TexC, TexC, TexC, TexC, false);
var Paused = false;

if (room == Office)
{
    if (!global.CamUp || global.MonitorSystem != "Games")
        Paused = true;
}

if (mouse_check_button_pressed(mb_left) && !Paused && mouse_in_minigame_window() && CupcakeMeter < 1)
{
    Shake = 5;
    audio_play_sound(sfxBitCrunch, 5, false);
    Score++;
    
    if ((Score % 5) == 0)
        add_tokens(1);
    
    CupcakeMeter += 0.1;
    
    if (CupcakeMeter >= 1)
    {
        audio_play_sound(sfxBitExplosion, 30, false);
        CupcakeYSpeed = -6;
        global.MicrogameWin = true;
        end_microgame();
    }
}

if (CupcakeMeter >= 1)
{
    CupcakeAngle += 15;
    CupcakeSize -= (CupcakeSize / 10);
    CupcakeYSpeed += 0.3;
}

CupcakeY += CupcakeYSpeed;
var BonFrame = 0;

if (AnimFrame > BlinkFrame)
{
    var Blink = floor((AnimFrame - BlinkFrame) / 5);
    BonFrame = 2 - abs(Blink - 2);
    
    if (Blink >= 4)
        BlinkFrame += irandom_range(60, 240);
}

if (round(Shake) > 0 || CupcakeMeter >= 1)
    BonFrame = 3;

draw_sprite_ext(sCC_Cupcake, BonFrame, round(irandom_range(Shake * -1, Shake)) + 80, CupcakeY + round(irandom_range(Shake * -1, Shake)) + 72, CupcakeSize, CupcakeSize, CupcakeAngle, c_white, 1);
draw_rectangle_color(0, 140, CupcakeMeter * 160, 144, TexCLight, TexCLight, TexCLight, TexCLight, false);
Shake -= (Shake / 10);
AnimFrame++;

if (CupcakeMeter < 1)
    CupcakeMeter = max(CupcakeMeter - 0.002, 0);

surface_reset_target();
