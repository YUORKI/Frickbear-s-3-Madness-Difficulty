String = "";
Offset = 0;
OffsetSpeed = 0;
IntroOffset = -256;
Answer = "";
var Sum = (irandom_range(2, 9) * 10) + irandom_range(1, 9);
ValueA = irandom_range(11, Sum - 11);
ValueB = Sum - ValueA;

if (global.MicrogameLevel == 0)
{
    repeat (3)
        Answer += string(irandom_range(1, 9));
}

if (global.MicrogameLevel == 1)
{
    repeat (5)
        Answer += string(irandom_range(1, 9));
}

if (global.MicrogameLevel == 2)
    Answer += string(Sum);

with (instance_create_depth(0, 0, 0, oTextBox_Fredbear))
{
    add_page("", "");
    
    if (global.MicrogameLevel == 2)
        add_page(string("Enter: {0} + {1}", other.ValueA, other.ValueB), "");
    else
        add_page("Enter: " + string(other.Answer), "");
    
    Lock[TextPageNumber] = true;
    add_page("", "");
}

instance_create_depth(0, 0, 0, o3DMaze_CameraLocker);
global.MicrogameWin = false;

with (instance_create_depth(160, 160, 0, oInteraction_Animatronic))
{
    AnimatronicID = 47;
    Height = get_animatronic_height(47);
}
