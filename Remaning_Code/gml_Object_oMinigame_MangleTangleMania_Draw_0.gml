if (!surface_exists(global.MinigameSurface))
    global.MinigameSurface = surface_create(160, 144);

surface_set_target(global.MinigameSurface);
draw_clear_alpha(c_black, 0);

if (Initialize)
{
    MangleX = 10;
    MangleY = 4;
    TravelDirection = 270;
    Frame = 0;
    CycleFrames = 8;
    Multiplier = 1;
    Length = 0;
    
    for (i = 160; i >= 0; i--)
    {
        PieceX[i] = MangleX;
        PieceY[i] = MangleY - i;
        PieceDir[i] = -1;
        PieceTurn[i] = 0;
    }
    
    AppleX = 10;
    AppleY = 8;
    ds_queue_destroy(ControlQueue);
    ControlQueue = ds_queue_create();
    Dead = false;
    DeathFrames = 0;
    WaitForClick = true;
    Initialize = false;
}

draw_sprite(sMMM_Background, 0, 0, 0);
var Speed = 1 / CycleFrames;

if (WaitForClick)
{
    if ((mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right) || input_check_pressed(UnknownEnum.Value_0)) && SpawnInDelay == 0)
        WaitForClick = false;
}
else
{
    if (mouse_check_button_pressed(mb_left) * mouse_in_minigame_window())
        ds_queue_enqueue(ControlQueue, 90);
    
    if (mouse_check_button_pressed(mb_right) * mouse_in_minigame_window())
        ds_queue_enqueue(ControlQueue, -90);
    
    if (input_check_pressed(UnknownEnum.Value_0))
        WaitForClick = true;
}

if (room == Office)
{
    if (global.MonitorSystem != "Games" || !global.CamUp)
    {
        WaitForClick = true;
        SpawnInDelay = 2;
    }
}

if (Frame == 0 && !WaitForClick)
{
    var Turn = 0;
    
    if (!ds_queue_empty(ControlQueue))
    {
        Turn = ds_queue_head(ControlQueue);
        TravelDirection += Turn;
        
        if (Turn != 0)
            audio_play_sound(sfxBitPlace, 1, false, 0.5);
        
        ds_queue_dequeue(ControlQueue);
        TravelDirection = (TravelDirection + 360) % 360;
    }
    
    i = Length + 5;
    
    while (i > 0)
    {
        PieceX[i] = PieceX[i - 1];
        PieceY[i] = PieceY[i - 1];
        PieceDir[i] = PieceDir[i - 1];
        PieceTurn[i] = PieceTurn[i - 1];
        i--;
    }
    
    PieceX[i] = MangleX;
    PieceY[i] = MangleY;
    PieceDir[i] = TravelDirection / 90;
    PieceTurn[i] = Turn / 90;
    
    if (MangleX == AppleX && MangleY == AppleY)
    {
        add_tokens(Multiplier);
        global.TokensPerMinigame[UnknownEnum.Value_8] += Multiplier;
        Length += 2;
        
        if ((Length / 2) > global.HiScores[UnknownEnum.Value_8])
            global.HiScores[UnknownEnum.Value_8] = Length / 2;
        
        if ((Length / 2) > global.HiScoresOverall[UnknownEnum.Value_8])
            global.HiScoresOverall[UnknownEnum.Value_8] = Length / 2;
        
        if ((Length / 2) == 50)
            get_trophy(UnknownEnum.Value_8);
        
        if ((Length % 20) == 0)
        {
            audio_play_sound(sfxBitBoost, 1, false);
            BonusFrames = 120;
            Multiplier += 1;
        }
        
        AppleX = irandom_range(2, 17);
        AppleY = irandom_range(0, 15);
        
        while (touching_mangle(AppleX, AppleY, true))
        {
            AppleX = irandom_range(2, 17);
            AppleY = irandom_range(0, 15);
        }
        
        audio_play_sound(sfxBitCrunch, 1, false);
    }
    
    audio_play_sound(sfxBump, 1, false, 0.25);
}

draw_set_font(global.FontGameboy);
draw_set_halign(fa_left);
var TexCLight = 13695200;
var TexC = 3354368;
var HeaderText = "Pieces: " + string(Length / 2);

if (BonusFrames > 0)
{
    BonusFrames--;
    HeaderText = "MULTI " + string(Multiplier) + "X!";
}

draw_text_color(2, 4, HeaderText, TexCLight, TexCLight, TexCLight, TexCLight, 1);

if (!(Dead || WaitForClick))
{
    MangleX += lengthdir_x(Speed, TravelDirection);
    MangleY += lengthdir_y(Speed, TravelDirection);
}

draw_sprite(sMMM_Gear, 8, (AppleX * 8) + 4, (AppleY * 8) + 20);
var i = Length - 1;

while (i >= 0)
{
    var PieceFrame = Frame;
    var PieceSprite = sMMM_PieceStraight;
    var PieceFlip = 1;
    
    if (PieceTurn[i] != 0)
    {
        PieceSprite = sMMM_PieceCorner;
        PieceFlip = PieceTurn[i];
    }
    
    draw_sprite_ext(PieceSprite, PieceFrame + 8, (PieceX[i] * 8) + 4, (PieceY[i] * 8) + 20, 1, 1, PieceDir[i] * 90, c_white, 1);
    
    if (i != (Length - 1))
        draw_sprite_ext(PieceSprite, PieceFrame, (PieceX[i] * 8) + 4, (PieceY[i] * 8) + 20, 1, PieceFlip, PieceDir[i] * 90, c_white, 1);
    
    i--;
}

draw_sprite_ext(sMMM_PieceStraight, 4, (MangleX * 8) + 4, (MangleY * 8) + 20, 1, 1, TravelDirection, c_white, 1);
draw_sprite(sMMM_MangleHead, (TravelDirection / 45) + (floor((Frame * 2) / CycleFrames) % 2), (MangleX * 8) + 4, (MangleY * 8) + 16);

if ((touching_mangle(MangleX, MangleY, false) || MangleX >= 18 || MangleX <= 1 || MangleY >= 16 || MangleY <= -1) && !Dead)
{
    audio_play_sound(sfxBitExplosion, 10, false);
    Dead = true;
    DeathFrames = 180;
}

if (!(Dead || WaitForClick))
{
    Frame = (Frame + 1) % CycleFrames;
}
else if (Dead)
{
    DeathFrames -= 1;
    
    if (DeathFrames == 0)
    {
        Dead = false;
        Initialize = true;
    }
}

if (SpawnInDelay > 0)
    SpawnInDelay--;

if (WaitForClick)
{
    draw_set_halign(fa_center);
    draw_rectangle_color(0, 64, 160, 80, TexC, TexC, TexC, TexC, false);
    draw_text_color(80, 69, "PAUSED", TexCLight, TexCLight, TexCLight, TexCLight, 1);
}

surface_reset_target();

enum UnknownEnum
{
    Value_0,
    Value_8 = 8
}
