Paused = 0;

if (TileSize == 16)
    sprite_index = sFFS_Tiles;
else
    sprite_index = sFFS_TilesSmall;

if (room == Office)
{
    if (!global.CamUp || global.MonitorSystem != "Games")
        Paused = true;
}
else
{
    Paused = false;
}

MouseX = (device_mouse_x_to_gui(0) - global.MinigameWindowX) / global.MinigameWindowScale;
MouseY = (device_mouse_y_to_gui(0) - global.MinigameWindowY) / global.MinigameWindowScale;

if (!surface_exists(global.MinigameSurface))
    global.MinigameSurface = surface_create(160, 144);

surface_set_target(global.MinigameSurface);
draw_clear_alpha(c_black, 0);

if (Initialize)
{
    TileGrid = array_create(BoardSize, 0);
    TileCovers = array_create(BoardSize, 1);
    WaitForClick = true;
    Timer = 0;
    Dead = false;
    DeathFrames = 0;
    Initialize = false;
}

var TexC = 3354368;
var TexCLight = 13695200;

if (!Dead)
{
    TilesCleared = 0;
    
    for (var Tile = 0; Tile < array_length(TileGrid); Tile++)
    {
        if (TileCovers[Tile] == 0 && TileGrid[Tile] != 9 && !Dead)
            TilesCleared++;
    }
}

if (input_check_pressed(UnknownEnum.Value_0))
    Paused = !Paused;

if (room == Office)
{
    if (global.MonitorSystem != "Games" || !global.CamUp)
        Paused = true;
}

for (var Tile = 0; Tile < array_length(TileGrid); Tile++)
{
    var _x = Tile % BoardWidth;
    var _y = floor(Tile / BoardWidth);
    var XPosition = _x * TileSize;
    var YPosition = (_y * TileSize) + 16;
    var CurrentTile = TileGrid[Tile];
    var TileColor = (_x + _y) % 2;
    
    if (CurrentTile == 9)
        draw_sprite(sprite_index, CurrentTile + (floor(DeathFrames * 8) % 2), XPosition, YPosition);
    else
        draw_sprite(sprite_index, CurrentTile, XPosition, YPosition);
    
    if (MouseX >= XPosition && (XPosition + TileSize) > MouseX && MouseY >= YPosition && (YPosition + TileSize) > MouseY && !Dead && !Paused)
    {
        if (mouse_check_button_pressed(mb_left) && TileCovers[Tile] == 1)
        {
            TileCovers[Tile] = 0;
            audio_play_sound(sfxBitCrunch, 9, false);
            
            if (WaitForClick == true)
            {
                initialize_board(_x, _y);
                WaitForClick = false;
            }
            
            if (TileGrid[Tile] == 0)
                clear_surrounding_tiles(_x, _y);
            
            if (TileGrid[Tile] == 9)
            {
                audio_play_sound(sfxBitExplosion, 99, false);
                Dead = true;
            }
        }
        
        if (mouse_check_button_pressed(mb_right))
        {
            if (TileCovers[Tile] == 1)
            {
                TileCovers[Tile] = 2;
                audio_play_sound(sfxBitPlace, 9, false);
            }
            else if (TileCovers[Tile] == 2)
            {
                TileCovers[Tile] = 1;
                audio_play_sound(sfxBitPlace, 9, false);
            }
        }
    }
    
    if (TileCovers[Tile] != 0)
        draw_sprite(sprite_index, TileColor + 9 + (TileCovers[Tile] * 2), XPosition, YPosition);
}

var TilesLeft = BoardSize - (Mines + TilesCleared);

if (TilesLeft == 0 && !Dead)
{
    Dead = true;
    add_tokens(200);
    global.TokensPerMinigame[UnknownEnum.Value_7] += 200;
    
    if (global.HiScores[UnknownEnum.Value_7] > Timer)
        global.HiScores[UnknownEnum.Value_7] = Timer;
    
    if (global.HiScoresOverall[UnknownEnum.Value_7] > Timer)
        global.HiScoresOverall[UnknownEnum.Value_7] = Timer;
    
    get_trophy(UnknownEnum.Value_11);
}

draw_rectangle_color(0, 0, 160, 16, TexC, TexC, TexC, TexC, false);
draw_set_font(global.FontGameboy);
draw_text_color(2, 4, "Tiles: " + string(TilesLeft), TexCLight, TexCLight, TexCLight, TexCLight, 1);
draw_set_halign(fa_right);
draw_text_color(158, 4, format_as_timer(Timer), TexCLight, TexCLight, TexCLight, TexCLight, 1);
draw_set_halign(fa_left);
draw_set_font(global.FontW97Black);
surface_reset_target();

if (Dead)
    DeathFrames += 0.016666666666666666;

if (DeathFrames > 1 && TilesLeft > 0)
    TileCovers = array_create(BoardSize, 0);

if (DeathFrames > 3)
    Initialize = true;

if (!(Paused || WaitForClick || Dead))
    Timer += 0.016666666666666666;

enum UnknownEnum
{
    Value_0,
    Value_7 = 7,
    Value_11 = 11
}
