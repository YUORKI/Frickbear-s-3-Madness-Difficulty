SeesPlayer = collision_line(x, y, Player.x, Player.y, Wall, false, true) == -4 && ((abs(angle_difference(Direction, point_direction(x, y, Player.x, Player.y))) < SightAngle && distance_to_point(Player.x, Player.y) < SightDistance) || point_distance(x, y, Player.x, Player.y) < Player.Loudness);

if (Mode == "Wander")
{
    SightAngle = 22.5;
    Speed = 0.5;
    
    if (point_distance(x, y, TargetX, TargetY) < 16)
    {
        var Destination = instance_find(oMinigamePatrolPoint, irandom(instance_number(oMinigamePatrolPoint) - 1));
        
        while (Destination.PatrolID != PatrolID)
            Destination = instance_find(oMinigamePatrolPoint, irandom(instance_number(oMinigamePatrolPoint) - 1));
        
        TargetX = Destination.x;
        TargetY = Destination.y;
        new_path();
    }
    
    if (SeesPlayer)
    {
        Mode = "Chasing";
        audio_play_sound_on(SelfEmitter, sfxWindowScare, false, 10, 4);
    }
    
    PathResetTimer--;
    
    if (PathResetTimer <= 0)
    {
        new_path();
        PathResetTimer = 60;
    }
}

if (Mode == "Pause")
{
    Speed = 0;
    SoundFrame = 0;
    
    if (Frame > 60)
        Mode = "Wander";
    
    if (SeesPlayer)
        Mode = "Chasing";
}

if (Mode == "Chasing")
{
    Speed = 5;
    SightAngle = 45;
    
    if (Frame >= 15 && SeesPlayer)
    {
        TargetX = Player.x;
        TargetY = Player.y;
        new_path();
    }
    
    if (point_distance(x, y, TargetX, TargetY) < 16 && !SeesPlayer)
    {
        Mode = "Pause";
        Frame = 0;
    }
}

if (SoundFrame >= (30 / clamp(Speed, 0.5, 2)))
{
    audio_play_sound_on(SelfEmitter, sfxMetalFootstep, false, 10, 1, 0, random_range(0.9, 1.1));
    SoundFrame = 0;
    
    if (AnimFrame >= 60)
        AnimFrame = 0;
}

Frame += 1;
SoundFrame += 1;
AnimFrame += (1 * clamp(Speed, 0.5, 2));

if (place_meeting(x, y, Player))
{
    var NearestPoint = self;
    
    with (instance_create_depth(0, 0, 0, oTextBox))
        game_text("Endo_Death");
    
    with (oCamera3DMaze)
    {
        LockOnTarget = NearestPoint;
        LockX = NearestPoint.x;
        LockY = NearestPoint.y;
        LockZ = 96;
    }
    
    instance_create_depth(0, 0, 0, oMinigameJumpscare);
    instance_destroy(oMazeEnemy);
}

audio_emitter_position(SelfEmitter, x, y, depth);
