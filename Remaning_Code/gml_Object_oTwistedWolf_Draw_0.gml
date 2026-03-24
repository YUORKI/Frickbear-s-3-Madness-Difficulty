var ID = UnknownEnum.Value_36;
var AI = global.AILevels[ID];

if (AI <= 0)
    exit;

var BaseX = 1088;
var BaseY = 448;

if (!WaitToAttack && global.CamUp && !InOffice && !Despawning && !RollFailed && Frame > 300)
{
    if (irandom_range(0, 35 - AI) > 10)
        RollFailed = true;
    else
        WaitToAttack = true;
}

if (!global.CamUp && !InOffice)
    RollFailed = false;

if (WaitToAttack && !global.CamUp)
{
    var CanEnter = true;
    
    if (instance_exists(oShadowFreddy))
    {
        if (oShadowFreddy.InOffice)
            CanEnter = false;
    }
    
    if (instance_exists(oWitheredBonnie))
    {
        if (oWitheredBonnie.Mode == "Attack")
            CanEnter = false;
    }
    
    if (CanEnter)
    {
        InOffice = true;
        Reach = 0;
        ReachSpeed = -0.5;
        TargetReach = 0;
        DiscPosition = irandom(5);
        audio_play_sound(sfxWindowScare, 5, false);
        Disc = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
        Hand = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
        FrontArm = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
        Head = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
        Torso = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
        BackArm = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
        Legs = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
        Frame = 0;
    }
    
    WaitToAttack = false;
}

