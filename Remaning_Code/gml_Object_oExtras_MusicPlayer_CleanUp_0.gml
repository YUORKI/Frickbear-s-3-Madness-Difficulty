audio_sound_gain(MusicList[Selected].File, SavedGain, 0);
surface_free(OptionsSurf);

for (var i = 0; i < array_length(StreamedList); i++)
{
    if (audio_get_type(StreamedList[i]))
        audio_destroy_stream(StreamedList[i]);
}
