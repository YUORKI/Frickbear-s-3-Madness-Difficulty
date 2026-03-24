AI = (1 + ((global.Difficulty - 1) * 0.5)) * 10;
AIPercent = AI / 20;
CurrentCam = 1;
PossibleDests = [];
PossibleDests[UnknownEnum.Value_0] = [UnknownEnum.Value_4, UnknownEnum.Value_5];
PossibleDests[UnknownEnum.Value_1] = [UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_7, UnknownEnum.Value_8];
PossibleDests[UnknownEnum.Value_2] = [UnknownEnum.Value_1, UnknownEnum.Value_4, UnknownEnum.Value_5, UnknownEnum.Value_6];
PossibleDests[UnknownEnum.Value_3] = [UnknownEnum.Value_1];
PossibleDests[UnknownEnum.Value_4] = [UnknownEnum.Value_2];
PossibleDests[UnknownEnum.Value_5] = [UnknownEnum.Value_2];
PossibleDests[UnknownEnum.Value_6] = [UnknownEnum.Value_2];
PossibleDests[UnknownEnum.Value_7] = [UnknownEnum.Value_1];
PossibleDests[UnknownEnum.Value_8] = [UnknownEnum.Value_1];
MoveTimer = 3;
SiphonCam = 0;
SiphonCooldown = 0;
Running = false;
Powerout = false;
PoweroutTimer = 0;
PoweroutTimer = 120;
TargetCam = choose(UnknownEnum.Value_4, UnknownEnum.Value_5);
CurrentCamCoords = [];
TargetCamCoords = [];
BaseFlashlightHP = 1;
FlashlightHP = BaseFlashlightHP;
LastAttackPoint = UnknownEnum.Value_0;
DifficultyDrain = 0.15 * (global.Difficulty - 1);
HPDrainRate = 1.15;
WireSummonTimer = 1;
DanglerSummonTimer = 1;
MaxHP = 100;
HP = MaxHP;
HPBarOffset = 0;
HPBarCursorOffset = 0;
HPBarSpeed = 0;
CurrentCharacter = 0;
WireSummonAmount = 1;
FirstWireSummoned = false;
MoveSpeed = 1;
SummonSpeed = 1;
Recolor = true;
TargetGreen = 200;
SayDeathcoinLine = false;
TimesDeathcoined = 0;
VentWarningTimer = 0;
global.AILevels = array_create(48, 0);

with (oCamButtonShopItem)
{
    if (Text == "Distortion Clock" || Text == "Rewind Clock")
        instance_destroy();
}

SummonQueue = [];

if (!instance_exists(oPhoneGuy_Salvage))
{
    with (instance_create_depth(0, 0, 0, oPhoneGuy_Salvage))
    {
        if (global.BossPhase < 1)
        {
            add_soundclip(sfxPhoneRing);
            add_soundclip(sfxPhonePickup);
            add_soundclip(global.SalvagedMasks[0] ? voc_Michael_SalvagePhase1Part1_Pissed : voc_Michael_SalvagePhase1Part1);
            add_soundclip(voc_Michael_SalvagePhase1Part2);
            add_soundclip(sfxPhonePickup);
        }
    }
    
    global.BossPhase = 1;
}

for (var i = 0; i < array_length(global.AllTimeSalvages); i++)
{
    var ID = global.AllTimeSalvages[i];
    
    if (!array_contains([UnknownEnum.Value_20, UnknownEnum.Value_33, UnknownEnum.Value_35, UnknownEnum.Value_34], ID) || global.Night == "Custom")
        array_push(SummonQueue, ID);
}

function activate_characters(arg0, arg1 = true)
{
    var CharsSummoned = [];
    
    repeat (arg0)
    {
        var CharID = SummonQueue[min(CurrentCharacter, array_length(SummonQueue) - 1)];
        global.AILevels[CharID] = max(global.AILevels[CharID], clamp(round(lerp(8, 16, global.Difficulty / 3)), global.AILevels[CharID], 20));
        array_push(CharsSummoned, CharID);
        CurrentCharacter++;
    }
    
    if (arg1)
    {
        with (instance_create_depth(0, 0, 0, oSalvage_Summoner))
            Summons = CharsSummoned;
    }
}

