if (!surface_exists(OverGUISurf))
    OverGUISurf = surface_create(640, 360);

var FadedIn = abs(x) < 8;
var ScaryMode = CurrentChar == UnknownEnum.Value_55 && !DescriptionMode;

if (ScaryMode)
    audio_sound_gain(musExtras, 0, 0);

surface_set_target(OverGUISurf);
draw_clear_alpha(c_white, 0);
surface_reset_target();
draw_set_font(global.FontW97Black);
var Data = ExtrasDatabase[CurrentChar];
var ExtraChar = CurrentChar > 70;

if (CurrentChar <= oExtras_AnimatronicSelect.VanillaNum)
    global.ExtrasNotifs.AnimatronicsNotifs[CurrentChar] = false;

if (keyboard_check_pressed(vk_shift))
    ViewMode = !ViewMode;

if (in_window(x + 220, y, 420, 360) && mouse_check_button_pressed(mb_left) && !ViewMode && Frame > 5)
    ViewMode = true;
else if (in_window(0, 0, 640, 360) && mouse_check_button_pressed(mb_left) && ViewMode)
    ViewMode = false;

var Portrait = Data.Image;
sprite_set_offset(Portrait, sprite_get_width(Portrait) / 2, sprite_get_height(Portrait) / 2);
var TargetSize = min(344 / sprite_get_height(Portrait), 404 / sprite_get_width(Portrait), 1);
ImageSize += ((TargetSize - ImageSize) / 5);
PreviousImageSize -= (PreviousImageSize / 5);
ImageOffsetSize = clamp(ImageOffsetSize, 0, 1 - ImageSize);
var PortraitX = ImageX + ImageOffsetX;
var PortraitY = 180 + ImageOffsetY;
var PortraitSize = ImageSize + ImageOffsetSize;

if (ScaryMode)
{
    draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
    draw_sprite(sFredbear_Fidget, Frame / 4, 110, 0);
}

draw_rectangle_color(x + 6, 30, x + 197, 187, c_white, c_white, c_white, c_white, false);
var Text = Data.Desc[DescriptionMode];
var DebutText = "DEBUT: " + Data.Debut;
var DebutHeight = 0;

if (!DescriptionMode && Data.Debut != "")
{
    draw_text_ext(x + 10, (y + 30) - DescOffset, DebutText, 14, 182);
    DebutHeight = string_height_ext(DebutText, 14, 182) + 12;
}

draw_text_ext(x + 10, ((y + 30) - DescOffset) + DebutHeight, Text, 14, 182);
draw_rectangle_color(x + 6, 272, x + 197, 335, c_white, c_white, c_white, c_white, false);
var VoiceAmount = array_length(Data.VoiceLines);
var MiscAmount = 0;
var DeathquipAmount = 0;

