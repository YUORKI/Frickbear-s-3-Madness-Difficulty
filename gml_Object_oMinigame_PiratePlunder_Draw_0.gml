if (!surface_exists(global.MinigameSurface))
    global.MinigameSurface = surface_create(160, 144);

surface_set_target(global.MinigameSurface);
draw_clear_alpha(c_black, 0);
var TexC = 3354368;
var TexCLight = 13695200;

if (Initialize == true)
{
    CamYOffset = 0;
    Frame = 0;
    TentacleFrame = [0, 3.5, 1.25, 1];
    TentacleSpeed = [random_range(1, 1.2), random_range(1, 1.2), random_range(1, 1.2), random_range(1, 1.2)];
    FoxyPosition = 0;
    FoxyCoords = [0, 0];
    CurrentPosition = 0;
    Money = 0;
    TotalMoney = 0;
    PlunderTimer = 0;
    AtStop = true;
    MovementDirection = 1;
    BufferInput = 0;
    BufferTimer = 0;
    KillShake = 0;
    Dead = false;
    DeathFrames = 0;
    CurStep = 0;
    Paused = false;
    Initialize = false;
}

var MinigameOpen = true;

if (room == Office)
{
    if (global.MonitorSystem != "Games" || !global.CamUp)
        MinigameOpen = false;
}

if (!MinigameOpen)
    Paused = true;
else if (input_check_pressed(UnknownEnum.Value_0))
    Paused = !Paused;

var Move = (mouse_check_button_pressed(mb_right) - mouse_check_button_pressed(mb_left)) * !(Dead || Paused);

if (Move != 0)
{
    BufferInput = Move;
    BufferTimer = 20;
}

if ((AtStop && PlunderTimer == 0) && BufferInput != 0)
{
    CurrentPosition += BufferInput;
    MovementDirection = BufferInput;
    BufferInput = 0;
    BufferTimer = 0;
}

if (BufferTimer > 0)
{
    BufferTimer--;
    
    if (BufferTimer == 0)
        BufferInput = 0;
}

draw_sprite(sPiP_Background, floor(Frame / 15), 0, CamYOffset);
var EyeOrigin = [108, 69];

repeat (2)
{
    var EyeAngle = point_direction(EyeOrigin[0], EyeOrigin[1], FoxyCoords[0], FoxyCoords[1]);
    draw_circle_color(round(EyeOrigin[0] + lengthdir_x(8, EyeAngle)), round(EyeOrigin[1] + lengthdir_y(8, EyeAngle)) + CamYOffset, 1, TexCLight, TexCLight, false);
    EyeOrigin = [129, 76];
}

for (var t = 0; t < 4; t++)
{
    var TentacleSprite = abs(4 - floor(TentacleFrame[t])) + (t * 5);
    draw_sprite(sPiP_Tentacles, TentacleSprite, 0, CamYOffset + 32);
    
    if (!(Dead || Paused))
        TentacleFrame[t] += TentacleSpeed[t] / 60;
    
    if (TentacleFrame[t] >= 8)
    {
        TentacleFrame[t] = 0;
        TentacleSpeed[t] = random_range(1.25, 2);
    }
}

CurrentPosition = clamp(CurrentPosition, 0, 4);
var TargetPosition = 0;

switch (CurrentPosition)
{
    case 0:
        TargetPosition = 0;
        break;
    
    case 1:
        TargetPosition = 48;
        break;
    
    case 2:
        TargetPosition = 112;
        break;
    
    case 3:
        TargetPosition = 160;
        break;
    
    case 4:
        TargetPosition = 192;
        break;
}

if (((floor(TentacleFrame[0]) == 4 && abs(FoxyPosition - 48) < 12) || (floor(TentacleFrame[1]) == 4 && abs(FoxyPosition - 112) < 12) || (floor(TentacleFrame[2]) == 4 && abs(FoxyPosition - 160) < 12) || (floor(TentacleFrame[3]) == 4 && abs(FoxyPosition - 192) < 12)) && !Dead)
{
    Dead = true;
    DeathFrames = 120;
    KillShake = 2;
    audio_play_sound(sfxBitFail, 5, false);
}

