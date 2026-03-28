Frame = 0;
EndscreenSprites = -1;

if (global.Route == UnknownEnum.Value_0)
    EndscreenSprites = import_sprites("SPOILERS/endscreens/slacker.png", sEndScreen, 1);

if (global.Route == UnknownEnum.Value_1)
    EndscreenSprites = import_sprites("SPOILERS/endscreens/money.png", sEndScreen_Money, 1);

if (global.Route == UnknownEnum.Value_2)
    EndscreenSprites = import_sprites("SPOILERS/endscreens/good.png", sEndScreen_Good, 1);

if (global.Route == UnknownEnum.Value_3)
    EndscreenSprites = import_sprites("SPOILERS/endscreens/evil.png", sEndscreen_Evil, 1);

if (global.Route == UnknownEnum.Value_4)
    instance_change(oUltimateEndscreen, true);

sprite_index = EndscreenSprites;

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4
}
