var Tangible = floor(Timer * 15) % 2;

if (Timer < 13)
    Tangible = true;
else if (Timer > 14)
    Tangible = false;
else if (((Timer * 15) % 1) == 0.25)
    audio_play_sound(sfxBitPlace, 2, false, 0.25);

if (Timer == 1)
{
    BulliesTarget = [32, 48, 64, 80];
    GuardTarget = 8;
}

if (BulliesTarget[1] != BulliesX[1] && (Timer % 0.25) == 0.016666666666666666)
    audio_play_sound(sfxBump, 2, false, 0.5);

if (Timer == 4.5)
{
    CakeSpeed = -3.5;
    PeopleJumpSpeed = [-2, -2, -2, -2];
    audio_play_sound(sfxBitKnockout, 2, false);
}

if (Timer > 4.5 && CakeHeight < 64)
{
    CakeSpeed += 0.2;
    CakeX += 1.8;
    
    if ((CakeHeight + CakeSpeed) >= 64)
    {
        CakeHeight = 64;
        CakeSpeed = 0;
        PeopleJumpSpeed = [-2, -2, -2, -2];
        GuardJumpSpeed = -2;
        CCJumpSpeed = -2;
        audio_play_sound(sfxBitThud, 2, false);
    }
    
    CakeHeight += CakeSpeed;
}

if (Timer == 6.25)
{
    audio_sound_gain(mus_BossNightmare_Ending, 1, 0);
    audio_play_sound(mus_BossNightmare_Ending, 10, true, 0.5);
}

if (Timer == 6.5)
{
    Dialogue = ["MA: Happy birthday, little bro!", "MA: I'm...sorry for how things went last time. I was hoping I could make it up to you.", "CC: ...B-Big bro? You...you came back?", "CC: I thought for sure you'd forget about me by now. It seems everyone else has...", "CC: Why come back for me after all these years...?", "MA: Well...everyone deserves a happy ending, don't they?", "MA: They're rare in this family...but if any of us deserve one, it's you.", "MA: Now, how about we give the little man a lift?"];
    TextNum = 0;
    Timer += 0.016666666666666666;
}

if (Timer == 6.533333333333333)
    BulliesTarget = [96, 118, 134, 64];

if (Timer > 6.533333333333333 && BulliesTarget[2] == BulliesX[2])
    BulliesSide[2] = 1;

if (Timer == 9)
{
    PeopleJumpSpeed = [0, -3, -3, 0];
    CCJumpSpeed = -4.5;
    CCFloor = 80;
    audio_play_sound(sfxBitJump, 2, false);
}

if (Timer >= 10.5 && Timer < 13)
{
    if ((Frame % 1) == 0.16666666666666666)
        PeopleJumpSpeed[0] = -2;
    
    if ((Frame % 1) == 0.5)
        PeopleJumpSpeed[1] = -2;
    
    if ((Frame % 1) == 0.8333333333333334)
        PeopleJumpSpeed[2] = -2;
}

if (Timer == 12.5)
{
    BulliesTarget[3] = 24;
    BulliesSide[3] = 1;
    Dialogue = ["MA: Oh, and Mike...", "MA: ...Thank you for everything.", "MA: To be honest with you, I didn't think I deserved to see this through to the end...", "MA: But seeing how much you've been willing to help me, a complete stranger...", "MA: ...Well, it means a lot to me.", "MA: Regardless, it seems I've no unfinished business left to tether me to this world.", "MA: I'm afraid we may not see each other again. At least, not in this life...", "MA: ...But I am confident that whatever awaits you will be lovely.", "MA: Well...I suppose I'd best be on my way, then. See you on the flipside."];
    
    if (global.Guard == 0)
        Dialogue[0] = "MA: Oh, and Jeremy...";
    
    if (global.Guard == 2)
        Dialogue[0] = "MA: Oh, and Vanessa...";
    
    if (global.Guard == 3)
        Dialogue[0] = "MA: Oh, and, er...Fritz, was it?";
    
    if (global.Guard >= 4)
        Dialogue[0] = "MA: Oh, and, er..." + guard_nickname() + ", was it?";
    
    TextNum = 0;
    Timer += 0.016666666666666666;
}

if (Timer == 13)
{
    GuardTarget -= 4;
    PeopleFloor = [PeopleHeight[0], PeopleHeight[1], PeopleHeight[2], PeopleHeight[3]];
    PeopleJumpSpeed = array_create(4, 0);
}

if (Timer == 15)
    PeopleFloor = array_create(4, FloorHeight + 3);

if (Timer == 16)
    BalloonSpeed = 0.05;

if (Timer > 16)
{
    BalloonHeight -= BalloonSpeed;
    BalloonSpeed += 0.005;
}

if (Timer >= 20 && Timer < 22)
{
    if ((Timer % 0.5) == 0.016666666666666666)
    {
        GuardSide *= -1;
        audio_play_sound(sfxBitPlace, 2, false, 0.25);
    }
}

if (Timer == 23)
{
    GuardSide = -1;
    GuardTarget = -32;
}

if (Timer == 25)
    audio_sound_gain(mus_BossNightmare_Ending, 0, 5000);

if (Timer >= 24)
{
    Darkness += 0.0033333333333333335;
    FadeVal += (sign(3 - FadeVal) / 80);
}

