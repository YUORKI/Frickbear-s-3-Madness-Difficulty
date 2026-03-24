if (!surface_exists(global.MinigameSurface))
    global.MinigameSurface = surface_create(160, 144);

surface_set_target(global.MinigameSurface);
draw_clear_alpha(c_black, 0);
var Colors = [13695200, 7389320, 5662772, 3354368];
var MouseX = (device_mouse_x_to_gui(0) - global.MinigameWindowX) / global.MinigameWindowScale;
var MouseY = (device_mouse_y_to_gui(0) - global.MinigameWindowY) / global.MinigameWindowScale;
var MinigameOpen = true;

if (room == Office)
{
    if (global.MonitorSystem != "Games" || !global.CamUp)
        MinigameOpen = false;
}

draw_rectangle_color(0, 16, 56, 128, Colors[3], Colors[3], Colors[3], Colors[3], false);
draw_rectangle_color(56, 24, 152, 120, Colors[0], Colors[0], Colors[0], Colors[0], false);
draw_rectangle_color(152, 16, 160, 128, Colors[3], Colors[3], Colors[3], Colors[3], false);
draw_set_color(Colors[1]);

if (Bet >= 1)
{
    draw_line_number(0);
    
    if (Bet >= 2)
    {
        draw_line_number(1);
        
        if (Bet >= 3)
        {
            draw_line_number(2);
            
            if (Bet >= 4)
            {
                draw_line_number(3);
                
                if (Bet >= 5)
                    draw_line_number(4);
            }
        }
    }
}

draw_set_color(c_white);

for (var s = 0; s < 3; s++)
{
    for (var i = 0; i < 5; i++)
    {
        draw_sprite(sSS_Icons, Slots[s][i], 64 + (32 * s), (32 * i) + floor(SlotsOffsets[s]));
        
        if (SpinTimer[s] > 0)
        {
            SlotsOffsets[s] += 2;
            
            if (SlotsOffsets[s] >= 32)
            {
                array_insert(Slots[s], 0, Slots[s][array_length(Slots[s]) - 1]);
                array_pop(Slots[s]);
                SlotsOffsets[s] = 0;
            }
            
            SpinTimer[s]--;
            
            if (SpinTimer[s] == 0)
                audio_play_sound(sfxBitCrunch, 10, false);
            
            if (SpinTimer[s] == 0 && s == 2)
            {
                FlashTimer = 60;
                
                if (Bet >= 1)
                {
                    LinesToDraw[0] = check_for_match(2, 2, 2);
                    
                    if (Bet >= 2)
                    {
                        LinesToDraw[1] = check_for_match(1, 1, 1);
                        
                        if (Bet >= 3)
                        {
                            LinesToDraw[2] = check_for_match(3, 3, 3);
                            
                            if (Bet >= 4)
                            {
                                LinesToDraw[3] = check_for_match(1, 2, 3);
                                
                                if (Bet >= 5)
                                    LinesToDraw[4] = check_for_match(3, 2, 1);
                            }
                        }
                    }
                }
                
                if (!array_contains(LinesToDraw, 1))
                    FlashTimer = 1;
            }
        }
    }
}

draw_sprite(sSS_Background, 0, 0, 0);
draw_set_font(global.FontGameboy);

for (var i = 0; i < 5; i++)
    draw_text_color(30, 7 + (16 * i), FaceValues[i], Colors[3], Colors[3], Colors[3], Colors[3], 1);

if (TokenQueue > 0)
{
    if (TokenQueue >= 40)
        get_trophy(UnknownEnum.Value_10);
    
    add_tokens_silently(1);
    global.TokensPerMinigame[UnknownEnum.Value_10]++;
    TotalEarnings++;
    TokenQueue--;
    audio_play_sound(sfxTally, 2, false);
    
    if (TotalEarnings > global.HiScores[UnknownEnum.Value_10])
        global.HiScores[UnknownEnum.Value_10] = TotalEarnings;
    
    if (TotalEarnings > global.HiScoresOverall[UnknownEnum.Value_10])
        global.HiScoresOverall[UnknownEnum.Value_10] = TotalEarnings;
}

draw_text_color(4, 132, "$" + string(TotalEarnings), Colors[3], Colors[3], Colors[3], Colors[3], 1);

if (FlashTimer > 0)
{
    for (var l = 0; l < 5; l++)
    {
        draw_set_color(Colors[2]);
        
        if (LinesToDraw[l] && (floor(FlashTimer / 10) % 2) == 0)
            draw_line_number(l);
    }
    
    FlashTimer--;
    
    if (FlashTimer == 0)
    {
        Bet = 0;
        LinesToDraw = [0, 0, 0, 0, 0];
    }
}

draw_set_color(c_white);
var ButtonsAvailable = [true, true, true];
var TokenMinimum = 0;

if (instance_exists(oCamera))
    TokenMinimum = oCamera.MinTokens;

if ((global.Tokens - TokenMinimum) <= 0 || Bet >= 5)
    ButtonsAvailable[0] = false;

if ((global.Tokens - TokenMinimum) < (5 - Bet) || Bet >= 5)
    ButtonsAvailable[1] = false;

if ((FlashTimer > 0 || SpinTimer[2] > 0) || Bet == 0)
    ButtonsAvailable[2] = false;

draw_sprite(sSS_Buttons, 2 + !ButtonsAvailable[0], 48, 128);
draw_sprite(sSS_Buttons, 4 + !ButtonsAvailable[1], 80, 128);
draw_sprite(sSS_Buttons, 0 + !ButtonsAvailable[2], 112, 128);

if (mouse_check_button_pressed(mb_left) && MinigameOpen)
{
    if ((MouseX >= 48 && MouseX < 80 && MouseY >= 128 && MouseY < 144) && ButtonsAvailable[0])
    {
        audio_play_sound(sfxBump, 10, false);
        global.Tokens--;
        Bet += 1;
    }
    
    if ((MouseX >= 80 && MouseX < 112 && MouseY >= 128 && MouseY < 144) && ButtonsAvailable[1])
    {
        audio_play_sound(sfxBump, 10, false);
        global.Tokens -= (5 - Bet);
        Bet = 5;
    }
    
    if ((MouseX >= 112 && MouseX < 144 && MouseY >= 128 && MouseY < 144) && ButtonsAvailable[2])
    {
        audio_play_sound(sfxBitDash, 10, false);
        SpinTimer[0] = irandom_range(8, 16) * 16;
        SpinTimer[1] = SpinTimer[0] + (irandom_range(5, 10) * 16);
        SpinTimer[2] = SpinTimer[1] + (irandom_range(5, 10) * 16);
        
        for (var i = 0; i < 3; i++)
            Slots[i] = array_concat([Slots[i][0], Slots[i][1], Slots[i][2], Slots[i][3], Slots[i][4]], array_shuffle(Slots[i], 5));
    }
}

surface_reset_target();

enum UnknownEnum
{
    Value_10 = 10
}
