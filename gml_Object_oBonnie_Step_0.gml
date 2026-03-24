var ID = UnknownEnum.Value_1;
var AI = global.AILevels[ID];

if (AI == 0)
    Frame = 0;

WaitTime = (50 - (AI * 2)) * RandomValue * 60 * (2/3);

if (Frame == 1)
    RandomValue = random_range(0.75, 1.25);

var EyeSizeTarget = 0;

switch (Stage)
{
    case "ShowStage":
        if (Frame > WaitTime)
        {
            simple_sound(sfxSteps, 0, -200, false, 0.5);
            fuzz_up(UnknownEnum.Value_1);
            Frame = 0;
            Stage = "TransitionA";
        }
        
        break;
    
    case "TransitionA":
        if (Frame > 180)
        {
            fuzz_up(UnknownEnum.Value_2);
            Frame = 0;
            Stage = "DiningArea";
        }
        
        break;
    
    case "DiningArea":
        if (Frame > WaitTime)
        {
            simple_sound(sfxSteps, Side * 64, -128, false, 0.75);
            fuzz_up(UnknownEnum.Value_2);
            Frame = 0;
            Stage = "TransitionB";
        }
        
        break;
    
    case "TransitionB":
        if (Frame > 180)
        {
            fuzz_up(UnknownEnum.Value_4);
            Frame = 0;
            Stage = "Hallway";
        }
        
        break;
    
    case "Hallway":
        if (Frame > WaitTime)
        {
            simple_sound(sfxSteps, Side * 400, -32, false, 1);
            fuzz_up(UnknownEnum.Value_4);
            Frame = 0;
            Stage = "TransitionC";
        }
        
        break;
    
    case "TransitionC":
        if (Frame > 180)
        {
            Frame = 0;
            Stage = "Doorway";
        }
        
        break;
    
    case "Doorway":
        EyeSizeTarget = 1;
        
        if (Frame == 1)
            Growl = simple_sound(sfxGrowl, Side * 600, 0, false, 1);
        
        if (Frame > WaitTime || (global.CamUp && Frame > 150))
        {
            Frame = 0;
            Stage = "Kill";
        }
        
        if (global.Doors[(Side + 1) / 2])
        {
            Frame = 0;
            Stage = "Blocked";
        }
        
        break;
    
    case "Blocked":
        if (Frame == 30)
        {
            if (global.Doors[(Side + 1) / 2])
            {
                simple_sound(sfxBlock, Side * 300, 0, false, 1);
                fuzz_up(UnknownEnum.Value_1);
                block_tokens();
                Frame = 0;
                Stage = "ShowStage";
                EyeSize = 0;
                
                if (Growl != undefined && audio_is_playing(Growl))
                    audio_stop_sound(Growl);
                
                Growl = undefined;
            }
            else
            {
                Stage = "Doorway";
                Frame = 120;
            }
        }
        
        break;
    
    case "Kill":
        if (Frame > 30)
        {
            if (global.Doors[(Side + 1) / 2])
            {
                simple_sound(sfxBlock, Side * 300, 0, false, 1);
                fuzz_up(UnknownEnum.Value_1);
                block_tokens();
                Frame = 0;
                Stage = "ShowStage";
                EyeSize = 0;
                
                if (Growl != undefined && audio_is_playing(Growl))
                    audio_stop_sound(Growl);
                
                Growl = undefined;
            }
            else
            {
                jumpscare(ID, Side);
            }
        }
        
        break;
}

Frame += 1;
EyeSize += ((EyeSizeTarget - EyeSize) / 15);

with (Eyes)
{
    sprite_index = sHallwayEyes;
    image_index = 0;
    image_alpha = other.EyeSize;
    y = (other.BaseY - (other.EyeSize * 16)) + 16;
    DrawDepth = -20;
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_4 = 4
}
