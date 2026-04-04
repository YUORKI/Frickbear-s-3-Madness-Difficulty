var ID = UnknownEnum.Value_0;
var AI = global.AILevels[ID];

if (AI == 0)
    Frame = 0;

WaitTime = (50 - (AI * 2)) * RandomValue * 60 * (2/3);

if (Frame == 1)
    RandomValue = random_range(0.75, 1.25);

switch (Stage)
{
    case "ShowStage":
        if (Frame > WaitTime)
        {
            simple_sound(SOUND_Laugh1, 0, -200, false, 0.25);
            simple_sound(sfxSteps, 0, -200, false, 0.5);
            fuzz_up(UnknownEnum.Value_1, UnknownEnum.Value_2);
            Frame = 0;
            Stage = "DiningArea";
        }
        
        break;
    
    case "DiningArea":
        if (Frame > WaitTime)
        {
            Side = (irandom(1) * 2) - 1;
            simple_sound(SOUND_Laugh1, Side * 300, -200, false, 0.5);
            simple_sound(sfxSteps, Side * 200, -200, false, 0.5);
            fuzz_up(UnknownEnum.Value_2, UnknownEnum.Value_4 + sign_to_binary(Side));
            Frame = 0;
            Stage = "Hallway";
        }
        
        break;
    
    case "Hallway":
        if (Frame > WaitTime)
        {
            simple_sound(sfxSteps, Side * 300, -32, false, 1);
            fuzz_up(UnknownEnum.Value_4 + sign_to_binary(Side));
            Frame = 0;
            Stage = "Doorway";
        }
        
        break;
    
    case "Doorway":
        if (Frame == 1)
            simple_sound(SOUND_Laugh2, Side * 800, 0, false, 0.8);
        
        if (Frame > WaitTime || (global.CamUp && Frame > 180))
        {
            Frame = 0;
            Stage = "Kill";
            fuzz_up(UnknownEnum.Value_4 + sign_to_binary(Side));
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
                block_tokens();
                simple_sound(SOUND_Laugh1, Side * 300, 0, false, 0.5);
                Frame = 0;
                Stage = "ShowStage";
                fuzz_up(UnknownEnum.Value_4 + sign_to_binary(Side), UnknownEnum.Value_1);
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
            jumpscare(ID, Side);
        
        break;
}

Frame += 1;

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_4 = 4
}
