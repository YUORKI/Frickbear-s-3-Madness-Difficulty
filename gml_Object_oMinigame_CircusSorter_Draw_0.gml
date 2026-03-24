if (input_check_pressed(UnknownEnum.Value_0) || (Paused && mouse_in_minigame_window() && mouse_check_button_pressed(mb_left)))
    Paused = !Paused;

var TexC = 3354368;
var TexCLight = 13695200;
draw_set_font(global.FontGameboy);

if (room == Office)
{
    if (global.MonitorSystem != "Games" || !global.CamUp)
        Paused = true;
}

if (Initialize)
    initialize();

if (!surface_exists(global.MinigameSurface))
    global.MinigameSurface = surface_create(160, 144);

surface_set_target(global.MinigameSurface);
draw_clear_alpha(c_black, 0);
draw_sprite_ext(sCS_Barrier, 0, 32, 8 + (floor(Frame / 10) % 8), 1, 16, 0, c_white, 1);
draw_sprite_ext(sCS_Barrier, 0, 120, 16 - (floor(Frame / 10) % 8), 1, 16, 0, c_white, 1);
draw_sprite(sCS_Belts, floor(Frame / 10) % 3, 72, 8);
draw_sprite(sCS_Belts, 3 + (floor(Frame / 10) % 3), 72, 128);
draw_sprite(sCS_Background, 0, 0, 0);

with (oCS_Bidybab)
{
    draw_sprite(sprite_index, image_index, x, y);
    var SecondsLeft = ceil(Timer / 60);
    
    if (Timer < 360 && (floor((Timer * 3) / SecondsLeft / 30) % 2) == 0)
    {
        shader_set(shFlash);
        draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, TexCLight, 1);
        shader_reset();
    }
}

var BabyFrame = floor(Frame / 30) % 2;
var BalloraFrame = BabyFrame;

if (BabyHappy)
    BabyFrame = 2;

if (BalloraHappy)
    BalloraFrame = 2;

draw_sprite(sCS_BabyBallora, BabyFrame, 20, 80 + BabyHeight);
draw_sprite(sCS_BabyBallora, BalloraFrame + 3, 140, 80 + BalloraHeight);
draw_text_color(4, 4, Score, TexCLight, TexCLight, TexCLight, TexCLight, 1);

if (Score > global.HiScores[UnknownEnum.Value_6])
    global.HiScores[UnknownEnum.Value_6] = Score;

if (Score > global.HiScoresOverall[UnknownEnum.Value_6])
    global.HiScoresOverall[UnknownEnum.Value_6] = Score;

if (Score == 128)
    get_trophy(UnknownEnum.Value_7);

if ((BabyHeight + BabySpeed) >= 0)
{
    BabyHeight = 0;
    BabySpeed = -1 * floor(BabySpeed * 0.75);
    
    if (BabySpeed == 0)
        BabyHappy = false;
}

BabyHeight += BabySpeed;
BabySpeed += 0.25;

if ((BalloraHeight + BalloraSpeed) >= 0)
{
    BalloraHeight = 0;
    BalloraSpeed = -1 * floor(BalloraSpeed * 0.75);
    
    if (BalloraSpeed == 0)
        BalloraHappy = false;
}

BalloraHeight += BalloraSpeed;
BalloraSpeed += 0.25;

if (Dead)
{
    instance_destroy(oCS_Bidybab);
    
    if (DeathFrames == 0)
        audio_play_sound(sfxBitExplosion, 10, false);
    
    DeathFrames++;
    
    if (DeathFrames > 180)
        initialize();
    
    JumpscareOffset -= (JumpscareOffset / 5);
    var JumpXOffset = dsin(DeathFrames * 90) * (2 - floor(DeathFrames / 60));
    draw_sprite(sCS_Jumpscare, JumpscareType, JumpXOffset, JumpscareOffset);
    surface_reset_target();
    exit;
}

if (Paused)
{
    draw_set_halign(fa_center);
    draw_rectangle_color(0, 64, 160, 80, TexC, TexC, TexC, TexC, false);
    draw_text_color(80, 69, "PAUSED", TexCLight, TexCLight, TexCLight, TexCLight, 1);
    draw_set_halign(fa_left);
    draw_set_font(global.FontW97Black);
    surface_reset_target();
    exit;
}

