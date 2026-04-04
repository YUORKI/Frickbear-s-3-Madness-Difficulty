VentX = 0;
VentY = -1;
Path = [];
array_push(Path, [VentX, VentY - 1], [VentX, VentY]);
Frame = 0;
Speed = 999;
YShiftPoint = irandom_range(-1, 1);

function VentSound(arg0)
{
    simple_sound(sfxVentRumble, 200 * VentX, (100 * VentY) - 100, false, (VentY * 0.1) + arg0);
}

VanishFrame = 0;
Vanishing = 0;

function set_wait_time()
{
    WaitTime = Speed * random_range(0.9, 1.1);
}

set_wait_time();

function destroy_crawler()
{
    if (Vanishing)
        exit;
    
    Vanishing = true;
    
    with (oSalvage)
    {
        audio_play_sound(sfxMetalImpact, 5, false, 0.75);
        lose_hp(1, true);
    }
}

Timer = 0;
