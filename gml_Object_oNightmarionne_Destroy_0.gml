if (Head != undefined)
{
    instance_destroy(Head);
    instance_destroy(Torso);
    instance_destroy(ArmL);
    instance_destroy(ArmR);
    instance_destroy(HandL);
    instance_destroy(HandR);
}

audio_stop_sound(sfxNightmarionneGarble);
