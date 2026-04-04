var Spd = global.MicrogameSpeed;

if (!surface_exists(global.MinigameSurface))
    global.MinigameSurface = surface_create(160, 144);

surface_set_target(global.MinigameSurface);
draw_clear_alpha(c_black, 0);

if (Initialize)
{
    instance_destroy(oAA_Wall);
    instance_destroy(oAA_BB);
    
    with (instance_create_depth(0, 96, depth - 1, oAA_Wall))
    {
        Spawner = false;
        XPosition = 0;
    }
    
    instance_create_depth(4, 96, depth - 1, oAA_BB);
    DistanceTravelled = 0;
    BBSpeed = 0;
    CloudDistance = 128;
    CloudSpace = 64;
    CloudXSpace = 128;
    
    if (global.MicrogameLevel >= 1)
    {
        CloudXSpace -= 16;
        CloudSpace -= 4;
    }
    
    if (global.MicrogameLevel >= 2)
    {
        CloudXSpace -= 16;
        CloudSpace -= 4;
    }
    
    repeat (3)
        new_cloud();
    
    Started = true;
    BBSpeed = -3.5 * Spd;
    Passing = false;
    Score = 0;
    Dead = false;
    DeathFrames = 0;
    Multiplier = 1;
    BonusFrames = 0;
    Initialize = false;
}

var MinigameOpen = true;

if (room == Office)
{
    if (global.MonitorSystem != "Games" || !global.CamUp)
        MinigameOpen = false;
}

if (MinigameOpen && !Started)
    Paused = false;

draw_sprite(sAA_Background, 0, 0 - ((DistanceTravelled / 2) % 160), 0);
draw_sprite(sAA_Background, 0, 160 - ((DistanceTravelled / 2) % 160), 0);

if (mouse_check_button_pressed(mb_left) || (input_check_pressed(UnknownEnum.Value_0) && WaitFrames == 0))
{
    BBSpeed = -2.5 * Spd;
    Started = true;
    audio_play_sound(sfxBitPlace, 5, false);
}

if (Started && !Dead && !Paused)
{
    with (oAA_BB)
    {
        y += other.BBSpeed;
        
        if (other.BBSpeed < 0)
            image_index = 2;
        else
            image_index = floor(other.DistanceTravelled / 10) % 2;
        
        if (place_meeting(x, y, oAA_Wall) || y > 160 || y < 0)
        {
            audio_play_sound(sfxBitExplosion, 5, false);
            other.Dead = true;
            other.BBSpeed = -3 * Spd;
            global.MicrogameWin = false;
            end_microgame();
        }
        
        if (place_meeting(0, 0, oAA_Wall))
        {
            other.Passing = true;
        }
        else if (other.Passing)
        {
            with (other)
            {
                Passing = false;
                Score++;
                add_tokens(Multiplier);
            }
        }
    }
    
    DistanceTravelled += (1 * Spd);
    BBSpeed += (0.15 * Spd * Spd);
}
else if (Dead)
{
    BBSpeed += (0.1 * Spd * Spd);
    DeathFrames += 1;
    
    with (oAA_BB)
    {
        y += other.BBSpeed;
        image_index = 5 + (floor(other.DeathFrames / 10) % 2);
    }
    
    if (DeathFrames >= 120)
        Initialize = true;
}
else
{
    with (oAA_BB)
        image_index = 3;
}

with (oAA_Wall)
{
    x = XPosition - other.DistanceTravelled;
    
    if (x <= -32)
    {
        if (Spawner == true)
        {
            with (other)
                new_cloud();
        }
        
        instance_destroy(self);
    }
}

for (var i = 0; i < instance_number(oAA_Wall); i++)
{
    var Inst = instance_find(oAA_Wall, i);
    draw_sprite(Inst.sprite_index, Inst.image_index, Inst.x, Inst.y);
}

if (instance_exists(oAA_BB))
    draw_sprite(oAA_BB.sprite_index, oAA_BB.image_index, oAA_BB.x, oAA_BB.y);

var TexC = 3354368;
var TexCLight = 13695200;
draw_set_font(global.FontGameboy);
draw_set_halign(fa_left);
draw_text_color(2, 2, string(Score), TexC, TexC, TexC, TexC, 1);

if (BonusFrames > 0)
{
    draw_set_halign(fa_right);
    draw_text_color(158, 2, "MULTIPLIER UP!", TexC, TexC, TexC, TexC, 1);
    BonusFrames--;
}

if (Paused)
{
    draw_set_halign(fa_center);
    draw_rectangle_color(0, 64, 160, 80, TexC, TexC, TexC, TexC, false);
    draw_text_color(80, 69, "PAUSED", TexCLight, TexCLight, TexCLight, TexCLight, 1);
}

if (WaitFrames > 0)
    WaitFrames--;

surface_reset_target();
show_debug_message(Spd);

enum UnknownEnum
{
    Value_0
}
