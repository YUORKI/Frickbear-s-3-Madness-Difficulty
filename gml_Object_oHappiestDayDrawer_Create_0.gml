audio_stop_all();
DarkGBColor = make_color_rgb(0, 47, 51);
LightGBColor = make_color_rgb(224, 248, 208);
Level = 1;
LockZone = undefined;

function save_level(arg0)
{
    return room_restart();
    var LevelSave = array_create(0);
    var ObjData = 0;
    
    with (oHappiestDayObject)
    {
        if (!variable_instance_exists(self, "MovementDirection"))
        {
            MovementDirection = 0;
            MovementRange = 0;
            BaseTimer = 0;
        }
        
        ObjData = 
        {
            _ObjID: object_get_name(object_index),
            _x: OriginalX,
            _y: OriginalY,
            _depth: depth,
            _xscale: image_xscale,
            _yscale: image_yscale,
            _MovementDirection: MovementDirection,
            _MovementRange: MovementRange,
            _Timer: BaseTimer
        };
        array_push(LevelSave, ObjData);
    }
    
    var _string = json_stringify(LevelSave);
    var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
    buffer_write(_buffer, buffer_string, _string);
    buffer_save(_buffer, "leveldata" + string(arg0) + ".txt");
    buffer_delete(_buffer);
}

function load_level(arg0)
{
    instance_destroy(oHappiestDayObject, false);
    var FileName = "leveldata" + string(arg0) + ".txt";
    
    if (file_exists(FileName))
    {
        var _buffer = buffer_load(FileName);
        var _string = buffer_read(_buffer, buffer_string);
        buffer_delete(_buffer);
        var LoadData = json_parse(_string);
        
        while (array_length(LoadData) > 0)
        {
            var Obj = array_pop(LoadData);
            
            with (instance_create_depth(Obj._x, Obj._y, Obj._depth, asset_get_index(Obj._ObjID)))
            {
                image_xscale = Obj._xscale;
                image_yscale = Obj._yscale;
                image_angle = Obj._angle;
                MovementDirection = Obj._MovementDirection;
                MovementRange = Obj._MovementRange;
                BaseTimer = Obj._Timer;
                Variables = Obj._Variables;
            }
        }
        
        show_debug_message("GAME LOADED! " + _string);
    }
    
    x = oHD_Guard.x;
    y = oHD_Guard.y;
    global.SavedBossTime = oCamera.BossTimer;
}

Screen = "EmilySoft";
Timer = 0;
TextStorage = ["There once lived a boy.", "This boy was very sad. He was a crybaby who had no friends.", "'WAHHH! I'm a crybaby who has no friends!', cried the boy.", "'If only someone would show up to my birthday party...'", "'Oh, who am I kidding? It's just gonna be me and those dumb robots again!'", "It would seem there was no defying his fate...the party would be a disaster.", "Though maybe, with those four masks and a bit of elbow grease...", "...Maybe we have one last chance to make things right.", "Don't screw it up."];
EndLevelDialogue[0] = ["It's that crybaby's birthday today, huh?", "Man, with how big my family is, I go to enough crowded parties already!", "...But I guess a party with no one at all would be a whole lot worse...", "Alright, alright...I guess someone's gotta man up and show him everything ain't so bad."];
EndLevelDialogue[1] = ["A party? Oh, HIS party. Well, I can't imagine it'll be much.", "...Ooh, but maybe, if I go there and work some of my magic, the people'll come POURING in!", "Pump the tunes, shoot some hoops...I'll make it a REAL party! He'll love it!", "And hey, maybe I can sneak a look at his dad's robots without him telling me off... Let's do it!"];
EndLevelDialogue[2] = ["Oh, that party's today? Sure, I'll go, but...", "Shouldn't you get his brother? I hear he had a big apology to make to him.", "Thing is, he's worried he'd just show up and ruin the whole thing. His roughhousing did go pretty far...", "But hey, I'm sure you'll find him! I'll see you at the party, yeah?"];
EndLevelDialogue[3] = ["You found the other three? Good...I knew I was right to put my faith in you.", "Well, I suppose there's only one thing left to do now. Do you have the others ready?", "It's time to make it up to him."];
EndLevelDialogue[4] = ["You shouldn't be able to see this."];
TextNum = 0;
TextType = 0;
FadeVal = 0;
Pal = [13695200, 7389320, 5662772, 3354368];

function col(arg0)
{
    return Pal[clamp(arg0 + round(FadeVal), 0, 3)];
}

global.MinigameSurface = -1;
CurrentGameSong = sfxNOTHING;
CurrentOfficeSong = sfxNOTHING;
MusicVolumeDefault = 0.3;
MusicVolume = MusicVolumeDefault;
InGame = false;
GuardSprites = import_sprites("minigame.png", sHD_Guard, 4, 8, 8);
LoopTrackA = undefined;
LoopTrackB = undefined;

function change_music(arg0, arg1)
{
    if (arg0 == CurrentGameSong && arg1 == CurrentOfficeSong)
        exit;
    
    audio_stop_sound(CurrentGameSong);
    audio_stop_sound(CurrentOfficeSong);
    LoopTrackA = play_music(arg0);
    LoopTrackB = play_music(arg1);
    audio_sound_gain(arg0, InGame * MusicVolume, 0);
    audio_sound_gain(arg1, !InGame * MusicVolume, 0);
    CurrentGameSong = arg0;
    CurrentOfficeSong = arg1;
}

change_music(sfxNOTHING, sfxAmbience);
Frame = 0;
PeacefulMode = false;
