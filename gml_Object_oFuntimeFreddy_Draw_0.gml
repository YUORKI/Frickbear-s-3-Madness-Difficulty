var ID = UnknownEnum.Value_27;
var AI = global.AILevels[ID];

if (AI <= 0)
    exit;

switch (Mode)
{
    case "Waiting":
        if (Frame > (lerp(60, 20, AI / 20) * RandomValue))
        {
            Frame = 0;
            Mode = "Hallway";
            Side = random_sign();
            ActualSide = random_sign();
            var EnterSound = choose(voc_FuntimeFreddy_Laugh1, voc_FuntimeFreddy_CountTheWays, voc_FuntimeFreddy_OverHere);
            reverb_sound(EnterSound, 400 * Side, 0, false, 0.5);
            fuzz_up(UnknownEnum.Value_4 + sign_to_binary(Side));
        }
        
        break;
    
    case "Hallway":
        if (Frame > lerp(20, 8, AI / 20))
        {
            Frame = 0;
            Mode = "Attacking";
            var Sound = choose(voc_FuntimeFreddy_BigHug, voc_FuntimeFreddy_HereICome, voc_FuntimeFreddy_BlowOutTheCandles, voc_FuntimeFreddy_CheckThisOut, voc_FuntimeFreddy_SeeSomethingCool);
            
            if (Side != ActualSide)
                Sound = choose(voc_FuntimeFreddy_TakeItAway, voc_FuntimeFreddy_ASurprise, voc_FuntimeFreddy_BlowOutTheCandles, voc_FuntimeFreddy_CheckThisOut, voc_FuntimeFreddy_SeeSomethingCool);
            
            VoiceClip = reverb_sound(Sound, 400 * Side, 0, false, 1);
        }
        
        break;
    
    case "Attacking":
        if (!audio_is_playing(VoiceClip))
        {
            if (global.Doors[sign_to_binary(ActualSide)])
            {
                if (!global.Doors[!sign_to_binary(ActualSide)] || instance_exists(oLaserDoor))
                {
                    simple_sound(sfxBlock, 400 * ActualSide, 0, false, 1);
                    var Sound = choose(voc_FuntimeFreddy_Doh1, voc_FuntimeFreddy_Doh2, voc_FuntimeFreddy_ComeOn1, voc_FuntimeFreddy_ComeOn2, voc_FuntimeFreddy_Mumbling);
                    reverb_sound(Sound, 400 * Side, 0, false, 1);
                    block_tokens();
                    Frame = 0;
                    Mode = "Waiting";
                    RandomValue = random_range(0.8, 1.2);
                    fuzz_up(UnknownEnum.Value_4 + sign_to_binary(Side));
                }
            }
            else if (Side == ActualSide)
            {
                jumpscare(ID, ActualSide);
            }
            else
            {
                jumpscare(UnknownEnum.Value_30, ActualSide);
            }
        }
        
        break;
}

if ((Mode == "Hallway" || Mode == "Attacking") && global.Cam == (UnknownEnum.Value_4 + sign_to_binary(Side)))
{
    if (Side == -1)
        depth = 20;
    else
        depth = 12;
    
    var Image = 1 + Side;
    
    if (Side != ActualSide)
        Image++;
    
    draw_sprite(sFuntimeFreddy, Image, global.CamX, global.CamY);
}

Frame += 0.016666666666666666;

enum UnknownEnum
{
    Value_4 = 4,
    Value_27 = 27,
    Value_30 = 30
}
