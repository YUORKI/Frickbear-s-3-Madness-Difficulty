event_inherited();
Squish = 1;
TransitionSquish = 1;
var ShowMichael = has_been_good() && currently_good() && (global.Night > 3 || global.StartRoom == MinigameStartup) && global.Route != UnknownEnum.Value_1;
var ShowVanny = has_been_evil() && currently_evil() && (global.Night > 3 || global.StartRoom == MinigameStartup) && global.Route != UnknownEnum.Value_1;
var ShowTheBoss = global.Route == UnknownEnum.Value_1 && !global.CanContinue;

if (global.Route == UnknownEnum.Value_4 && !global.CanContinue)
{
    ShowMichael = true;
    ShowVanny = true;
    ShowTheBoss = true;
}

if (ImageIndex == 0 && !ShowVanny)
    instance_destroy();

if (ImageIndex == 1 && !ShowMichael)
    instance_destroy();

if (ImageIndex == 2 && !ShowTheBoss)
    instance_destroy();

if (global.FredbearMode)
    instance_destroy();

enum UnknownEnum
{
    Value_1 = 1,
    Value_4 = 4
}
