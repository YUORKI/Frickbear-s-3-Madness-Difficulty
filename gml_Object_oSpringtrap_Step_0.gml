var ID = UnknownEnum.Value_20;
var AI = global.AILevels[ID];

if (AI == 0)
{
    Stage = 0;
    Frame = 0;
}

WaitTime = (lerp(42, 12, AI / 20) * RandomValue * 60) + 300;

switch (Stage)
{
    case 0:
    case 1:
    case 2:
    case 3:
        var VanishRate = lerp(10, 8, AI / 20) * oCamera.FlashlightPower;
        
        if (!(global.Cam == CurrentCam && global.CamUp))
            Frame += 1;
        else if (global.Flashlight)
            Frame = min(Frame - VanishRate, 600);
        
        if (Frame > WaitTime)
        {
            Frame = 300;
            Stage++;
            play_move_sound();
        }
        
        if (Frame < 0)
        {
            if (Stage == 0)
            {
                Frame = 0;
            }
            else
            {
                Frame = 300;
                Stage--;
                play_move_sound();
            }
        }
        
        break;
    
    case 4:
        if (Frame > WaitTime)
        {
            fuzz_up(CurrentCam);
            Frame = 0;
            Stage = "Kill";
        }
        
        if (!global.Doors[0])
            Frame += (WaitTime / 300);
        
        break;
    
    case "Kill":
        if (Frame > 60)
            jumpscare(ID, -1);
        
        Frame++;
        break;
}

enum UnknownEnum
{
    Value_20 = 20
}