var VerticalSide = ((BabiesMade % 2) * 2) - 1;
var HorizontalSide = irandom_range(-1, 1);

switch (floor(BabiesMade / 8))
{
    case 0:
        if ((SpawnTimer % 100) == 0)
        {
            spawn_baby(VerticalSide, HorizontalSide);
            BabiesMade++;
            SpawnTimer = 0;
        }
        
        break;
    
    case 1:
        if ((SpawnTimer % 100) == 0)
        {
            HorizontalSide = random_sign();
            spawn_baby(VerticalSide, HorizontalSide);
            
            if (VerticalSide == -1)
                spawn_baby(VerticalSide, -1 * HorizontalSide);
            
            BabiesMade++;
            SpawnTimer = 0;
        }
        
        break;
    
    case 2:
        if ((SpawnTimer % 100) == 0)
        {
            HorizontalSide = random_sign();
            spawn_baby(VerticalSide, HorizontalSide);
            spawn_baby(VerticalSide, -1 * HorizontalSide);
            BabiesMade++;
            SpawnTimer = 0;
        }
        
        break;
    
    case 3:
        if ((SpawnTimer % 60) == 0)
        {
            VerticalSide = (((BabiesMade * 2) % 2) * 2) - 1;
            spawn_baby(VerticalSide, HorizontalSide);
            BabiesMade += 0.5;
            SpawnTimer = 0;
        }
        
        break;
    
    case 4:
        BabiesMade = floor(BabiesMade);
        
        if ((SpawnTimer % 100) == 0)
        {
            spawn_baby(VerticalSide, HorizontalSide);
            HorizontalSide = irandom_range(-1, 1);
            spawn_baby(VerticalSide * -1, HorizontalSide);
            BabiesMade += 1;
            SpawnTimer = 0;
        }
        
        break;
    
    case 5:
        if ((SpawnTimer % 90) == 0)
        {
            HorizontalSide = random_sign();
            spawn_baby(VerticalSide, HorizontalSide);
            spawn_baby(VerticalSide, -1 * HorizontalSide);
            BabiesMade++;
            SpawnTimer = 0;
        }
        
        break;
    
    case 6:
        if ((SpawnTimer % 100) == 0)
        {
            HorizontalSide = random_sign();
            
            if (VerticalSide == -1)
            {
                spawn_baby(VerticalSide, -1);
                spawn_baby(VerticalSide, 0);
                spawn_baby(VerticalSide, 1);
            }
            else
            {
                spawn_baby(VerticalSide, HorizontalSide);
                spawn_baby(VerticalSide, -1 * HorizontalSide);
            }
            
            BabiesMade++;
            SpawnTimer = 0;
        }
        
        break;
    
    case 7:
    default:
        if ((SpawnTimer % (100 - MaxDifficulty)) == 0)
        {
            spawn_baby(VerticalSide, -1);
            spawn_baby(VerticalSide, 0);
            spawn_baby(VerticalSide, 1);
            BabiesMade++;
            SpawnTimer = MaxDifficulty;
            MaxDifficulty = min(MaxDifficulty + 1, 40);
        }
        
        break;
}

var MouseX = (device_mouse_x_to_gui(0) - global.MinigameWindowX) / global.MinigameWindowScale;
var MouseY = (device_mouse_y_to_gui(0) - global.MinigameWindowY) / global.MinigameWindowScale;

if (mouse_check_button_pressed(mb_left) && instance_place(MouseX, MouseY, oCS_Bidybab) != -4)
{
    audio_play_sound(sfxBitPlace, 10, false);
    GrabbedBaby = instance_nearest(MouseX - 8, MouseY - 8, oCS_Bidybab);
    GrabX = MouseX - GrabbedBaby.x;
    GrabY = MouseY - GrabbedBaby.y;
}

if (!mouse_check_button(mb_left))
{
    GrabbedBaby = -4;
    
    with (oCS_Bidybab)
        Grabbed = false;
}

if (GrabbedBaby != -4)
{
    with (GrabbedBaby)
    {
        Grabbed = true;
        x = MouseX - other.GrabX;
        y = clamp(MouseY - other.GrabY, 16, 119);
    }
}

Frame++;
SpawnTimer++;
surface_reset_target();

enum UnknownEnum
{
    Value_0,
    Value_6 = 6,
    Value_7
}