function phase_transition()
{
    var ShouldBePhase = 6 - ceil((HP / MaxHP) * 5);
    
    if (Phase < ShouldBePhase)
    {
        Phase = ShouldBePhase;
        global.BossPhase = Phase;
        global.Timer = clamp((Phase - 1) * 60, 0, 359);
        TargetGreen = 200 - (20 * (Phase - 1));
        Recolor = true;
        var ClipsPerPhase = [sfxNOTHING, sfxNOTHING, voc_Salvage_Phase2, voc_Salvage_Phase3, voc_Salvage_Phase4, voc_Salvage_Phase5, sfxNOTHING];
        var PhaseClip = ClipsPerPhase[Phase];
        
        if (SayDeathcoinLine)
        {
            var DeathcoinLines = [voc_Salvage_Deathcoin1, voc_Salvage_Deathcoin2, voc_Salvage_Deathcoin3];
            PhaseClip = DeathcoinLines[min(TimesDeathcoined++, 2)];
            SayDeathcoinLine = false;
        }
        
        if (Phase == 2)
        {
            activate_characters(global.Difficulty + 2);
            Running = true;
            TargetCam = choose(UnknownEnum.Value_6, UnknownEnum.Value_8, UnknownEnum.Value_7, UnknownEnum.Value_3);
            HPDrainRate = 0.9 - (DifficultyDrain / 2);
            
            with (oPhoneGuy_Salvage)
            {
                audio_stop_sound(CurrentSound);
                SoundQueue = [];
                ReverbQueue = [];
                add_soundclip(PhaseClip, true);
                add_soundclip(sfxPhonePickup);
                add_soundclip(voc_Michael_SalvagePhase2);
                add_soundclip(sfxPhonePickup);
            }
        }
        else if (Phase == 3)
        {
            WireSummonTimer = 1;
            activate_characters(global.Difficulty + 1);
            HPDrainRate = 0.8 - DifficultyDrain;
            
            with (oPhoneGuy_Salvage)
            {
                audio_stop_sound(CurrentSound);
                SoundQueue = [];
                ReverbQueue = [];
                add_soundclip(PhaseClip, true);
                add_soundclip(sfxPhonePickup);
                add_soundclip(voc_Michael_SalvagePhase3);
                add_soundclip(sfxPhonePickup);
            }
        }
        else if (Phase == 4)
        {
            DanglerSummonTimer = 5;
            activate_characters(global.Difficulty + 1);
            HPDrainRate = 0.7 - DifficultyDrain;
            
            with (oPhoneGuy_Salvage)
            {
                audio_stop_sound(CurrentSound);
                SoundQueue = [];
                ReverbQueue = [];
                add_soundclip(PhaseClip, true);
                add_soundclip(sfxPhonePickup);
                add_soundclip(voc_Michael_SalvagePhase4);
                add_soundclip(sfxPhonePickup);
            }
        }
        else if (Phase == 5)
        {
            WireSummonAmount++;
            DanglerSummonTimer = 1;
            WireSummonTimer = 3;
            MoveSpeed *= 2;
            SummonSpeed *= 1.5;
            activate_characters(global.Difficulty + 1);
            HPDrainRate = 0.55 - DifficultyDrain;
            
            with (oCamButtonShopItem)
            {
                if (Text != "Pickles" && Text != "High-Quality Lumber")
                    instance_destroy();
            }
            
            if (instance_number(oShopItem) > 0)
                instance_create_depth(-400, 6, 5, oBossSalvage_ItemGrabber);
            
            with (oPhoneGuy_Salvage)
            {
                audio_stop_sound(CurrentSound);
                SoundQueue = [];
                ReverbQueue = [];
                add_soundclip(PhaseClip, true);
                add_soundclip(sfxPhonePickup);
                add_soundclip(voc_Michael_SalvagePhase5);
                add_soundclip(sfxPhonePickup);
            }
        }
        else if (Phase == 6)
        {
            if (global.Tokens < 0)
            {
                global.UnlockedAnimatronics[UnknownEnum.Value_48] = true;
                jumpscare(UnknownEnum.Value_48, 0);
            }
            
            with (oChipper)
                jumpscare_at_6AM();
            
            with (oBaby)
                jumpscare_at_6AM();
            
            with (oToyFreddy)
                jumpscare_at_6AM();
            
            if (!instance_exists(oJumpscare))
            {
                instance_destroy(oAnimatronicParent);
                instance_destroy(oPhoneGuy_Salvage);
                instance_destroy(oShopItem);
                audio_stop_all();
                instance_create_depth(0, 0, 0, oSalvageCloser_Window);
            }
            
            exit;
        }
    }
}

function when_zapped()
{
    MoveTimer = 0;
    BreakerWarnings = [];
    ShockTimer = 3;
    SiphonCam = 0;
    block_tokens();
    SiphonCooldown = 300;
    var Sound;
    
    if (Powerout)
    {
        Powerout = false;
        PoweroutTimer = 0;
        audio_play_sound(sfxPowerOn, 9, false);
        audio_play_sound(sfxMetalImpact, 5, false, 0.75);
        Sound = choose(voc_Salvage_Zapped1, voc_Salvage_Zapped2);
        lose_hp(5 + (1 / HPDrainRate));
    }
    else
    {
        TargetCam = choose(UnknownEnum.Value_4, UnknownEnum.Value_5);
        Sound = choose(voc_Salvage_HurtFinish1, voc_Salvage_HurtFinish2, voc_Salvage_HurtFinish3);
        lose_hp(2 + (1 / HPDrainRate));
    }
    
    reverb_sound(Sound, 0, 0, false, 0.5, 1, 0.5);
}

function lose_hp(arg0, arg1 = true)
{
    HP -= (arg0 * HPDrainRate);
    
    if (arg1)
        phase_transition();
    
    if (arg0 < 1)
        HPBarSpeed = random_range(-0.8, 0.8);
    else
        HPBarSpeed = arg0 * 2;
}

function salvage_jumpscare(arg0)
{
    if (instance_exists(oShopItem_Beartrap) || global.Cheats[UnknownEnum.Value_5])
    {
        instance_destroy(oSalvageHead);
        instance_destroy(oSalvage_VentCrawler);
        instance_destroy(oSalvage_Dangler);
        
        with (oDoor)
        {
            Bounce = false;
            BounceFloor = 999;
        }
        
        TargetCam = UnknownEnum.Value_1;
        Running = true;
        MoveTimer = 0;
        beartrap_notif(UnknownEnum.Value_49);
    }
    else
    {
        jumpscare(UnknownEnum.Value_49, arg0, Phase);
    }
}

activate_characters(5);

with (oCamera)
    spawn_starter_items();

Phase = 1;
audio_sound_gain(sfxSalvageGarble, 0, 0);
audio_play_sound(sfxSalvageGarble, 15, true);
BreakerWarnings = [];

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_20 = 20,
    Value_33 = 33,
    Value_34,
    Value_35,
    Value_48 = 48,
    Value_49
}
