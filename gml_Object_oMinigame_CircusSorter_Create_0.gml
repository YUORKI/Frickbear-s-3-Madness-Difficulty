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
    Paused = true;
}

function spawn_baby(arg0, arg1)
{
    with (instance_create_depth(72, 68 + (arg0 * 52), depth - 1, oCS_Bidybab))
    {
        if (irandom(1) == 0)
            sprite_index = sCS_Bidybab;
        else
            sprite_index = sCS_Minireena;
        
        XSpeed = arg1 * 0.25;
        YSpeed = arg0 * -0.25;
    }
}

initialize();
