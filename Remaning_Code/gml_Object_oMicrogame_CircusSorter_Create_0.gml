Initialize = true;

function initialize()
{
    Score = 0;
    Frame = 0;
    BabiesMade = 0;
    MaxDifficulty = 0;
    GrabbedBaby = -4;
    GrabX = 0;
    GrabY = 0;
    SpawnTimer = 0;
    BabyHeight = 0;
    BabySpeed = 0;
    BabyHappy = false;
    BalloraHeight = 0;
    BalloraSpeed = 0;
    BalloraHappy = false;
    Dead = false;
    DeathFrames = 0;
    JumpscareType = false;
    Initialize = false;
    JumpscareOffset = 144;
    Paused = false;
    
    repeat (global.MicrogameLevel + 2)
        spawn_baby();
}

function spawn_baby()
{
    var SpawnX = irandom_range(-32, 32);
    var SpawnY = irandom_range(-52, 52);
    
    with (instance_create_depth(72 + SpawnX, 68 + SpawnY, depth - 1, oCS_Bidybab))
    {
        if (irandom(1) == 0)
            sprite_index = sCS_Bidybab;
        else
            sprite_index = sCS_Minireena;
        
        XSpeed = random_sign() * 0.25 * global.MicrogameSpeed;
        YSpeed = random_sign() * 0.25 * global.MicrogameSpeed;
        TickdownSpeed = global.MicrogameSpeed;
    }
}

global.MicrogameWin = false;
