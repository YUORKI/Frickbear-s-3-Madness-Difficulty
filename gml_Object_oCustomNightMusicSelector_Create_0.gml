TimeSetting = 0;
SettingsArray = [["Default", undefined], ["Custom A", musNightCustom1], ["Custom B", musNightCustom2], ["Custom C", musNightCustom3], ["Custom D", musNightCustom4], ["Custom E", musNightCustom5], ["Custom F", musNightCustom6], ["Night 1", musNight1], ["Night 2", musNight2], ["Night 3", musNight3], ["Night 4", musNight4], ["Night 5", musNight5]];

if (global.UnlockedAnimatronics[UnknownEnum.Value_61])
    array_push(SettingsArray, ["Night 6", musNight6]);

if (global.UnlockedAnimatronics[UnknownEnum.Value_49])
    array_push(SettingsArray, ["Salvage", mus_BossSalvage]);

if (global.UnlockedAnimatronics[UnknownEnum.Value_50])
    array_push(SettingsArray, ["Nightmare", mus_BossNightmare_Main]);

if (global.UnlockedAnimatronics[UnknownEnum.Value_55])
    array_push(SettingsArray, ["Fredbear", mus_BossFredbear]);

while (global.CustomNightMusic != SettingsArray[TimeSetting][1] && (TimeSetting + 1) < array_length(SettingsArray))
    TimeSetting++;

if (TimeSetting > array_length(SettingsArray))
    TimeSetting = 0;

Text = SettingsArray[TimeSetting][0];
global.CustomNightMusic = SettingsArray[TimeSetting][1];

enum UnknownEnum
{
    Value_49 = 49,
    Value_50,
    Value_55 = 55,
    Value_61 = 61
}
