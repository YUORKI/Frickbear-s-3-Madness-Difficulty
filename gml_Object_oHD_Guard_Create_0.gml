event_inherited();
XVelocity = 0;
YVelocity = 0;
XMove = 0;
SpringJump = false;
RespawnX = x;
RespawnY = y;
WalkTimer = 0;
LockFrames = 0;

function die()
{
    LockFrames = 30;
    XVelocity = 0;
    YVelocity = 0;
    x = RespawnX;
    y = RespawnY;
    
    with (oHD_FallingPlatform)
    {
        if (Falling == true)
            instance_destroy();
    }
    
    instance_destroy(oHD_Respawner);
    audio_play_sound(sfxBitPunish, 5, false);
    
    with (oNightmare)
        global.Temperature += DeathPenalty;
}

LockZone = undefined;