if (Timer == 32)
{
    global.BossPhase = 0;
    room_goto(Credits);
    audio_stop_sound(mus_BossNightmare_Ending);
}

if (!surface_exists(global.MinigameSurface))
    global.MinigameSurface = surface_create(160, 144);

surface_set_target(global.MinigameSurface);
draw_clear_alpha(c_black, 0);
draw_rectangle_color(0, 0, 160, 144, #E0F8D0, #E0F8D0, #E0F8D0, #E0F8D0, false);
draw_sprite(sHD_Balloon, floor(Frame * 2) % 2, 32, 128 + BalloonHeight);
draw_sprite(sHD_Balloon, !(floor(Frame * 2) % 2), 128, 128 + BalloonHeight);
var CakePosition = BulliesX[0];

if (CakeHeight == 64)
    CakePosition = 32;

draw_sprite(sHD_BigCake, 0, CakePosition + CakeX, CakeHeight);

if (GuardX != GuardTarget)
{
    GuardX += (sign(GuardTarget - GuardX) / 2);
    GuardWalking = true;
}
else
{
    GuardWalking = false;
}

for (var i = 0; i < 4; i++)
{
    if (BulliesX[i] != BulliesTarget[i])
    {
        BulliesX[i] += sign(BulliesTarget[i] - BulliesX[i]) / 2;
        BulliesWalking[i] = true;
    }
    else
    {
        BulliesWalking[i] = false;
    }
    
    var GuardImage = i * 2;
    
    if ((BulliesWalking[i] * (floor(Frame * 8) % 2)) == 1 || PeopleHeight[i] != PeopleFloor[i])
        GuardImage++;
    
    if (Tangible)
        draw_sprite_ext(sHD_Kid, GuardImage, BulliesX[i] + (!sign_to_binary(BulliesSide[i]) * 16), PeopleHeight[i], BulliesSide[i], 1, 0, c_white, 1);
    else
        draw_sprite_ext(sHD_Kid, i + 15, BulliesX[i] + (!sign_to_binary(BulliesSide[i]) * 16), PeopleHeight[i] - 3, BulliesSide[i], 1, 0, c_white, 1);
}

draw_sprite_ext(GuardSprite, (GuardWalking * (floor(Frame * 8) % 2)) + (global.Guard * 4), GuardX + 8, GuardHeight + 8, GuardSide, 1, 0, c_white, 1);
var CCSprite = floor(Frame * 2) % 2;

if (CakeHeight == 64)
    CCSprite = 2;

if (Timer >= 9 && Timer < 10.5)
    CCSprite = 4;
else if (Timer >= 10.5)
    CCSprite = 5 + (floor(Frame * 2) % 2);

if (Tangible)
    draw_sprite(sHD_Kid, 8 + CCSprite, 128, CCHeight);

for (var i = 0; i < 160; i += 16)
    draw_sprite(sHD_Wall, 21, i, 128);

for (var i = 0; i < 4; i++)
{
    if ((PeopleHeight[i] + PeopleJumpSpeed[i]) >= PeopleFloor[i])
    {
        PeopleHeight[i] = PeopleFloor[i];
        PeopleJumpSpeed[i] = 0;
    }
    else
    {
        PeopleHeight[i] += PeopleJumpSpeed[i];
    }
    
    if (Tangible)
        PeopleJumpSpeed[i] += 0.25;
    else
        PeopleJumpSpeed[i] += 0.01;
}

if ((GuardHeight + GuardJumpSpeed) >= FloorHeight)
{
    GuardHeight = FloorHeight;
    GuardJumpSpeed = 0;
}

GuardHeight += GuardJumpSpeed;
GuardJumpSpeed += 0.25;

if ((CCHeight + CCJumpSpeed) >= CCFloor && CCJumpSpeed > 0)
{
    CCHeight = CCFloor;
    CCJumpSpeed = 0;
}

CCHeight += CCJumpSpeed;
CCJumpSpeed += 0.25;

if (TextNum < array_length(Dialogue) && array_length(Dialogue) > 0)
{
    draw_rectangle_color(0, 0, 160, 96, #002F33, #002F33, #002F33, #002F33, false);
    var TextToType = string_copy(Dialogue[TextNum], 0, floor(TextType));
    draw_set_font(global.FontGameboy);
    draw_set_color(#E0F8D0);
    draw_text_ext(8, 8, TextToType, 12, 144);
    draw_set_color(c_white);
    var PitchUp = 0;
    
    if (string_char_at(Dialogue[TextNum], 1) == "C")
        PitchUp += 1;
    
    if ((TextType % 1) == 0.5 && TextType < string_length(Dialogue[TextNum]))
        audio_play_sound(sfxBump, 5, false, 0.5, 0, random_range(0.8, 1.2) + PitchUp);
    
    TextType = min(TextType + 0.5, string_length(Dialogue[TextNum]));
    
    if (input_check_pressed(UnknownEnum.Value_0))
    {
        if (TextType < string_length(Dialogue[TextNum]))
        {
            TextType = string_length(Dialogue[TextNum]);
        }
        else
        {
            TextType = 3;
            TextNum++;
            audio_play_sound(sfxBitCrunch, 5, false);
        }
    }
}
else
{
    Timer += 0.016666666666666666;
}

Frame += 0.016666666666666666;
surface_reset_target();

enum UnknownEnum
{
    Value_0
}
