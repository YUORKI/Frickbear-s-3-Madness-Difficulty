Timer = 0;
ShowingEndscreen = false;

if (!variable_global_exists("FredbearScoreboard"))
{
    global.FredbearScoreboard = [
    {
        Title: "HRY",
        Score: 25
    }, 
    {
        Title: "---",
        Score: 0
    }, 
    {
        Title: "YOU",
        Score: 5
    }];
}

QuitSelected = false;
Transitioning = false;
Offset = 360;
instance_destroy(oPersistentPauser);
audio_stop_all();
instance_destroy(oFredbearManager);
instance_destroy(oPersistentPauser);
application_surface_draw_enable(true);

if (global.Night == "Custom")
    Timer = 2;
else if (global.Deaths[global.Night - 1] > 1)
    Timer = 2;

audio_sound_set_track_position(sfxFredbearDeath1, Timer);
audio_play_sound(sfxFredbearDeath1, 0, false);
GuardSprites = import_sprites("SPOILERS/cutscenes/gameover.png", sFredbearGameOver_GuardKersploded);
