Initialize = true;
TilesCleared = 0;
BoardWidth = 10;
BoardHeight = 8;
TileSize = 16;
Mines = 10;

if (object_index == oMinigame_GoldenFazsweep)
{
    BoardWidth = 20;
    BoardHeight = 16;
    TileSize = 8;
    Mines = 60;
}

BoardSize = BoardWidth * BoardHeight;
global.MinigameSurface = -1;

function get_tile_type(arg0, arg1)
{
    if (arg0 < 0 || arg0 > (BoardWidth - 1) || arg1 < 0 || arg1 > (BoardHeight - 1))
        return -1;
    else
        return TileGrid[(arg1 * BoardWidth) + arg0];
}

function clear_surrounding_tiles(arg0, arg1)
{
    if (arg0 < 0 || arg0 > (BoardWidth - 1) || arg1 < 0 || arg1 > (BoardHeight - 1))
        return -1;
    
    TileCovers[(arg1 * BoardWidth) + arg0] = 0;
    
    if (TileGrid[(arg1 * BoardWidth) + arg0] == 0)
    {
        for (var dir = 0; dir < 360; dir += 45)
        {
            var ad_x = arg0 + round(lengthdir_x(1, dir));
            var ad_y = arg1 + round(lengthdir_y(1, dir));
            
            if (ad_x < 0 || ad_x > (BoardWidth - 1) || ad_y < 0 || ad_y > (BoardHeight - 1))
                continue;
            
            if (TileGrid[(ad_y * BoardWidth) + ad_x] == 0 && TileCovers[(ad_y * BoardWidth) + ad_x] == 1)
                clear_surrounding_tiles(ad_x, ad_y);
            
            TileCovers[(ad_y * BoardWidth) + ad_x] = 0;
        }
    }
}

function initialize_board(arg0, arg1)
{
    repeat (Mines)
    {
        var TargetTile = irandom_range(0, BoardSize - 1);
        var _x = TargetTile % BoardWidth;
        var _y = floor(TargetTile / BoardWidth);
        
        while (TileGrid[TargetTile] != 0 || point_distance(_x, _y, arg0, arg1) < 2)
        {
            TargetTile = irandom_range(0, BoardSize - 1);
            _x = TargetTile % BoardWidth;
            _y = floor(TargetTile / BoardWidth);
        }
        
        TileGrid[TargetTile] = 9;
    }
    
    for (var Tile = 0; Tile < BoardSize; Tile++)
    {
        var _x = Tile % BoardWidth;
        var _y = floor(Tile / BoardWidth);
        
        if (TileGrid[Tile] != 9)
        {
            for (var dir = 0; dir < 360; dir += 45)
            {
                if (get_tile_type(_x + round(lengthdir_x(1, dir)), _y + round(lengthdir_y(1, dir))) == 9)
                    TileGrid[Tile]++;
            }
        }
    }
}

TileGrid = array_create(BoardSize, 0);
TileCovers = array_create(BoardSize, 3);
WaitForClick = false;
Timer = 0;
Dead = false;
DeathFrames = 0;
Patterns[0][0] = 
{
    Grid: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    Covers: [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
};
Patterns[0][1] = 
{
    Grid: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    Covers: [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 1, 0, 0, 3, 3, 3, 3, 0, 0, 0, 1, 0, 0, 3, 3, 3, 3, 0, 0, 0, 1, 0, 0, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
};
Patterns[0][2] = 
{
    Grid: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    Covers: [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 2, 0, 0, 3, 3, 3, 3, 3, 3, 3, 1, 1, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
};
Patterns[1][0] = 
{
    Grid: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    Covers: [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 0, 0, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 1, 1, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
};
Patterns[1][1] = 
{
    Grid: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    Covers: [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 1, 1, 3, 3, 3, 3, 3, 3, 3, 2, 0, 0, 3, 3, 3, 3, 3, 3, 3, 0, 1, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
};
Patterns[1][2] = 
{
    Grid: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    Covers: [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 1, 3, 3, 3, 3, 3, 3, 3, 0, 0, 1, 3, 3, 3, 3, 3, 3, 3, 0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 0, 2, 0, 0, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
};
Patterns[2][0] = 
{
    Grid: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 9, 0, 0, 0, 0, 0, 0, 0, 9, 0, 9, 0, 9, 0, 0, 0, 0, 0, 0, 0, 9, 0, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    Covers: [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 0, 2, 0, 0, 0, 3, 3, 3, 3, 2, 0, 2, 0, 2, 0, 3, 3, 3, 3, 1, 1, 1, 0, 1, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
};
Patterns[2][1] = 
{
    Grid: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 9, 9, 9, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    Covers: [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 2, 3, 3, 3, 3, 3, 3, 2, 1, 2, 0, 3, 3, 3, 3, 3, 3, 2, 0, 0, 0, 3, 3, 3, 3, 3, 3, 1, 0, 1, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
};
Patterns[2][2] = 
{
    Grid: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 9, 0, 0, 0, 9, 0, 0, 0, 0, 0, 9, 0, 9, 0, 0, 0, 0, 0, 0, 0, 9, 0, 9, 9, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    Covers: [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 0, 0, 0, 1, 3, 3, 3, 3, 0, 2, 1, 1, 0, 0, 3, 3, 3, 3, 0, 2, 0, 2, 2, 0, 3, 3, 3, 3, 0, 2, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
};
var ChosenPuzzle = irandom(array_length(Patterns[global.MicrogameLevel]) - 1);
TileGrid = Patterns[global.MicrogameLevel][ChosenPuzzle].Grid;
TileCovers = Patterns[global.MicrogameLevel][ChosenPuzzle].Covers;
Mines = 0;

for (var Tile = 0; Tile < BoardSize; Tile++)
{
    var _x = Tile % BoardWidth;
    var _y = floor(Tile / BoardWidth);
    
    if (TileGrid[Tile] != 9)
    {
        for (var dir = 0; dir < 360; dir += 45)
        {
            if (get_tile_type(_x + round(lengthdir_x(1, dir)), _y + round(lengthdir_y(1, dir))) == 9)
                TileGrid[Tile]++;
        }
    }
    else
    {
        Mines++;
    }
}

global.MicrogameWin = false;
