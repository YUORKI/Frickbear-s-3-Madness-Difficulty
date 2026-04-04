TransitionAmount += ((Transitioning - TransitionAmount) / 5);
TransitionFrame++;

if (TransitionFrame == 60)
{
    room_goto((room == Extras) ? Credits : Extras);
    Transitioning = false;
}

if (room == Extras && TransitionFrame > 70)
{
    instance_destroy();
    audio_stop_sound(musCredits);
}

if (room == Credits && input_check_pressed(UnknownEnum.Value_1) && !Transitioning)
    transition_out_of_credits();

enum UnknownEnum
{
    Value_1 = 1
}
