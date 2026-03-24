if (!surface_exists(FredbearSurface))
    FredbearSurface = surface_create(display_get_gui_width(), display_get_gui_height());

surface_set_target(FredbearSurface);
draw_clear_alpha(c_black, 0);
var WaitTime = 180;

if (SpecialFlag != 0)
{
    WaitTime += 60;
    
    if (FailMode)
        WaitTime += 120;
}

var HorseTarget = binary_to_sign(floor(Frame / 30) % 2) * 48;

if (Frame < (WaitTime + 30))
{
    draw_sprite_ext(sFredbear_Curtain, 1, 320, 180, 1, 1, 0, #666666, 1);
    
    for (var X = 0; X < 8; X++)
    {
        for (var Y = 0; Y < 5; Y++)
        {
            var PizzaX = (((X * 128) - ((Y % 2) * 64)) + (Frame % 128)) - 128;
            var PizzaY = Y * 128;
            draw_sprite_ext(sFredbear_Pizza, 0, PizzaX, PizzaY, 0.75, 0.75, round((PizzaX + PizzaY) / -15) * 15, #3D3D3D, 1);
        }
    }
    
    for (var X = 0; X < 8; X++)
    {
        var PizzaX = (X * 196) - (((Frame * 2) % 196) * 2);
        draw_sprite_ext(sFredbear_Horse, 0, 640 - PizzaX, 200 + (HorseOffset * binary_to_sign(X % 2)), -0.5, 0.5, 0, #888888, 1);
    }
    
    for (var X = 0; X < 8; X++)
    {
        var PizzaX = (X * 196) - (((Frame * 2) % 196) * 2);
        draw_sprite_ext(sFredbear_Horse, 0, PizzaX, 200 + (HorseOffset * binary_to_sign(X % 2)), 1, 1, 0, #DDDDDD, 1);
    }
    
    draw_set_alpha(0.5);
    draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    var PulseSize = 1 + (Pulse / 4);
    draw_sprite(sFredbear_Curtain, 0, 320, 160 - (Pulse * 4));
    draw_sprite_ext(sFredbear_PizzaBig, 0, 320, 180, lerp(1, PulseSize, 0.5), lerp(1, PulseSize, 0.5), Frame, c_white, 1);
    
    for (var i = 0; i < Lives; i++)
        draw_sprite_ext(sFredbear_Heart, 0, lengthdir_x(160 * lerp(1, PulseSize, 0.5), Frame + (i * (360 / MaxLives))) + 320, lengthdir_y(160 * lerp(1, PulseSize, 0.5), Frame + (i * (360 / MaxLives))) + 180, PulseSize, PulseSize, HorseOffset / 2, c_white, 1);
    
    draw_sprite_ext(sFredbear_PizzaBig, 0, 0, 0, 0.5, 0.5, 0 - Frame, c_gray, 1);
    draw_sprite_ext(sFredbear_PizzaBig, 0, 640, 0, 0.5, 0.5, 0 - Frame, c_gray, 1);
    draw_sprite_ext(sFredbear_PizzaBig, 0, 0, 360, 0.5, 0.5, 0 - Frame, c_gray, 1);
    draw_sprite_ext(sFredbear_PizzaBig, 0, 640, 360, 0.5, 0.5, 0 - Frame, c_gray, 1);
    draw_sprite_ext(sFredbear_Numbers, floor(MicrogameNumber / 10), 296, 40, 0.5, 0.5, HorseOffset / 3, c_white, 1);
    draw_sprite_ext(sFredbear_Numbers, MicrogameNumber % 10, 344, 40, 0.5, 0.5, HorseOffset / 3, c_white, 1);
    
    if (FailMode)
    {
        draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
        
        if (Frame >= WaitTime)
            FailMode = false;
    }
    
    if (Frame != 0)
    {
        if (Frame > (WaitTime - 30))
            draw_sprite_ext(sFredbear_Transition, min((Frame - (WaitTime - 30)) / 5, 10), 320, lerp(180, -700, TransitionPosition), lerp(1, 15, TransitionPosition), lerp(1, 25, TransitionPosition), 0, c_white, 1);
        else if (Frame <= 30)
            draw_sprite_ext(sFredbear_Transition, max((11 * (30 - Frame)) / 30, 0), 320, lerp(180, -700, TransitionPosition), lerp(1, 15, TransitionPosition), lerp(1, 25, TransitionPosition), 0, c_white, 1);
        else if (FailMode)
            draw_sprite_ext(sFredbear_SpinHead, 0, 320, 180, (Frame < 60) ? PulseSize : 1, (Frame < 60) ? PulseSize : 1, 0, c_white, 1);
        else
            draw_sprite_ext(sFredbear_SpinHead, Frame / 2, 320, 180, PulseSize, PulseSize, 0, c_white, 1);
    }
    else
    {
        draw_rectangle_color(0, 0, 640, 360, c_lime, c_lime, c_lime, c_lime, false);
    }
    
    SpecialPopupPos = clamp(SpecialPopupPos, -320, 960);
    
    if (FailMode)
    {
        var FallPoint = 90;
        
        for (var i = 0; i < (Lives + 1); i++)
        {
            var LostHeart = i == Lives && Frame >= 30;
            var XOffset = max(irandom(FallPoint - Frame), 0) * LostHeart * random_sign();
            var YOffset = max(irandom(FallPoint - Frame), 0) * LostHeart * random_sign();
            
            if (LostHeart && !audio_is_playing(sfxSpringtrapSlash) && (floor(Frame / 5) * 5) == 30)
            {
                audio_play_sound(sfxSpringtrapSlash, 10, false, 1);
                
                if (Lives == 0)
                    audio_stop_sound(mus_BossFredbear);
            }
            
            if (LostHeart && !audio_is_playing(sfxCartoonHitSlip) && (floor(Frame / 5) * 5) == FallPoint)
                audio_play_sound(sfxCartoonHitSlip, 10, false);
            
            if (LostHeart && Frame > FallPoint)
                YOffset += (0.5 * power(Frame - FallPoint, 2));
            
            var HeartPosOffset = 80 * (i - ((MaxLives / 2) - 0.5));
            draw_sprite(sFredbear_Heart, 0, XOffset + 320 + HeartPosOffset, YOffset + 300);
        }
    }
    
    if (SpecialFlag != 0)
    {
        AlertSoundTimer -= global.MicrogameSpeed;
        
        if (AlertSoundTimer <= 0 && Frame <= (WaitTime - 50) && Frame >= (WaitTime - 210))
        {
            AlertSoundTimer = 60;
            audio_play_sound(sfxCoffeeWarning, 30, false);
        }
        
        if (Frame >= (WaitTime - 210))
            SpecialPopupPos += ((320 - SpecialPopupPos) / 10);
        
        if (Frame >= (WaitTime - 90))
            SpecialPopupPos += (((SpecialPopupPos - 320) / 4) + 1);
        
        draw_sprite_ext(sFredbear_MicrogamePopup, SpecialFlag - 1, SpecialPopupPos, 180, PulseSize, PulseSize, 0, c_white, 1);
    }
}

draw_set_font(global.FontHanddrawn);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i = 0; i < 360; i += 45)
{
    draw_set_color(c_black);
    draw_text_transformed(320 + (TextSize * round(lengthdir_x(1, i))), TextOffset + 180 + (TextSize * round(lengthdir_y(1, i))), ChosenCommand, TextSize, TextSize, 0);
}

draw_set_color(c_white);
draw_text_transformed(320, TextOffset + 180, ChosenCommand, TextSize, TextSize, 0);
draw_set_valign(fa_top);
HorseOffset += ((HorseTarget - HorseOffset) / 5);
Pulse -= (Pulse / 10);
PulseTimer -= global.MicrogameSpeed;

if (PulseTimer <= 0)
{
    Pulse = 1;
    PulseTimer = 30;
}

if (Frame < 30)
    TransitionPosition -= (TransitionPosition / 5);

if (CreateObject)
{
    CreateObject = false;
    instance_create_depth(0, 0, 0, ChosenObject);
    show_debug_message("Created object " + object_get_name(ChosenObject));
}

if (Frame >= (WaitTime + 15))
{
    TextOffsetSpeed -= (1 * global.MicrogameSpeed * global.MicrogameSpeed);
    TextOffset = max(TextOffset + TextOffsetSpeed, -360);
}
else if (Frame >= WaitTime)
{
    if (room == FredbearHome)
    {
        if (is_array(ChosenMicrogame.Time))
            MicrogameTimer = ChosenMicrogame.Time[global.MicrogameLevel];
        else
            MicrogameTimer = ChosenMicrogame.Time;
        
        room_goto(ChosenRoom);
        CreateObject = true;
    }
    
    TextOffsetSpeed = 2 * global.MicrogameSpeed;
    TransitionSpeed += (0.005 * global.MicrogameSpeed * global.MicrogameSpeed);
    TransitionPosition = min(TransitionPosition + TransitionSpeed, 1);
    TextSize += ((3 - TextSize) / 5);
}
else if (Frame >= (WaitTime - 30))
{
    TextOffset = 0;
    TextOffsetSpeed = 0;
    TransitionPosition += ((-0.02 - TransitionPosition) / 5);
    TransitionSpeed = 0.05 * global.MicrogameSpeed;
    
    if (Frame >= (WaitTime - 15))
        TextSize += ((3 - TextSize) / 5);
}

Frame += global.MicrogameSpeed;
MicrogameTimer = max(MicrogameTimer - (global.MicrogameSpeed / 60), 0);

if (MicrogameTimer <= 0 && Frame > WaitTime)
{
    if (!global.MicrogameWin)
    {
        Lives--;
        FailMode = true;
    }
    
    initialize();
    room_goto(FredbearHome);
    surface_free(global.UISurface);
    MicrogameNumber++;
    var MockNumber = MicrogameNumber + MicrogameOffset;
    
    if (Endless)
    {
        if ((MockNumber % 20) == 0 && global.MicrogameLevel < 2 && MicrogameNumber != 0)
        {
            MicrogameList = array_shuffle(MicrogameList);
            global.MicrogameLevel = (global.MicrogameLevel + 1) % 3;
            global.MicrogameSpeed = 1;
            SpecialFlag = 2;
        }
        else if (((MockNumber + 5) % 5) == 0 && MicrogameNumber != 0)
        {
            global.MicrogameSpeed += 0.1;
            SpecialFlag = 1;
        }
    }
    else if (MicrogameNumber == MaxMicrogames)
    {
        global.MicrogameLevel = 0;
        global.MicrogameSpeed = 1;
        SpecialFlag = 3;
        
        if (FailMode)
            alarm[1] = 150;
        else
            alarm[1] = 30;
    }
    else if ((MockNumber % 10) == 0 && global.MicrogameLevel < 2 && MicrogameNumber != 0)
    {
        MicrogameList = array_shuffle(MicrogameList);
        global.MicrogameLevel = (global.MicrogameLevel + 1) % 3;
        SpecialFlag = 2;
    }
    else if (((MockNumber + 5) % 5) == 0 && MicrogameNumber != 0)
    {
        global.MicrogameSpeed += 0.1;
        SpecialFlag = 1;
    }
    
    if (Lives == 0)
        SpecialFlag = 0;
    
    choose_microgame();
}

if (MicrogameTimer <= 2.5)
{
    var VisualTimer = ceil(MicrogameTimer * 2);
    
    for (var i = 1; i < ceil(VisualTimer); i++)
        draw_sprite(sFredbearTimer, 2 + (i == (VisualTimer - 1)), 128 * i, 360);
    
    draw_sprite(sFredbearTimer, (VisualTimer == 1) ? 0 : 1, 0, 360);
}

if (instance_exists(oJumpscare_Fredbear))
    draw_sprite(sJumpscare_Fredbear, oJumpscare_Fredbear.image_index, 0, 0);

if (Frame > 120 && Lives == 0)
    Frame -= global.MicrogameSpeed;

surface_reset_target();