for (var i = 0; i < VoiceAmount; i++)
{
    var ButtonX = 32 * (i % 6);
    var ButtonY = (32 * floor(i / 6)) - VoiceOffset;
    var LineIcon = Data.VoiceLines[i].LineType;
    var NowPlaying = Data.VoiceLines[i].LineID == CurrentSound;
    
    if (LineIcon == UnknownEnum.Value_1)
        MiscAmount++;
    
    if (LineIcon == UnknownEnum.Value_3)
        DeathquipAmount++;
    
    if (ButtonY >= -32 && ButtonY < 64)
    {
        draw_sprite_stretched(sButtonMini, NowPlaying, x + 6 + ButtonX, 272 + ButtonY, 32, 32);
        var Color = 8421504;
        
        if (NowPlaying)
            Color = 0;
        
        draw_sprite_ext(sButtonMini_Icons, 7 + LineIcon, x + 6 + ButtonX + 16, y + 272 + ButtonY + 16, 1, 1, 0, Color, 1);
        
        if (LineIcon == UnknownEnum.Value_1)
        {
            var Ones = MiscAmount % 10;
            var Tens = floor(MiscAmount / 10);
            draw_sprite_ext(sButtonMini_Icons, 21 + Ones, x + 6 + ButtonX + 16, y + 272 + ButtonY + 16, 1, 1, 0, c_ltgray, 1);
            draw_sprite_ext(sButtonMini_Icons, 11 + Ones, x + 6 + ButtonX + 16, y + 272 + ButtonY + 16, 1, 1, 0, Color, 1);
            
            if (Tens > 0)
            {
                draw_sprite_ext(sButtonMini_Icons, 21 + Tens, x + ButtonX + 16, y + 272 + ButtonY + 16, 1, 1, 0, c_ltgray, 1);
                draw_sprite_ext(sButtonMini_Icons, 11 + Tens, x + ButtonX + 16, y + 272 + ButtonY + 16, 1, 1, 0, Color, 1);
            }
        }
        
        if (LineIcon == UnknownEnum.Value_3)
        {
            var Ones = DeathquipAmount % 10;
            var Tens = floor(DeathquipAmount / 10);
            draw_sprite_ext(sButtonMini_Icons, 21 + Ones, x + 6 + ButtonX + 16, y + 272 + ButtonY + 16, 1, 1, 0, c_ltgray, 1);
            draw_sprite_ext(sButtonMini_Icons, 11 + Ones, x + 6 + ButtonX + 16, y + 272 + ButtonY + 16, 1, 1, 0, Color, 1);
            
            if (Tens > 0)
            {
                draw_sprite_ext(sButtonMini_Icons, 21 + Tens, x + ButtonX + 16, y + 272 + ButtonY + 16, 1, 1, 0, c_ltgray, 1);
                draw_sprite_ext(sButtonMini_Icons, 11 + Tens, x + ButtonX + 16, y + 272 + ButtonY + 16, 1, 1, 0, Color, 1);
            }
        }
        
        if (clicked(x + 6 + ButtonX, y + 272 + ButtonY, 32, 32) && mouse_in_zone(x + 6, y + 272, 192, 64) && FadedIn)
        {
            audio_stop_sound(CurrentSound);
            audio_sound_gain(musExtras, 0, 0);
            CurrentSound = Data.VoiceLines[i].LineID;
            var Subtitles = subtitle(CurrentSound);
            SubtitleList = Subtitles[0];
            SubtitleTimingList = Subtitles[1];
            SoundPlaying = audio_play_sound(CurrentSound, 5, false);
            SubtitleEntry = 0;
        }
    }
}

var CurrentlyPlaying = CurrentSound != sfxNOTHING;
var SoundPercentage = audio_sound_get_track_position(SoundPlaying) / audio_sound_length(SoundPlaying);

if (CurrentlyPlaying)
{
    if (!audio_is_playing(CurrentSound) || (in_window(x + 4, y + 340, 16, 16) && mouse_check_button(mb_left)))
    {
        audio_stop_sound(SoundPlaying);
        CurrentSound = sfxNOTHING;
        
        if (!ScaryMode)
            audio_sound_gain(musExtras, 1, 1000);
        
        SoundPercentage = 1;
    }
}

image_index = 0;
draw_self();

if (CurrentSound != sfxNOTHING)
{
    draw_set_halign(fa_center);
    var SubtitleText = Data.Name + ": " + SubtitleList[SubtitleEntry];
    surface_set_target(OverGUISurf);
    
    for (var FontDirection = 0; FontDirection < 360; FontDirection += 15)
    {
        for (var FontBold = 1; FontBold <= 3; FontBold++)
            draw_text_ext(PortraitX + round(lengthdir_x(FontBold, FontDirection)), 300 + round(lengthdir_y(FontBold, FontDirection)), SubtitleText, 15, 400);
    }
    
    draw_set_font(global.FontW97White);
    draw_text_ext(PortraitX, 300, SubtitleText, 15, 400);
    surface_reset_target();
    var SubtitleEndpoint = 999;
    
    if (SubtitleEntry < (array_length(SubtitleTimingList) - 1))
        SubtitleEndpoint = SubtitleTimingList[SubtitleEntry + 1];
    
    if (audio_sound_get_track_position(SoundPlaying) > SubtitleEndpoint)
        SubtitleEntry++;
    
    draw_set_halign(fa_left);
    draw_set_font(global.FontW97Black);
}