if (InOffice)
{
    ReachSpeed = lerp(ReachSpeed, (1 - Reach) * 0.05, 0.25);
    Reach += (ReachSpeed + 0.01);
    var LegsX = 270;
    var LegsY = 500 + lerp(-2, 2, Reach);
    var LegsAngle = lerp(0, -2, Reach);
    var TorsoX = LegsX + rot_x(18 + lerp(0, 8, Reach), -168 + lerp(-4, 8, Reach), LegsAngle);
    var TorsoY = LegsY + rot_y(18 + lerp(0, 8, Reach), -168 + lerp(-4, 8, Reach), LegsAngle);
    var TorsoAngle = lerp(-1, 5, Reach) + random_range(-0.5, 0.5);
    var HeadX = lerp(TorsoX + rot_x(-26, -112, TorsoAngle), 256, 0.2) + lerp(0, 16, Reach);
    var HeadY = lerp(TorsoY + rot_y(-26, -112, TorsoAngle), 256, 0.2) + lerp(0, -16, Reach);
    var HeadAngle = lerp(0, -8, Reach) + random_range(-0.5, 0.5);
    var BackArmX = TorsoX + rot_x(105, -118, TorsoAngle);
    var BackArmY = TorsoY + rot_y(105, -118, TorsoAngle);
    var BackArmAngle = lerp(0, -2, Reach);
    var HandX = lerp(150, 216, Reach);
    var HandY = lerp(320, 350, Reach);
    var HandSize = lerp(1, 1.15, Reach);
    var HandAngle = lerp(-10, -15, Reach);
    var FrontArmX = lerp(TorsoX + rot_x(-185, -38, TorsoAngle), HandX, 0.25);
    var FrontArmY = lerp(TorsoY + rot_y(-185, -38, TorsoAngle), HandY, 0.25);
    var DiscX = 256;
    var DiscY = 256;
    var DiscSize = 1;
    
    switch (DiscPosition)
    {
        case 0:
            DiscX = HandX;
            DiscY = HandY;
            DiscSize = HandSize;
            break;
        
        case 1:
            DiscX = TorsoX + rot_x(-144, -192, TorsoAngle);
            DiscY = TorsoY + rot_y(-144, -192, TorsoAngle);
            break;
        
        case 2:
            DiscX = TorsoX + rot_x(80, -48, TorsoAngle);
            DiscY = TorsoY + rot_y(80, -48, TorsoAngle);
            break;
        
        case 3:
            DiscX = TorsoX + rot_x(-235, -125, TorsoAngle);
            DiscY = TorsoY + rot_y(-235, -125, TorsoAngle);
            break;
        
        case 4:
            DiscX = BackArmX + rot_x(53, 0, BackArmAngle);
            DiscY = BackArmY + rot_y(53, 0, BackArmAngle);
            break;
        
        case 5:
            DiscX = HeadX + rot_x(0, -35, HeadAngle);
            DiscY = HeadY + rot_y(0, -35, HeadAngle);
            break;
    }
    
    with (Hand)
    {
        sprite_index = sTwistedWolf_Hand;
        image_index = 0;
        x = HandX + BaseX;
        y = HandY + BaseY;
        image_xscale = HandSize;
        image_yscale = HandSize;
        image_angle = HandAngle * -1;
        DrawDepth = 55;
    }
    
    with (FrontArm)
    {
        sprite_index = sTwistedWolf_FrontArm;
        image_index = 0;
        x = FrontArmX + BaseX;
        y = FrontArmY + BaseY;
        image_xscale = lerp(HandSize, 1, 0.5);
        image_yscale = lerp(HandSize, 1, 0.5);
        image_angle = 0;
        DrawDepth = 54;
    }
    
    with (Head)
    {
        sprite_index = sTwistedWolf_Head;
        image_index = 0;
        x = HeadX + BaseX;
        y = HeadY + BaseY;
        image_angle = HeadAngle * -1;
        DrawDepth = 53;
    }
    
    with (Torso)
    {
        sprite_index = sTwistedWolf_Torso;
        image_index = 0;
        x = TorsoX + BaseX;
        y = TorsoY + BaseY;
        image_angle = TorsoAngle * -1;
        DrawDepth = 52;
    }
    
    with (BackArm)
    {
        sprite_index = sTwistedWolf_BackArm;
        image_index = 0;
        x = BackArmX + BaseX;
        y = BackArmY + BaseY;
        image_angle = BackArmAngle * -1;
        DrawDepth = 51;
    }
    
    with (Legs)
    {
        sprite_index = sTwistedWolf_Legs;
        image_index = 0;
        x = LegsX + BaseX;
        y = LegsY + BaseY;
        image_angle = LegsAngle * -1;
        DrawDepth = 50;
    }
    
    with (Disc)
    {
        sprite_index = sTwistedWolf_IllusionDisc;
        image_index = floor(other.Frame / 15) % 2;
        x = DiscX + BaseX;
        y = DiscY + BaseY;
        image_xscale = DiscSize;
        image_yscale = DiscSize;
        image_angle = 0;
        DrawDepth = 59;
    }
    
    if (point_distance(o3DMouse.x, o3DMouse.y, DiscX + 1088, DiscY + 448) < (32 * DiscSize) && mouse_check_button_pressed(mb_left))
    {
        Despawning = true;
        Frame = 0;
        InOffice = false;
        audio_play_sound(sfxMarioKick, 15, false);
        audio_play_sound(sfxBitKnockout, 15, false);
        instance_destroy(Disc);
        Plushie = instance_create_layer(BaseX + 256, BaseY + 156, "InFrontOf_Wall", oOfficeSprite);
        PlushieSpeed = -5;
        PlushieImage = irandom(2);
        Disc = undefined;
        Legs = undefined;
        Torso = undefined;
        Head = undefined;
        BackArm = undefined;
        FrontArm = undefined;
        Hand = undefined;
        block_tokens();
    }
    
    var WaitTime = lerp(300, 120, AI / 20);
    
    if (Frame > WaitTime)
        jumpscare(ID, 0);
}

with (oOfficeSprite)
{
    if (sprite_index == sTwistedWolf_BackArm || sprite_index == sTwistedWolf_FrontArm || sprite_index == sTwistedWolf_Hand || sprite_index == sTwistedWolf_Legs || sprite_index == sTwistedWolf_Torso || sprite_index == sTwistedWolf_Head)
    {
        if (other.Despawning)
        {
            image_index = 1;
            image_alpha -= (1/30);
            y -= (image_alpha * 3);
            
            if (image_alpha == 0)
                instance_destroy();
        }
        else
        {
            image_index = 0;
        }
    }
}

if (Plushie != undefined)
{
    with (Plushie)
    {
        sprite_index = sTwistedWolf_Plushie;
        image_index = other.PlushieImage;
        y += other.PlushieSpeed;
        image_angle += 5;
        image_xscale = 0.5;
        image_yscale = 0.5;
    }
    
    if (Plushie.y > (BaseY + 512))
    {
        instance_destroy(Plushie);
        Plushie = undefined;
    }
    
    PlushieSpeed += 0.5;
}

if (Despawning && Frame > 60)
    Despawning = false;

Frame++;

enum UnknownEnum
{
    Value_36 = 36
}