var PlunderLength = 20;
var SlowdownMult = 1.6;
AtStop = abs(FoxyPosition - TargetPosition) < 0.5;
var Movement = (50 * sign(TargetPosition - FoxyPosition)) / ((Money * SlowdownMult) + 10);

if (abs(FoxyPosition - TargetPosition) < Movement)
    FoxyPosition = TargetPosition;
else if (!(Dead || Paused))
    FoxyPosition += Movement;

if (FoxyPosition <= 112)
    FoxyCoords = [24, 24 + FoxyPosition];
else
    FoxyCoords = [(FoxyPosition - 112) + 24, 136 + ((1 - (112 / FoxyPosition)) * 64)];

if (CurrentPosition == 0 && AtStop)
{
    if (Money > 0)
    {
        Money--;
        TotalMoney++;
        global.TokensPerMinigame[UnknownEnum.Value_5]++;
        
        if (Money == 0)
        {
            add_tokens(1);
            
            if (TotalMoney >= 80)
                get_trophy(UnknownEnum.Value_6);
        }
        else
        {
            add_tokens_silently(1);
            audio_play_sound(sfxTally, 5, false);
        }
        
        if (TotalMoney > global.HiScores[UnknownEnum.Value_5])
            global.HiScores[UnknownEnum.Value_5] = TotalMoney;
        
        if (TotalMoney > global.HiScoresOverall[UnknownEnum.Value_5])
            global.HiScoresOverall[UnknownEnum.Value_5] = TotalMoney;
    }
}

if (CurrentPosition == 4 && AtStop && mouse_check_button(mb_right) && PlunderTimer == 0 && !Dead)
{
    Money++;
    PlunderTimer = PlunderLength;
    audio_play_sound(sfxBitPlace, 5, false);
}

var FoxySprite = 0;

if (!AtStop)
{
    FoxySprite = floor(FoxyPosition / 8) % 2;
    
    if (CurStep != FoxySprite)
    {
        if (CurStep == 0)
            audio_play_sound(sfxBitCrunch, 5, false);
        
        CurStep = FoxySprite;
    }
}

if (FoxyPosition > 0 && FoxyPosition < 112)
    FoxySprite += 2;

if (PlunderTimer > 0)
    FoxySprite = 4 + (floor(PlunderTimer / (PlunderLength / 2)) % 2);

if (Dead)
    FoxySprite = 6;

draw_sprite_ext(sPiP_Foxy, FoxySprite, FoxyCoords[0] + round(KillShake), FoxyCoords[1] + CamYOffset, MovementDirection, 1, 0, c_white, 1);
draw_set_halign(fa_left);
draw_set_font(global.FontGameboy);
draw_text_color(2, 167 + CamYOffset, "G:" + string(Money), TexC, TexC, TexC, TexC, 1);
draw_set_halign(fa_right);
draw_text_color(158, 2 + CamYOffset, "T: " + string(TotalMoney), TexC, TexC, TexC, TexC, 1);

if (Paused)
{
    draw_set_halign(fa_center);
    draw_rectangle_color(0, 64, 160, 80, TexC, TexC, TexC, TexC, false);
    draw_text_color(80, 69, "PAUSED", TexCLight, TexCLight, TexCLight, TexCLight, 1);
}
else
{
    Frame++;
    PlunderTimer = max(PlunderTimer - 1, 0);
    
    if ((Frame % 2) == 1)
        KillShake *= -0.95;
    
    if (FoxyPosition <= 32)
        CamYOffset += ((0 - CamYOffset) / 5);
    else
        CamYOffset += ((-32 - CamYOffset) / 5);
}

DeathFrames = max(DeathFrames - 1, 0);

if (Dead && DeathFrames == 0)
    Initialize = true;

surface_reset_target();

enum UnknownEnum
{
    Value_0,
    Value_5 = 5,
    Value_6
}