var Quit = clicked(x + 4, y + 4, 22, 22) || (input_check_pressed(UnknownEnum.Value_1) && FadedIn);
var ClickNext = clicked(x + 194, y + 4, 22, 22) || (input_check_pressed(UnknownEnum.Value_5) && FadedIn);
var ClickPrev = clicked(x + 172, y + 4, 22, 22) || (input_check_pressed(UnknownEnum.Value_3) && FadedIn);
draw_sprite_stretched(sButtonMini, 0, x + 4, y + 4, 22, 22);
draw_sprite(sButtonMini_Icons, 0, x + 4 + 11, y + 4 + 11);
draw_sprite_stretched(sButtonMini, ClickPrev, x + 172, y + 4, 22, 22);
draw_sprite(sButtonMini_Icons, 1, x + 172 + 11, y + 4 + 11);
draw_sprite_stretched(sButtonMini, ClickNext, x + 194, y + 4, 22, 22);
draw_sprite(sButtonMini_Icons, 2, x + 194 + 11, y + 4 + 11);
draw_text(x + 33, y + 5, Data.Name);

if (ClickPrev)
{
    audio_sound_gain(musExtras, 1, 1000);
    audio_stop_sound(CurrentSound);
    audio_play_sound(sfxClick, 5, false);
    PreviousImage = Portrait;
    PreviousImageSize = ImageSize;
    ImageSize = 0;
    
    do
        CurrentChar = ((CurrentChar - 1) + array_length(ExtrasDatabase)) % array_length(ExtrasDatabase);
    until (UnlockedArray[CurrentChar]);
    
    if (CurrentChar == UnknownEnum.Value_55 && !DescriptionMode)
        audio_sound_gain(musExtras, 0, 0);
    else if (ScaryMode)
        audio_sound_gain(musExtras, 1, 0);
}

if (ClickNext)
{
    audio_sound_gain(musExtras, 1, 1000);
    audio_stop_sound(CurrentSound);
    audio_play_sound(sfxClick, 5, false);
    PreviousImage = Portrait;
    PreviousImageSize = ImageSize;
    ImageSize = 0;
    
    do
        CurrentChar = (CurrentChar + 1) % array_length(ExtrasDatabase);
    until (UnlockedArray[CurrentChar]);
    
    if (CurrentChar == UnknownEnum.Value_55 && !DescriptionMode)
        audio_sound_gain(musExtras, 0, 0);
    else if (ScaryMode)
        audio_sound_gain(musExtras, 1, 0);
}

if (Quit)
{
    oExtras_AnimatronicSelect.Active = true;
    audio_sound_gain(musExtras, 1, 1000);
    audio_stop_sound(CurrentSound);
    audio_play_sound(sfxBump, 5, false);
    instance_destroy(oExtras_AnimatronicGallery);
}

var TextHeight = string_height_ext(Text, 14, 182) + DebutHeight + 2;
var TextSpace = 156;
var ScrollBar = scroll_bar(DescOffset, DescDragged, x + 6, y + 30, 192, 158, TextHeight, 14);
DescOffset = ScrollBar[0];
DescDragged = ScrollBar[1];
draw_sprite_stretched(sButtonMini, !DescriptionMode, x + 4, y + 192, 106, 22);
draw_text(x + 10, y + 193, "Description");
draw_sprite_stretched(sButtonMini, DescriptionMode, x + 110, y + 192, 106, 22);
draw_text(x + 116, y + 193, "Developer Notes");

if (clicked(x + 4, y + 192, 106, 22) && DescriptionMode && FadedIn)
{
    audio_play_sound(sfxClick, 5, false);
    DescriptionMode = 0;
}

if (clicked(x + 110, y + 192, 106, 22) && !DescriptionMode && FadedIn)
{
    audio_play_sound(sfxClick, 5, false);
    DescriptionMode = 1;
    
    if (ScaryMode)
        audio_sound_gain(musExtras, 1, 0);
}

var JumpscareAmount = array_length(Data.Jumpscares);

if (ScaryMode)
    JumpscareAmount = 0;

