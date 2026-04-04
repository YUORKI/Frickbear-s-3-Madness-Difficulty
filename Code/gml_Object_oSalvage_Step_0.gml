var OfficeCoords = [736, 265];

if (global.Flashlight && global.Cam == CurrentCam && global.CamUp)
{
    var FlashPower = oCamera.FlashlightPower;
    lose_hp(FlashPower / 180, false);
    MoveTimer -= ((FlashPower / 60) * 1.5);
}

if (instance_exists(oPhoneGuy_Salvage) && oPhoneGuy_Salvage.CurrentSound != sfxNOTHING)
    MoveTimer += ((Phase == 1) ? 0.011111111111111112 : (1/120));
else if (array_contains([UnknownEnum.Value_4, UnknownEnum.Value_5], CurrentCam) && global.Doors[CurrentCam - UnknownEnum.Value_4])
    MoveTimer += (1/120);

if (MoveTimer <= 0)
{
    fuzz_up(CurrentCam);
    FlashlightHP = BaseFlashlightHP;
    var DestList = PossibleDests[CurrentCam];
    var AtDeadEnd = array_length(DestList) <= 1 && CurrentCam == TargetCam;
    var CanEnterOffice = AtDeadEnd && array_contains([UnknownEnum.Value_4, UnknownEnum.Value_5], CurrentCam) && !global.Doors[CurrentCam - UnknownEnum.Value_4];
    var CanPowerout = AtDeadEnd && (Powerout == false && SiphonCooldown == 0) && array_contains([UnknownEnum.Value_6, UnknownEnum.Value_3, UnknownEnum.Value_7, UnknownEnum.Value_8], CurrentCam) && Phase > 1;
    
    if (CanEnterOffice)
    {
        var SalvSide = binary_to_sign(CurrentCam - UnknownEnum.Value_4);
        CurrentCam = UnknownEnum.Value_0;
        MoveTimer = infinity;
        
        with (instance_create_layer(1344 + (512 * SalvSide), 672, "Behind_Wall", oSalvageHead))
        {
            Side = SalvSide;
            Doorway = sign_to_binary(Side);
            Timer = lerp(4, 2, other.AIPercent);
            image_alpha = 0;
        }
        
        simple_sound(sfxSalvageStatic, 200 * SalvSide, 0, false, 1);
    }
    else if (CanPowerout)
    {
        VentWarningTimer = 0;
        SiphonCam = CurrentCam;
        MoveTimer = infinity;
        Powerout = true;
        PoweroutTimer = 0;
        audio_play_sound(sfxSalvageClatter, 15, false);
        LastAttackPoint = TargetCam;
        TargetCam = choose(UnknownEnum.Value_4, UnknownEnum.Value_5);
        BreakerWarnings = [UnknownEnum.Value_3, UnknownEnum.Value_6, UnknownEnum.Value_7, UnknownEnum.Value_8];
    }
    else
    {
        if (CurrentCam == TargetCam)
        {
            do
            {
                if (Phase < 2 || Phase >= 5)
                    TargetCam = choose(UnknownEnum.Value_4, UnknownEnum.Value_5);
                else
                    TargetCam = choose(UnknownEnum.Value_4, UnknownEnum.Value_5, UnknownEnum.Value_3, UnknownEnum.Value_6, UnknownEnum.Value_7, UnknownEnum.Value_8);
            }
            until (TargetCam != LastAttackPoint);
            
            Running = false;
        }
        
        with (oCamButton)
        {
            if (CamNumber == other.TargetCam)
            {
                other.TargetCamCoords[0] = x / 2;
                other.TargetCamCoords[1] = y;
            }
        }
        
        if (TargetCam == UnknownEnum.Value_0)
        {
            TargetCamCoords[0] = OfficeCoords[0] / 2;
            TargetCamCoords[1] = OfficeCoords[1];
        }
        
        var LowestDistance = 9999;
        var DestinationCam = CurrentCam;
        
        for (var i = 0; i < array_length(DestList); i++)
        {
            if (DestList[i] == UnknownEnum.Value_0)
            {
                var CurDistance = point_distance(OfficeCoords[0] / 2, OfficeCoords[1], other.TargetCamCoords[0], other.TargetCamCoords[1]);
                
                if (CurDistance < LowestDistance)
                {
                    LowestDistance = CurDistance;
                    DestinationCam = CamNumber;
                }
            }
            
            with (oCamButton)
            {
                if (CamNumber == DestList[i])
                {
                    var CurDistance = point_distance(x / 2, y, other.TargetCamCoords[0], other.TargetCamCoords[1]);
                    
                    if (CurDistance < LowestDistance)
                    {
                        LowestDistance = CurDistance;
                        DestinationCam = CamNumber;
                    }
                }
            }
        }
        
        CurrentCam = DestinationCam;
        fuzz_up(CurrentCam);
        var CurMoveSpeed = lerp(8, 4, AIPercent) / (1 + Powerout);
        
        if (array_contains([UnknownEnum.Value_6, UnknownEnum.Value_3, UnknownEnum.Value_7, UnknownEnum.Value_8], CurrentCam))
            CurMoveSpeed *= 1.3;
        
        MoveTimer = random_range(CurMoveSpeed * 0.8, CurMoveSpeed * 1.2) / MoveSpeed;
        
        if (CurrentCam == TargetCam)
            Running = false;
        
        if (Running)
            MoveTimer = 0.5;
        
        CurrentCamCoords = [];
        
        with (oCamButton)
        {
            if (CamNumber == other.CurrentCam)
            {
                other.CurrentCamCoords[0] = x;
                other.CurrentCamCoords[1] = y;
            }
        }
        
        var BarkVolume = 0.25 + (25 / max(point_distance(CurrentCamCoords[0], CurrentCamCoords[1], OfficeCoords[0], OfficeCoords[1]), 50));
        reverb_sound(sfxPopgoesMove, (CurrentCamCoords[0] - OfficeCoords[0]) * 10, (CurrentCamCoords[1] - OfficeCoords[1]) * 10, false, BarkVolume, 1, 0.5 - (BarkVolume / 2));
        phase_transition();
    }
}

