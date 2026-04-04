var ID = UnknownEnum.Value_5;
var AI = global.AILevels[ID];

if (AI == 0)
    Frame = 0;

var HiddenHeight = BaseY + Body.sprite_height;
var NormalHeight = BaseY;

switch (Mode)
{
    case "Down":
        var WaitTime = (50 - (AI * 2)) * RandomValue * 60;
        
        if (Frame > WaitTime)
        {
            var CanRise = true;
            
            if (instance_exists(oWitheredFoxy))
            {
                if (!(oWitheredFoxy.Mode == "Wait" || oWitheredFoxy.Mode == "Reset"))
                    CanRise = false;
            }
            
            if (instance_exists(oDreadbear))
            {
                if (oDreadbear.Mode != "Wait")
                    CanRise = false;
            }
            
            if (CanRise)
            {
                Frame = 0;
                Mode = "Readying";
                simple_sound(sfxEndoCreak, 0, -200, false, 0.75);
            }
            else
            {
                Frame--;
            }
        }
        
        TargetY = HiddenHeight;
        SpriteFrame = 0;
        break;
    
    case "Readying":
        TargetY = NormalHeight;
        
        if (Frame == (120 - (AI * 3)))
            simple_sound(sfxServo, 0, -200, false, 0.25);
        
        if (Frame > (120 - (AI * 3)))
            SpriteFrame = min(SpriteFrame + 0.26666666666666666, 3);
        
        if (SpriteFrame == 3)
        {
            Frame = 0;
            LeewayFrames = 0;
            Mode = "Active";
        }
        
        break;
    
    case "Active":
        TargetY = NormalHeight;
        
        if (Frame > (120 + (AI * 3)))
        {
            Frame = 0;
            Mode = "Returning";
            simple_sound(sfxServo, 0, -200, false, 0.25);
        }
        
        if (global.Flashlight)
        {
            LeewayFrames += oCamera.FlashlightPower;
            
            if (LeewayFrames >= lerp(30, 15, AI / 20))
            {
                Frame = 0;
                Mode = "Kill";
            }
        }
        
        break;
    
    case "Returning":
        if (Frame > 15)
        {
            Frame = 0;
            Mode = "Down";
            RandomValue = random_range(0.75, 1.25);
        }
        
        SpriteFrame = max(SpriteFrame - 0.26666666666666666, 0);
        break;
    
    case "Kill":
        SpriteFrame = 3;
        TargetY = HiddenHeight + 90;
        
        if (Frame > 30)
        {
            instance_destroy(Body);
            jumpscare(ID, 0);
        }
        
        break;
}

with (Body)
{
    sprite_index = sEndoskeleton;
    image_index = other.SpriteFrame;
    
    if (other.TargetY < y)
        y += ((other.TargetY - y) / 16);
    else if (y < other.TargetY)
        y += (((y - other.BaseY) + 16) / 8);
}

Frame += 1;

enum UnknownEnum
{
    Value_5 = 5
}
