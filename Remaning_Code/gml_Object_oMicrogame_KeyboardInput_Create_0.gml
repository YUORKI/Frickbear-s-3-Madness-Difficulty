KeysList = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M", "Enter"];
KeyOffset = array_create(array_length(KeysList), 0);
String = "";
Offset = -360;
Answer = "BOOB";

switch (global.MicrogameLevel)
{
    case 0:
        Answer = choose("MIKE", "FOXY", "BEAR", "DAVE", "EVAN");
        break;
    
    case 1:
        Answer = choose("HENRY", "FRITZ", "CHICA", "AFTON", "SCARY");
        break;
    
    case 2:
        Answer = choose("VANESSA", "WILLIAM", "CASSIDY", "FAZBEAR", "CHARLIE");
        break;
}

with (instance_create_depth(0, 0, 0, oTextBox_Fredbear))
{
    add_page("", "");
    add_page("Type: " + string(other.Answer), "");
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