if (array_contains(BreakerWarnings, global.Cam))
{
    if (global.Cam != SiphonCam)
    {
        for (var i = 0; i < array_length(BreakerWarnings); i++)
        {
            if (BreakerWarnings[i] == global.Cam)
                array_delete(BreakerWarnings, i, 1);
        }
    }
}

if (PoweroutTimer > 0 && PoweroutTimer <= 60 && Powerout)
{
    var Percent = PoweroutTimer / 60;
    global.Brightness = random_range(1.5, lerp(0, 1, Percent));
    
    if (PoweroutTimer == 30)
        global.Brightness = 1;
}

if (PoweroutTimer > 0 && PoweroutTimer <= 30 && !Powerout)
{
    if (PoweroutTimer == 0)
        audio_play_sound(sfxPowerOn, 15, false, 0.5);
    
    global.Brightness = random_range(0.5, 2);
    
    if (PoweroutTimer == 30)
        global.Brightness = global.BaseBrightness;
}

if (SiphonCam != 0)
{
    global.Power -= 0.011111111111111112;
    HP += (1/120);
}

if (WireSummonTimer <= 0 && Phase >= 3 && Phase < 5)
{
    VentWarningTimer = 0;
    var SummonAmount = round(max(WireSummonAmount + random_range(-0.25, 0.25), 1));
    var SummonPosition = array_shuffle([-2, 0, 2]);
    var i = 0;
    
    repeat (SummonAmount)
    {
        with (instance_create_depth(0, 0, 0, oSalvage_VentCrawler))
        {
            VentX = SummonPosition[i++];
            Path = [];
            array_push(Path, [VentX, VentY - 1], [VentX, VentY]);
            Speed = lerp(8.5, 6.5, other.AIPercent);
            set_wait_time();
        }
    }
    
    audio_play_sound(sfxVentSqueak, 5, false, 0.75);
    WireSummonTimer = (random_range(0.8, 1.2) * lerp(18, 14, AIPercent)) / SummonSpeed;
}

VentWarningTimer = (VentWarningTimer + 1) % 60;

if (DanglerSummonTimer <= 0 && Phase >= 4)
{
    var SummonAmount = round(max(WireSummonAmount + random_range(-0.25, 0.25), 1));
    var SummonPosition = irandom_range(-90, 90);
    var Delay = 0;
    
    repeat (SummonAmount)
    {
        var ShowTutorial = false;
        
        if (!FirstWireSummoned)
        {
            ShowTutorial = true;
            FirstWireSummoned = true;
        }
        
        with (instance_create_depth(0, 0, 0, oSalvage_Dangler))
        {
            Timer = lerp(10, 8, other.AIPercent);
            image_angle = SummonPosition;
            Frame = Delay;
            Tutorialize = ShowTutorial;
        }
        
        SummonPosition = ((SummonPosition + 90 + irandom_range(30, 90)) % 180) - 90;
        Delay -= (irandom_range(15, 30) / 60);
    }
    
    DanglerSummonTimer = (random_range(0.8, 1.2) * lerp(16, 14, AIPercent)) / SummonSpeed;
}

PoweroutTimer++;
WireSummonTimer -= 0.016666666666666666;
DanglerSummonTimer -= 0.016666666666666666;
MoveTimer -= 0.016666666666666666;

if (SiphonCooldown > 0)
    SiphonCooldown--;

global.Power += (global.CamUp / 180 / 2);

if (global.Power <= 0 && !instance_exists(oSalvage_Jumpscarer))
    instance_create_depth(0, 0, 0, oSalvage_Jumpscarer);

if (HP == MaxHP)
    global.Brightness += ((global.BaseBrightness - global.Brightness) / 10);

Recolor = false;

if (Recolor)
{
    with (oCamera)
    {
        var Green = color_get_green(TintColor);
        var GreenTarget = other.TargetGreen;
        
        if (abs(Green - GreenTarget) < 0.1)
        {
            Green = GreenTarget;
            other.Recolor = false;
        }
        
        Green += ((GreenTarget - Green) / 10);
        TintColor = make_color_rgb(255, Green, lerp(255, Green, 0.5));
    }
}

audio_sound_gain(sfxSalvageGarble, 0.25 * instance_number(oSalvage_Dangler), 0);

if (!audio_is_playing(sfxSalvageGarble))
    audio_play_sound(sfxSalvageGarble, 15, true);

enum UnknownEnum
{
    Value_0,
    Value_3 = 3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8
}
