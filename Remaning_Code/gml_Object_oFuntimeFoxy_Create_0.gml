Initialize = true;
Showtime = 360;

function delay_showtime(arg0)
{
    Showtime += ((360 / ((arg0 + 10) / 4)) * random_range(0.75, 1.25));
    Showtime = clamp(round(Showtime / 15) * 15, 15, 405);
}