for (var i = 0; i < JumpscareAmount; i++)
{
    var JumpscareData = Data.Jumpscares[i];
    var _JumpSprite = JumpscareData.JumpSprite;
    var _JumpID = JumpscareData.JumpID;
    var _JumpSide = JumpscareData.JumpSide;
    var _JumpSideV = JumpscareData.JumpSideVertical;
    var Active = false;
    var ButtonWidth = 132 / JumpscareAmount;
    
    if (instance_exists(oJumpscareTest))
    {
        if (oJumpscareTest.JumpscareID == _JumpID && oJumpscareTest.sprite_index == _JumpSprite && oJumpscareTest.Side == _JumpSide)
            Active = true;
    }
    
    draw_sprite_stretched(sButtonMini, Active, x + 84 + (ButtonWidth * i), 219, ButtonWidth, 22);
    draw_sprite(sButtonMini_Icons, 2, x + 84 + (ButtonWidth * i) + (ButtonWidth / 2), y + 219 + 11);
    
    if (clicked(84 + (ButtonWidth * i), 219, ButtonWidth, 22) && FadedIn)
    {
        instance_destroy(oJumpscareTest);
        audio_play_sound(sfxClick, 5, false);
        
        with (instance_create_depth(0, 0, depth - 1, oJumpscareTest))
        {
            JumpscareID = _JumpID;
            sprite_index = _JumpSprite;
            Side = _JumpSide;
            SideVertical = _JumpSideV;
            Frame = 0;
        }
    }
}

draw_text(x + 9, y + 220, "Jumpscares");
TextHeight = max(ceil(VoiceAmount / 6), 2) * 32;
ScrollBar = scroll_bar(VoiceOffset, VoiceDragged, x + 6, y + 272, 192, 64, TextHeight, 32);
VoiceOffset = ScrollBar[0];
VoiceDragged = ScrollBar[1];

if (CurrentlyPlaying)
    draw_rectangle_color(x + 26 + (186 * SoundPercentage), y + 344, x + 25 + 186, y + 351, c_black, c_black, c_black, c_black, false);

draw_sprite_stretched(sButtonMini, !CurrentlyPlaying, x + 4, y + 340, 16, 16);
draw_sprite(sButtonMini_Icons, 5 + CurrentlyPlaying, x + 12, y + 348);
draw_text(x + 9, y + 247, "Voice Lines");
Frame++;

if (ViewMode)
{
    x += ((-220 - x) / 5);
    ImageX += ((320 - ImageX) / 5);
    AngleOffset -= (AngleOffset / 5);
    var XPosOnImage = ((ImageX + ImageOffsetX) - device_mouse_x_to_gui(0)) / PortraitSize;
    var YPosOnImage = ((180 + ImageOffsetY) - device_mouse_y_to_gui(0)) / PortraitSize;
    var SizeChange = (mouse_wheel_up() - mouse_wheel_down()) / 4;
    ImageOffsetSize += SizeChange;
    
    if (SizeChange != 0)
    {
        var NewSize = ImageSize + clamp(ImageOffsetSize, 0, 1 - ImageSize);
        var NewOffsetX = (XPosOnImage * NewSize) - (ImageX - device_mouse_x_to_gui(0));
        var NewOffsetY = (YPosOnImage * NewSize) - (180 - device_mouse_y_to_gui(0));
        ImageOffsetX = NewOffsetX;
        ImageOffsetY = NewOffsetY;
    }
    
    if (mouse_check_button_pressed(mb_right))
    {
        LastMouseX = device_mouse_x_to_gui(0);
        LastMouseY = device_mouse_y_to_gui(0);
    }
    
    if (mouse_check_button(mb_right))
    {
        ImageOffsetX -= (LastMouseX - device_mouse_x_to_gui(0));
        ImageOffsetY -= (LastMouseY - device_mouse_y_to_gui(0));
        LastMouseX = device_mouse_x_to_gui(0);
        LastMouseY = device_mouse_y_to_gui(0);
    }
}
else
{
    x -= (x / 5);
    ImageX += ((DefaultImageX - ImageX) / 5);
    AngleOffset = dsin(Frame) * 3;
    ImageOffsetX -= (ImageOffsetX / 5);
    ImageOffsetY -= (ImageOffsetY / 5);
    ImageOffsetSize -= (ImageOffsetSize / 5);
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_3 = 3,
    Value_5 = 5,
    Value_55 = 55
}
