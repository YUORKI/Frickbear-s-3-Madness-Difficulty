Frame = 0;
global.Challenge = undefined;
global.ChallengeTitle = "None";
audio_stop_all();

for (var i = 0; i < 47; i += 1)
{
    var XValue = i % 10;
    var YValue = floor(i / 10);
    XValue *= 48;
    YValue *= 64;
    
    with (instance_create_depth(XValue, YValue, depth + 1, oCustomNightTile))
        TileID = i;
    
    if (!global.UnlockedAnimatronics[i])
        global.AILevels[i] = 0;
}

with (instance_create_depth(480, 0, depth - 1, oCustomNightSetButton))
{
    image_xscale = 5;
    ButtonVal = 0;
}

for (var i = 1; i < 5; i += 1)
{
    var XValue = 480 + (((i + 1) % 2) * 80);
    var YValue = floor((i + 1) / 2) * 32;
    
    with (instance_create_depth(XValue, YValue, depth - 1, oCustomNightSetButton))
    {
        image_xscale = 2.5;
        ButtonVal = i;
    }
}

with (instance_create_depth(480, 328, depth - 1, oCustomNightSetButton))
{
    image_xscale = 5;
    ButtonVal = 7;
}

CNChallenges = [["Rabbit Season", "Face off against every rabbit on the roster!"], ["Window Watchers", "Keep an eye on the office window - it seems to be particularly crowded tonight."], ["Era of '87", "All your friends from the new and improved Freddy Fazbear's Pizza are here!"], ["Ladies' Night", "Try not to catch their cooties."], ["Old Friends", "The veterans of Frickbear's 1 are back for thirds!"], ["New Friends", "The newcomers of Frickbear's 3 are dying to meet you! ...Or maybe you'll be dying to meet them."], ["Even a Bear!", "They put the bear in Frickbear's!"], ["The Second Coming", "The awkward middle children of Frickbear's 2 are here too!"], ["Blind Mode", "Try beating this with your eyes closed!"], ["Deafening", "Music Man has muted all the audio! Can you survive without sound cues?"], ["Watchful Eye", "You only have one monitor flip for the entire night! Power while using the camera drains a bit slower to compensate."], ["Gaming Hard?", "Your power and temperature aren't an issue - you just need to beat Toy Freddy's high scores! ALL of them."], ["Paddleball Panic", "Can you keep a rally going for two minutes straight?"], ["The General's Challenge", "1 life, 15 levels in a row. Are you up to it?"], ["Chipper's Revenge", "Buy Chipper's exorbitantly overpriced lumber before time runs out!"], ["Minute 2 Win It", "You have 60 seconds to deal with every animatronic listed here. Good luck! (Rewind Clock disabled)"], ["The LolzHax Shuffle", "LolzHax will summon 3 random characters each hour of the night. Adapt on the fly to survive! (Distortion Clock disabled)"], ["Demo Demons", "The maxmode of yesteryear."], ["Full Game Fiends", "The other half!"], ["A Bit of Everything", "Like the maxmode, but possible!"], ["The Frickbear Forty", "No guarantees this one's possible."], ["Infernal 47", "Seriously!? How!?"]];

for (var i = 0; i < array_length(CNChallenges); i += 1)
{
    var YValue = (i * 24) + 32;
    
    with (instance_create_depth(480, YValue, depth - 1, oCustomNightChallengeButton))
    {
        image_xscale = 4.5;
        image_yscale = 0.75;
        Text = other.CNChallenges[i][0];
        Desc = other.CNChallenges[i][1];
        BaseY = YValue;
        ChallengeID = i;
    }
}

var CheatNames = ["Enable Extra Characters", "Enable SP Characters", "Infinite Power", "Unlimited Items", "Freeze Temperature", "Jumpscare Immunity", "Cam Radar"];

for (var i = 0; i < array_length(CheatNames); i++)
{
    var YValue = 17 * i;
    
    with (instance_create_depth(490, 106 + YValue, depth - 1, oCustomNightCheatButton))
    {
        Text = CheatNames[i];
        CheatID = i;
    }
}

ChallengesOpen = false;
TransitionAlpha = 1;
ChallengesOffset = 0;
ChallengesDrag = false;
WindowY = 256;
play_music(musCustomNight);
draw_set_halign(fa_left);
SPRITE_FaceActive = skin_hybrid_sprite(sCustomNightFaces, "icon.png");
SPRITE_FaceInactive = skin_hybrid_sprite(sCustomNightFacesInactive, "icon_gray.png");
