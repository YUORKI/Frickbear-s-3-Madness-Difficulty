function initialize()
{
    Frame = 0;
    HeadSize = 1;
    HorseOffset = 0;
    Pulse = 0;
    PulseTimer = 30;
    TransitionPosition = 1;
    TransitionSpeed = 0;
    TextSize = 0;
    TextOffset = 0;
    TextOffsetSpeed = 0;
    ChosenMicrogame = 0;
    ChosenCommand = "WHAT?";
    ChosenRoom = FredbearMinigames;
    MicrogameTimer = 999;
    HeartShake = 0;
    HeartGravity = 0;
    HeartOffset = 0;
    SpecialFlag = 0;
    SpecialPopupPos = -640;
}

randomize();
initialize();
application_surface_draw_enable(false);
MicrogameList = [
{
    Command: "PADDLEBALL!",
    Room: FredbearMinigames,
    Time: 6,
    Object: oMicrogame_Coffee
}, 
{
    Command: "CLOSE!",
    Room: FredbearMinigames,
    Time: 6,
    Object: oMicrogame_Helpy
}, 
{
    Command: "QUIZ!",
    Room: Fredbear_3DMaze,
    Time: 5,
    Object: oMicrogame_Quiz
}, 
{
    Command: "TYPE!",
    Room: Fredbear_3DMaze,
    Time: [6, 7, 8],
    Object: oMicrogame_KeyboardInput
}, 
{
    Command: "MAX OUT!",
    Room: Fredbear_MonitorMinigame,
    Time: 4,
    Object: oMicrogame_CupcakeClicker
}, 
{
    Command: "FLOAT!",
    Room: Fredbear_MonitorMinigame,
    Time: [3.5, 5, 6.5],
    Object: oMicrogame_AirAdventure
}, 
{
    Command: "EAT!",
    Room: Fredbear_MonitorMinigame,
    Time: 6,
    Object: oMicrogame_ChicasFeedingFrenzy
}, 
{
    Command: "MATCH!",
    Room: Fredbear_MonitorMinigame,
    Time: [7, 9, 10],
    Object: oMicrogame_HarePairs
}, 
{
    Command: "SWEEP!",
    Room: Fredbear_MonitorMinigame,
    Time: [5, 6, 7],
    Object: oMicrogame_Fredsweeper
}, 
{
    Command: "SORT!",
    Room: Fredbear_MonitorMinigame,
    Time: [4, 4.5, 5],
    Object: oMicrogame_CircusSorter
}, 
{
    Command: "CUPCAKE!",
    Room: Fredbear_Office,
    Time: [3, 4, 5],
    Object: oMicrogame_ToyChicaCupcake
}, 
{
    Command: "YANK!",
    Room: Fredbear_Office,
    Time: 6,
    Object: oMicrogame_SalvageWirePull
}, 
{
    Command: "MASK!",
    Room: Fredbear_Office,
    Time: 3,
    Object: oMicrogame_WitheredBonnie
}, 
{
    Command: "AVOID!",
    Room: Fredbear_MonitorMinigame,
    Time: [3, 5, 6],
    Object: oMicrogame_PiratePlunder
}, 
{
    Command: "PICK ME!",
    Room: FredbearMinigames,
    Time: 3,
    Object: oMicrogame_Extras
}, 
{
    Command: "PLATFORM!",
    Room: FredbearMinigames,
    Time: [5, 5, 7],
    Object: oMicrogame_Animdude
}, 
{
    Command: "SHOCK!",
    Room: Fredbear_Office,
    Time: [5, 6, 7],
    Object: oMicrogame_Sparky
}, 
{
    Command: "SCARE AWAY!",
    Room: Fredbear_Office,
    Time: [4, 4.5, 5],
    Object: oMicrogame_Freddles
}, 
{
    Command: "FIND ME!",
    Room: Fredbear_3DMaze,
    Time: [6, 7, 9],
    Object: oMicrogame_3DFinder
}, 
{
    Command: "INPUT!",
    Room: Fredbear_3DMaze,
    Time: [6, 7, 8],
    Object: oMicrogame_Keypad
}];
MicrogameList = array_shuffle(MicrogameList);

function choose_microgame()
{
    if (Lives == 0)
    {
        ChosenMicrogame = 
        {
            Command: " ",
            Room: Fredbear_GameOver,
            Time: 999,
            Object: oNOTHING
        };
        texturegroup_load("FinalBossJumpscare");
        alarm[0] = 150;
        
        if (!variable_global_exists("FredbearScoreboard"))
        {
            global.FredbearScoreboard = [
            {
                Title: "HRY",
                Score: 20
            }, 
            {
                Title: "YOU",
                Score: MicrogameNumber - 1
            }];
        }
        else
        {
            array_push(global.FredbearScoreboard, 
            {
                Title: "YOU",
                Score: MicrogameNumber - 1
            });
        }
        
        array_sort(global.FredbearScoreboard, function(arg0, arg1)
        {
            return arg1.Score - arg0.Score;
        });
    }
    else if (SpecialFlag == 3)
    {
        ChosenMicrogame = 
        {
            Command: "SURVIVE!",
            Room: Office,
            Time: 999,
            Object: oFredbear
        };
        
        if (!boss_fight_night())
        {
            global.Route = UnknownEnum.Value_4;
            global.Night = 6;
        }
        
        global.BeartrapsToGenerate = Lives;
        global.NightSpeedup = 3;
    }
    else
    {
        ChosenMicrogame = MicrogameList[MicrogameNumber % array_length(MicrogameList)];
    }
    
    ChosenCommand = ChosenMicrogame.Command;
    ChosenRoom = ChosenMicrogame.Room;
    ChosenObject = ChosenMicrogame.Object;
}

FredbearSurface = -1;
MicrogameNumber = 0;
CreateObject = false;
MaxLives = 4;
Lives = MaxLives;
SpecialFlag = 0;
SpecialPopupPos = -640;
AlertSoundTimer = 0;
global.MicrogameWin = true;
global.MicrogameLevel = 0;
global.MicrogameSpeed = 1;
MaxMicrogames = 20;
MicrogameOffset = 0;
Endless = false;

if (global.Difficulty == 4)
{
    Endless = true;
    MaxMicrogames = 9999;
}

switch (global.Difficulty)
{
    case 0:
        break;
    
    case 1:
        break;
    
    case 2:
        global.MicrogameSpeed = 1.1;
        MicrogameOffset = 5;
        break;
    
    case 3:
        global.MicrogameSpeed = 1.1;
        global.MicrogameLevel = 1;
        MicrogameOffset = 10;
        break;
    
    case 4:
        break;
}

if (global.BossPhase == 2)
{
    MicrogameNumber = MaxMicrogames;
    Lives = 1;
    SpecialFlag = 3;
}

FailMode = false;
choose_microgame();
audio_sound_gain(mus_BossFredbear, 1, 0);
audio_sound_gain(mus_BossFredbear_Phase2, 1, 0);
play_music(mus_BossFredbear, 0.6);

enum UnknownEnum
{
    Value_4 = 4
}
