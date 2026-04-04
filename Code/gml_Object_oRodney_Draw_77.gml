var ID = UnknownEnum.Value_46;
var AI = global.AILevels[ID];

if (AI == 0)
    exit;

depth = -1;
set_target_to_ui();
var QuipWait = lerp(30, 15, AI / 20) * Randomizer;
TimeToNextQuip = min(TimeToNextQuip, QuipWait);
var BodyX = 642;
var BodyY = 360 + (dsin(Frame + 30) * 2) + BounceOffset + YOffset;
var BodyAngle = 0;
var NeckX = BodyX + rot_x(-22, -12, BodyAngle);
var NeckY = BodyY + rot_y(-22, -12, BodyAngle);
var NeckAngle = lerp((dsin(Frame) * 5) + 8, dsin(Frame) * 3, Position) + BounceOffset;
var HeadX = NeckX + rot_x(-46, -53, NeckAngle);
var HeadY = NeckY + rot_y(-46, -53, NeckAngle);
var HeadAngle = lerp(dsin(Frame - 30) * 2, 15, Position);
var HeadSize = 1 + (BounceOffset / 20);
var HeadImage = 0;

if (BlinkFrames > 0)
{
    BlinkFrames--;
    HeadImage = 1;
}
else if (PositionTarget)
{
    HeadImage = 2;
}

draw_sprite_ext(sRodney_Body, 0, BodyX, BodyY, 1, 1, BodyAngle, c_white, 1);
draw_sprite_ext(sRodney_Neck, 0, NeckX, NeckY, 1, 1, NeckAngle, c_white, 1);
draw_sprite_ext(sRodney_Head, HeadImage, HeadX, HeadY, 1 / HeadSize, HeadSize, HeadAngle, c_white, 1);

if (irandom(100) == 0 && BlinkFrames == 0 && !PositionTarget)
{
    BlinkFrames = 10;
    BounceSpeed = 0.25;
}

Position += PositionSpeed;
PositionSpeed = lerp(PositionSpeed, (PositionTarget - Position) * 0.8, 0.2);
BounceOffset += BounceSpeed;
BounceSpeed = lerp(BounceSpeed, (0 - BounceOffset) * 0.8, 0.2);
Frame++;

if (TimeToNextQuip > 0 && CurrentLine == undefined)
{
    TimeToNextQuip -= 0.016666666666666666;
    
    if (TimeToNextQuip <= 0)
    {
        set_soundclip(QuoteLibrary[QuoteNum % array_length(QuoteLibrary)]);
        PositionTarget = 1;
        BounceSpeed = 2;
        BlinkFrames = 5;
        QuoteNum++;
    }
    
    if (TimeToNextQuip < (QuipWait * 0.5) && (audio_is_playing(sfxBitExplosion) || audio_is_playing(sfxBitFail)) && QuoteNum_MinigameFail < 6)
    {
        set_soundclip(QuoteLibrary_MinigameFail[QuoteNum_MinigameFail % array_length(QuoteLibrary_MinigameFail)]);
        PositionTarget = 1;
        BounceSpeed = 2;
        BlinkFrames = 5;
        QuoteNum_MinigameFail++;
    }
    
    if (TimeToNextQuip < (QuipWait * 0.5) && audio_is_playing(sfxRegister) && QuoteNum_Item < 4)
    {
        set_soundclip(QuoteLibrary_Item[QuoteNum_Item % array_length(QuoteLibrary_Item)]);
        PositionTarget = 1;
        BounceSpeed = 2;
        BlinkFrames = 5;
        QuoteNum_Item++;
    }
    
    if (TimeToNextQuip < (QuipWait * 0.1) && audio_is_playing(sfxBitCollect) && QuoteNum_Tokens < 4)
    {
        set_soundclip(QuoteLibrary_Tokens[QuoteNum_Tokens % array_length(QuoteLibrary_Tokens)]);
        PositionTarget = 1;
        BounceSpeed = 2;
        BlinkFrames = 5;
        QuoteNum_Tokens++;
    }
    
    var RodneyTV = false;
    
    with (oOffice_TV)
    {
        if ((TVOn && OffsetSpeed < -2) && (CurrentAnimation == 13 || CurrentAnimation == 23 || CurrentAnimation == 24))
            RodneyTV = true;
    }
    
    if (TimeToNextQuip < (QuipWait * 0.9) && RodneyTV)
    {
        set_soundclip(choose(voc_Rodney_TV_LoveThisChannel, voc_Rodney_TV_SomethinGood));
        PositionTarget = 1;
        BounceSpeed = 2;
        BlinkFrames = 5;
    }
    
    if (TimeToNextQuip < (QuipWait * 0.9) && CallMuted)
    {
        set_soundclip(voc_Rodney_PhoneMute);
        PositionTarget = 1;
        BounceSpeed = 2;
        BlinkFrames = 5;
        CallMuted = false;
    }
}

if (CurrentLine != undefined)
{
    if (!audio_is_playing(CurrentLine))
    {
        TimeToNextQuip = QuipWait;
        CurrentLine = undefined;
        Randomizer = random_range(0.75, 1.25);
        PositionTarget = 0;
        BounceSpeed = 2;
        BlinkFrames = 5;
    }
    else if (subtitles_enabled())
    {
        draw_set_halign(fa_center);
        draw_set_font(global.FontW97Black);
        var SubtitleText = "RODNEY: " + SubtitleList[SubtitleEntry];
        
        for (var FontDirection = 0; FontDirection < 360; FontDirection += 15)
        {
            for (var FontBold = 1; FontBold <= 3; FontBold++)
                draw_text_ext(320 + round(lengthdir_x(FontBold, FontDirection)), 314 + round(lengthdir_y(FontBold, FontDirection)), SubtitleText, 15, 400);
        }
        
        draw_set_font(global.FontW97White);
        draw_text_ext(320, 314, SubtitleText, 15, 400);
        var SubtitleEndpoint = 999;
        
        if (SubtitleEntry < (array_length(SubtitleTimingList) - 1))
            SubtitleEndpoint = SubtitleTimingList[SubtitleEntry + 1];
        
        if (audio_sound_get_track_position(CurrentLine) > SubtitleEndpoint)
            SubtitleEntry++;
        
        draw_set_halign(fa_left);
        draw_set_font(global.FontW97Black);
    }
}

surface_reset_target();

if (mouse_in_zone(480, 200, 160, 160))
    YOffset += ((100 - YOffset) / 5);
else
    YOffset -= (YOffset / 5);

enum UnknownEnum
{
    Value_46 = 46
}
