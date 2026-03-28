Player = oCamera3DMaze;
Wall = oMazeWallParent;
depth = 0;
TargetX = x;
TargetY = y;
Direction = 0;
SightDistance = 512;
SightAngle = 22.5;
Path = path_add();
Frame = 0;
SoundFrame = irandom_range(0, 30);
AnimFrame = SoundFrame;
Speed = 0.5;
Grid = mp_grid_create(0, 0, 500, 500, 8, 8);
mp_grid_add_instances(Grid, Wall, 0);
Mode = "Wander";

function new_path()
{
    path_delete(Path);
    Path = path_add();
    mp_grid_path(Grid, Path, x, y, TargetX, TargetY, true);
    path_start(Path, Speed, path_action_stop, true);
    Frame = 0;
}

SelfEmitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(SelfEmitter, x, y, depth);
audio_emitter_falloff(SelfEmitter, 128, 1600, 1);
PathResetTimer = 60;
