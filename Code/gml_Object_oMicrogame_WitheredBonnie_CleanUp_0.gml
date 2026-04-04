audio_bus_main.effects[0] = undefined;
audio_stop_sound(sfxStareStatic);

if (Head != undefined)
    instance_destroy(Head);

if (Torso != undefined)
    instance_destroy(Torso);

if (Arm != undefined)
    instance_destroy(Arm);

if (Legs != undefined)
    instance_destroy(Legs);

if (Wires != undefined)
    instance_destroy(Wires);
