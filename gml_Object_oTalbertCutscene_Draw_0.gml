var i = array_length(PageTurn) - 1;

while (i >= CurrentPage)
{
    draw_page(i);
    PageTurn[i] += ((CurrentPage > i) - PageTurn[i]) / 8;
    i--;
}

for (i = 0; i < CurrentPage; i++)
{
    draw_page(i);
    PageTurn[i] += ((CurrentPage > i) - PageTurn[i]) / 8;
}

var Flip = input_check_pressed(UnknownEnum.Value_5) - input_check_pressed(UnknownEnum.Value_3);

if (Frame == 60)
    Flip = 1;
else if (Frame < 60)
    Flip = 0;

if (CurrentPage != array_length(PageTurn))
    CurrentPage += Flip;

CurrentPage = clamp(CurrentPage, 0, array_length(PageTurn));

if (Flip != 0 && CurrentPage != 0)
{
    if (CurrentPage == array_length(PageTurn))
        audio_play_sound(sfxBump, 10, false);
    else
        audio_play_sound(sfxPaperFlip, 10, false, 1, 0, 1.2);
}

if (Frame >= 0)
{
    if (CurrentPage != array_length(PageTurn))
    {
        Offset -= (Offset / 10);
    }
    else
    {
        Offset += (0.25 + (Offset / 2));
        
        if (Offset > 360)
        {
            instance_create_depth(0, 0, 0, oScaryFredbear);
            instance_destroy();
        }
    }
}

Frame++;

enum UnknownEnum
{
    Value_3 = 3,
    Value_5 = 5
}
