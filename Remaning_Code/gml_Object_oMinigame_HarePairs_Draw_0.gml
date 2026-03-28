if (!surface_exists(global.MinigameSurface))
    global.MinigameSurface = surface_create(160, 144);

surface_set_target(global.MinigameSurface);
draw_clear_alpha(c_black, 0);
Paused = false;

if (room == Office)
{
    if (global.MonitorSystem != "Games" || !global.CamUp)
        Paused = true;
}

if (Initialize)
{
    CardDeck = ds_list_create();
    CardPositions = ds_list_create();
    Dead = false;
    DeathFrames = 0;
    
    for (var i = 0; i < 48; i++)
    {
        ds_list_add(CardDeck, i % 6);
        ds_list_add(CardPositions, [184, 176]);
    }
    
    ds_list_shuffle(CardDeck);
    SelectedCardPosition = -1;
    Frame = 0;
    AnimFrame = 0;
    BlinkFrame = irandom_range(60, 120);
    WaitForClick = true;
    Initialize = false;
}

var TexC = 3354368;
var TexCLight = 13695200;
draw_rectangle_color(0, 0, 160, 144, TexC, TexC, TexC, TexC, false);
var BonFrame = 0;

if (AnimFrame > BlinkFrame)
{
    var Blink = floor((AnimFrame - BlinkFrame) / 5);
    BonFrame = 2 - abs(Blink - 2);
    
    if (Blink >= 4)
        BlinkFrame += irandom_range(60, 240);
}

if (Dead)
{
    BonFrame = ((floor(DeathFrames) / 15) % 2) + 3;
    
    if (ds_list_size(CardDeck) != 0)
        BonFrame = ((floor(DeathFrames) / 30) % 2) + 5;
}

draw_sprite(sHP_Bonnie, BonFrame, 120, 0);
var MouseX = (device_mouse_x_to_gui(0) - global.MinigameWindowX) / global.MinigameWindowScale;
var MouseY = (device_mouse_y_to_gui(0) - global.MinigameWindowY) / global.MinigameWindowScale;

for (var i = 0; i < min(20, ds_list_size(CardDeck)); i++)
{
    var CardX = i % 5;
    var CardY = floor(i / 5);
    var CardXX = CardX * 24;
    var CardYY = CardY * 32;
    var CurrentX = array_get(ds_list_find_value(CardPositions, i), 0);
    var CurrentY = array_get(ds_list_find_value(CardPositions, i), 1);
    
    if (Dead && DeathFrames > 90)
    {
        CardXX = 184;
        CardYY = 176;
    }
    
    var NewX = CurrentX + ((CardXX - CurrentX) / 5);
    var NewY = CurrentY + ((CardYY - CurrentY) / 5);
    ds_list_set(CardPositions, i, [NewX, NewY]);
    var CardValue = ds_list_find_value(CardDeck, i);
    
    if (MouseX >= NewX && (NewX + 24) > MouseX && MouseY >= NewY && (NewY + 32) > MouseY && mouse_check_button_pressed(mb_left) && !Dead && !Paused)
    {
        if (SelectedCardPosition == -1)
        {
            SelectedCardPosition = i;
            audio_play_sound(sfxBitCrunch, 5, false);
            WaitForClick = false;
        }
        else if (CardValue == ds_list_find_value(CardDeck, SelectedCardPosition) && point_distance(CardX, CardY, SelectedCardPosition % 5, floor(SelectedCardPosition / 5)) < 2 && SelectedCardPosition != i)
        {
            if (SelectedCardPosition < i)
            {
                ds_list_delete(CardDeck, i);
                ds_list_delete(CardPositions, i);
            }
            
            ds_list_delete(CardDeck, SelectedCardPosition);
            ds_list_delete(CardPositions, SelectedCardPosition);
            
            if (SelectedCardPosition > i)
            {
                ds_list_delete(CardDeck, i);
                ds_list_delete(CardPositions, i);
            }
            
            SelectedCardPosition = -1;
            audio_play_sound(sfxBitPlace, 5, false);
            WaitForClick = false;
            var MatchExists = false;
            
            for (var c = 0; c < ds_list_size(CardDeck); c++)
            {
                if (check_for_matches(c))
                    MatchExists = true;
            }
            
            if (!MatchExists)
            {
                Dead = true;
                
                if (ds_list_size(CardDeck) == 0)
                {
                    add_tokens(45);
                    global.TokensPerMinigame[UnknownEnum.Value_4] += 45;
                    DeathFrames = 60;
                    
                    if (floor(Frame / 60) < global.HiScores[UnknownEnum.Value_4])
                        global.HiScores[UnknownEnum.Value_4] = floor(Frame / 60);
                    
                    if (global.HiScoresOverall[UnknownEnum.Value_4] > (Frame / 60))
                        global.HiScoresOverall[UnknownEnum.Value_4] = Frame / 60;
                    
                    if (floor(Frame / 60) <= 25)
                        get_trophy(UnknownEnum.Value_5);
                }
                else
                {
                    audio_play_sound(sfxBitFail, 10, false);
                    DeathFrames = 0;
                }
            }
        }
        else
        {
            SelectedCardPosition = i;
            audio_play_sound(sfxBitCrunch, 5, false);
        }
    }
    
    if (!(SelectedCardPosition == i) || (floor(Frame / 10) % 2) == 0)
    {
        draw_set_color(c_white);
        draw_sprite(sHP_Cards, CardValue, NewX, NewY);
    }
}

if (Dead)
{
    WaitForClick = true;
    
    if (DeathFrames == 120)
        Initialize = true;
    
    DeathFrames += 1;
}

draw_set_font(global.FontGameboy);
draw_rectangle_color(0, 128, 160, 144, TexC, TexC, TexC, TexC, false);
draw_set_halign(fa_right);
draw_text_color(156, 132, format_as_timer(Frame / 60), TexCLight, TexCLight, TexCLight, TexCLight, 1);
draw_set_halign(fa_left);
draw_text_color(4, 132, "Deck: " + string(max(0, ds_list_size(CardDeck) - 20)), TexCLight, TexCLight, TexCLight, TexCLight, 1);
draw_set_font(global.FontW97Black);

if (!WaitForClick && !Paused)
    Frame++;

AnimFrame++;
surface_reset_target();

enum UnknownEnum
{
    Value_4 = 4,
    Value_5
}
