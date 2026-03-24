if (!surface_exists(global.MinigameSurface))
    global.MinigameSurface = surface_create(160, 144);

surface_set_target(global.MinigameSurface);
draw_clear_alpha(c_black, 0);

if (Initialize)
{
    Frame = 0;
    SpawnTimer = 0;
    ProjectileArray = [];
    Speed = 1;
    Score = 0;
    Combo = 0;
    Dead = false;
    ProjNum = 0;
    EatAnim = 0;
    KillShake = 0;
    BombOrd = [0, 0, 0, 0, 1];
    DeathFrames = 0;
    BotClick = false;
    Initialize = false;
}

var TexC = 3354368;
var TexCLight = 13695200;

if (room == Office)
{
    if (global.MonitorSystem != "Games" || !global.CamUp)
        Paused = true;
}

var MouthOpen = (mouse_check_button(mb_left) || BotClick) && !Paused;
var ChicaSprite = floor(Frame * 2) % 2;

if (MouthOpen)
    ChicaSprite = 2 + ceil(EatAnim);

if (Dead)
    ChicaSprite = 4;

if (Paused && (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) && mouse_in_minigame_window())
    Paused = false;

if (input_check_pressed(UnknownEnum.Value_0))
    Paused = !Paused;

draw_sprite(sCFF_Background, 0, 0, 0);

for (var i = 0; i < array_length(ProjectileArray); i++)
{
    var CurrProj = ProjectileArray[i];
    draw_sprite(sCFF_Projectiles, CurrProj.IsBomb + 2, CurrProj.XPosition + 4, arc_y(CurrProj.XPosition, CurrProj.ArcHeight) + 4);
}

draw_sprite(sCFF_Chica, ChicaSprite, 96 + KillShake, 48);

if (((Frame * 60) % 2) == 1)
    KillShake *= -0.95;

var cur_x = 0;

while (cur_x < 160)
    cur_x += 8;

for (var i = 0; i < array_length(ProjectileArray); i++)
{
    var CurrProj = ProjectileArray[i];
    draw_sprite(sCFF_Projectiles, CurrProj.IsBomb, CurrProj.XPosition, arc_y(CurrProj.XPosition, CurrProj.ArcHeight));
}

draw_set_font(global.FontGameboy);
draw_set_halign(fa_left);
draw_text_color(2, 2, "Score:" + string(Score), TexC, TexC, TexC, TexC, 1);
draw_set_halign(fa_right);
draw_text_color(158, 2, "Combo:" + string(Combo), TexC, TexC, TexC, TexC, 1);

if (Score > global.HiScores[UnknownEnum.Value_2])
    global.HiScores[UnknownEnum.Value_2] = Score;

if (Score > global.HiScoresOverall[UnknownEnum.Value_2])
    global.HiScoresOverall[UnknownEnum.Value_2] = Score;

if (Dead)
    DeathFrames += 0.016666666666666666;

if (DeathFrames > 3)
    Initialize = true;

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

if (ActivateBot)
{
    BotClick = true;
    MouthOpen = true;
}

for (var i = 0; i < array_length(ProjectileArray); i++)
{
    var CurrProj = ProjectileArray[i];
    
    if (arc_y(CurrProj.XPosition, CurrProj.ArcHeight) >= 128)
    {
        if (!CurrProj.IsBomb)
            Combo = 0;
        
        array_delete(ProjectileArray, i, 1);
    }
    
    if (abs(CurrProj.XPosition - 112) < 4 && CurrProj.IsBomb && ActivateBot)
    {
        BotClick = false;
        MouthOpen = false;
    }
    
    if (abs(CurrProj.XPosition - 112) < 4 && MouthOpen)
    {
        if (CurrProj.IsBomb)
        {
            Dead = true;
            array_delete(ProjectileArray, 0, array_length(ProjectileArray));
            KillShake = 4;
            audio_play_sound(sfxBitExplosion, 99, false);
            break;
        }
        
        array_delete(ProjectileArray, i, 1);
        Score++;
        Combo++;
        EatAnim = 1;
        audio_play_sound(sfxBitCrunch, 9, false);
        
        if ((Combo % 5) == 0)
        {
            var TokensEarned = min(ceil(Combo / 50), 10);
            add_tokens(TokensEarned);
            global.TokensPerMinigame[UnknownEnum.Value_2] += TokensEarned;
        }
        
        if ((Score % 50) == 0 && array_length(BombOrd) > 2)
        {
            if (BombOrd[0] == 1)
                array_delete(BombOrd, 1, 1);
            else
                array_delete(BombOrd, 0, 1);
        }
        
        if (Combo == 150)
            get_trophy(UnknownEnum.Value_3);
    }
    
    ProjectileArray[i].XPosition += CurrProj.Speed;
}

if (SpawnTimer >= (30 / Speed) && !Dead)
{
    if ((ProjNum % array_length(BombOrd)) == 0)
        BombOrd = array_shuffle(BombOrd);
    
    var IsBomb = BombOrd[ProjNum % array_length(BombOrd)];
    ProjectileArray[array_length(ProjectileArray)] = new projectile(IsBomb, irandom_range(40, 100), Speed);
    ProjNum++;
    SpawnTimer = irandom_range(0, round(10 / Speed));
}

Frame += 0.016666666666666666;
SpawnTimer++;
EatAnim = max(EatAnim - 0.2, 0) * MouthOpen;
Speed = 1 + (Score / 100);
PowerDrained += 0.005555555555555556;
draw_set_halign(fa_left);
draw_set_font(global.FontW97Black);
surface_reset_target();

enum UnknownEnum
{
    Value_0,
    Value_2 = 2,
    Value_3
}
