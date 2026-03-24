var Flashed = keyboard_check(ord("Z")) && HandMode == "Clench" && Timer < -60;

if (HandMode == "Wait" && Timer <= 0)
{
    HandMode = "Rise";
    audio_play_sound(sfxEndoCreak, 5, false);
}

if (HandMode == "Rise")
{
    ArmX -= (ArmX / 8);
    ArmY -= (ArmY / 8);
    
    if (round(ArmY / 4) == 0)
        HandMode = "Fall";
}

if (HandMode == "Fall")
{
    ArmX -= (ArmX / 8);
    ArmY += ArmY;
    
    if (ArmY > 90)
    {
        ArmY = 0;
        HandMode = "Clench";
        audio_play_sound(sfxMetalFootstep, 5, false);
    }
}

if (HandMode == "Clench")
    ArmY += ((-8 - ArmY) / 4);

var HandFrame = 0;
var HeadFrame = Flashed;

if (HandMode == "Clench")
    HandFrame = 1;

if (HandMode == "Die")
    HeadFrame = 2;

var Shakiness = round(random_range(-0.6, 0.6));
draw_sprite_ext(sWitheredFoxyBody, 0, x, y + BodyY, 1, 1, BodyAngle + Shakiness, c_white, 1);
Shakiness = round(random_range(-0.6, 0.6) * (1 + (Flashed / (0.05 + Tolerance))));
draw_sprite_ext(sWitheredFoxyHead, HeadFrame, x + 2 + (-88 * dsin(BodyAngle)), (y - 88) + HeadY, 1, 1, HeadAngle + Shakiness, c_white, 1);
draw_sprite(sWitheredFoxyArm, HandFrame, x + 100 + ArmX, y + ArmY);

if (Tolerance <= 0 && HandMode == "Clench")
{
    HandMode = "Die";
    ArmY += 50;
    Timer = 15;
}

if (HandMode != "Die")
{
    if (Timer == -60)
    {
        audio_play_sound(sfxEndoCreak, 5, false, 0.5);
        audio_play_sound(sfxWindowScare, 5, false, 1);
        Tolerance = 1;
    }
    
    if (Timer < -60)
    {
        BodyY -= (BodyY / 8);
        HeadY -= (HeadY / 10);
        BodyAngle -= (BodyAngle / 10);
    }
}
else
{
    BodyY = min(0.5 + (BodyY * 1.5), 256);
    HeadY = min(0.4 + (HeadY * 1.5), 256);
    
    if (Timer > 0)
        ArmY -= (ArmY / 4);
    else
        ArmY = min(0.25 + (ArmY * 1.5), 256);
    
    ArmX += ((-20 - ArmX) / 8);
    BodyAngle += ((30 - BodyAngle) / 10);
    HeadAngle += ((30 - BodyAngle) / 5);
}

if (input_check_pressed(UnknownEnum.Value_0))
    room_restart();

if (Flashed)
    Tolerance -= 0.005555555555555556;

Timer--;

enum UnknownEnum
{
    Value_0
}
