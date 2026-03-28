WindowOffset = -360;
StatsMenu = 0;
StatSurf = -1;

function completion(arg0, arg1)
{
    return string("{0}/{1} ({2}%)", arg0, arg1, floor((100 * arg0) / arg1));
}

function get_stats(arg0)
{
    StatsArray = [];
    MenuScroll = 0;
    BarHeld = false;
    
    switch (arg0)
    {
        case 0:
            var TotalRuns = 0;
            
            for (var i = 0; i < array_length(global.ClearedEndings); i++)
            {
                for (var j = 0; j < array_length(global.ClearedEndings[i]); j++)
                    TotalRuns += global.ClearedEndings[i][j];
            }
            
            var EndingsSeen = global.UnlockedTrophies[UnknownEnum.Value_30] + global.UnlockedTrophies[UnknownEnum.Value_29] + global.UnlockedTrophies[UnknownEnum.Value_31] + global.UnlockedTrophies[UnknownEnum.Value_15] + global.UnlockedTrophies[UnknownEnum.Value_36];
            var Collections = 
            {
                _Endings: EndingsSeen,
                _Animatronics: count_up(global.UnlockedAnimatronics, true, 47),
                _GalleryPages: count_up(global.UnlockedAnimatronics, true, 70),
                _Minigames: count_up(global.UnlockedMinigames, true, 11),
                _Upgrades: count_up(global.UpgradeRecord, true, 42),
                _Trophies: count_up(global.UnlockedTrophies, true, 42),
                _CNChallenges: count_up(global.ClearedChallenges, true, 20)
            };
            var Totals = 
            {
                _Endings: (EndingsSeen < 4) ? 4 : 5,
                _Animatronics: 47,
                _GalleryPages: 70,
                _Minigames: 11,
                _Upgrades: 42,
                _Trophies: 42,
                _CNChallenges: 20
            };
            var Completions = 
            {
                _Endings: Collections._Endings / Totals._Endings,
                _Animatronics: Collections._Animatronics / Totals._Animatronics,
                _GalleryPages: Collections._GalleryPages / Totals._GalleryPages,
                _Minigames: Collections._Minigames / Totals._Minigames,
                _Upgrades: Collections._Upgrades / Totals._Upgrades,
                _Trophies: Collections._Trophies / Totals._Trophies,
                _CNChallenges: Collections._CNChallenges / Totals._CNChallenges
            };
            var OverallCompletion = 0;
            OverallCompletion += (Completions._Endings * 50);
            OverallCompletion += (Completions._Animatronics * 10);
            OverallCompletion += (Completions._GalleryPages * 10);
            OverallCompletion += (Completions._Minigames * 10);
            OverallCompletion += (Completions._Trophies * 10);
            OverallCompletion += (Completions._CNChallenges * 10);
            OverallCompletion = floor(OverallCompletion);
            var RecordHolder = 0;
            var Tie = false;
            
            for (var i = 1; i < array_length(global.DeathRecord); i++)
            {
                if (global.DeathRecord[i] > global.DeathRecord[RecordHolder])
                {
                    RecordHolder = i;
                    Tie = false;
                }
                else if (global.DeathRecord[i] == global.DeathRecord[RecordHolder])
                {
                    Tie = true;
                }
            }
            
            var MostLethal = Tie ? "---" : string("{0} - {1} {2}", global.Descriptions[RecordHolder][0], global.DeathRecord[RecordHolder], (global.DeathRecord[RecordHolder] == 1) ? "Death" : "Deaths");
            RecordHolder = 0;
            Tie = false;
            
            for (var i = 1; i < array_length(global.SalvageRecord); i++)
            {
                if (global.SalvageRecord[i] > global.SalvageRecord[RecordHolder])
                {
                    RecordHolder = i;
                    Tie = false;
                }
                else if (global.SalvageRecord[i] == global.SalvageRecord[RecordHolder])
                {
                    Tie = true;
                }
            }
            
            var MostSalvaged = Tie ? "---" : string("{0} - Salvaged {1} {2}", global.Descriptions[RecordHolder][0], global.SalvageRecord[RecordHolder], (global.SalvageRecord[RecordHolder] == 1) ? "Time" : "Times");
            var MinigameNames = ["Fredsweeper", "Air Adventure", "Chomping With Chica", "Puppet Patrol", "Hare Pairs", "Pirate Plunder", "Circus Sorter", "Golden Fredsweeper", "Mangle Tangle Mania", "Cupcake Clicker", "Scott's Slots"];
            RecordHolder = 0;
            Tie = false;
            
            for (var i = 1; i < array_length(global.TokensPerMinigame); i++)
            {
                if (global.TokensPerMinigame[i] > global.TokensPerMinigame[RecordHolder])
                {
                    RecordHolder = i;
                    Tie = false;
                }
                else if (global.TokensPerMinigame[i] == global.TokensPerMinigame[RecordHolder])
                {
                    Tie = true;
                }
            }
            
            var MostPlayed = Tie ? "---" : string("{0} - {1} {2} Earned", MinigameNames[RecordHolder], global.TokensPerMinigame[RecordHolder], (global.TokensPerMinigame[RecordHolder] == 1) ? "Token" : "Tokens");
            RecordHolder = 0;
            Tie = false;
            
            for (var i = 1; i < array_length(global.UpgradeRecord); i++)
            {
                if (global.UpgradeRecord[i] > global.UpgradeRecord[RecordHolder])
                {
                    RecordHolder = i;
                    Tie = false;
                }
                else if (global.UpgradeRecord[i] == global.UpgradeRecord[RecordHolder])
                {
                    Tie = true;
                }
            }
            
            var MostBought = Tie ? "---" : string("{0} - Purchased {1} {2}", get_upgrades(RecordHolder).Name, global.UpgradeRecord[RecordHolder], (global.UpgradeRecord[RecordHolder] == 1) ? "Time" : "Times");
            RecordHolder = 0;
            Tie = false;
            
            for (var i = 1; i < array_length(global.ClearedEndings); i++)
            {
                if (count_up(global.ClearedEndings[i]) > count_up(global.ClearedEndings[RecordHolder]))
                {
                    RecordHolder = i;
                    Tie = false;
                }
                else if (count_up(global.ClearedEndings[i]) == count_up(global.ClearedEndings[RecordHolder]))
                {
                    Tie = true;
                }
            }
            
            var MostPlayedGuard = Tie ? "---" : string("{0} - {1} {2} Completed", global.Descriptions[RecordHolder + UnknownEnum.Value_66][0], count_up(global.ClearedEndings[RecordHolder]), (global.ClearedEndings[RecordHolder] == 1) ? "Run" : "Runs");
            StatsArray = [["Playtime", string(format_as_timer(global.Playtime))], ["Game First Opened", global.GameFirstOpened], ["Deaths", string(count_up(global.DeathRecord))], ["Playthroughs Completed", string(TotalRuns)], ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", " "], ["Deadliest Animatronic", MostLethal], ["Favorite Animatronic", MostSalvaged], ["Favorite Minigame", MostPlayed], ["Favorite Upgrade", MostBought], ["Favorite Guard", MostPlayedGuard], ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", " "], ["Fastest Completion", format_as_timer(global.RunSpeedBest, false)], ["Biggest Paycheck", "$" + string_format(global.RunEarningsBest, 1, 2)], ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", " "], global.UnlockedMinigames[UnknownEnum.Value_0] ? ["Hi-Score: Fredsweeper", string("{0}", format_as_timer(global.HiScoresOverall[UnknownEnum.Value_0], true))] : ["Hi-Score: ???", "---"], global.UnlockedMinigames[UnknownEnum.Value_1] ? ["Hi-Score: Air Adventure", string("{0}", global.HiScoresOverall[UnknownEnum.Value_1])] : ["Hi-Score: ???", "---"], global.UnlockedMinigames[UnknownEnum.Value_2] ? ["Hi-Score: Chomping With Chica", string("{0}", global.HiScoresOverall[UnknownEnum.Value_2])] : ["Hi-Score: ???", "---"], global.UnlockedMinigames[UnknownEnum.Value_3] ? ["Hi-Score: Puppet Patrol", string("{0}", global.HiScoresOverall[UnknownEnum.Value_3])] : ["Hi-Score: ???", "---"], global.UnlockedMinigames[UnknownEnum.Value_4] ? ["Hi-Score: Hare Pairs", string("{0}", format_as_timer(global.HiScoresOverall[UnknownEnum.Value_4], true))] : ["Hi-Score: ???", "---"], global.UnlockedMinigames[UnknownEnum.Value_5] ? ["Hi-Score: Pirate Plunder", string("{0}", global.HiScoresOverall[UnknownEnum.Value_5])] : ["Hi-Score: ???", "---"], global.UnlockedMinigames[UnknownEnum.Value_6] ? ["Hi-Score: Circus Sorter", string("{0}", global.HiScoresOverall[UnknownEnum.Value_6])] : ["Hi-Score: ???", "---"], global.UnlockedMinigames[UnknownEnum.Value_7] ? ["Hi-Score: Golden Fredsweeper", string("{0}", format_as_timer(global.HiScoresOverall[UnknownEnum.Value_7], true))] : ["Hi-Score: ???", "---"], global.UnlockedMinigames[UnknownEnum.Value_8] ? ["Hi-Score: Mangle Tangle Mania", string("{0}", global.HiScoresOverall[UnknownEnum.Value_8])] : ["Hi-Score: ???", "---"], global.UnlockedMinigames[UnknownEnum.Value_9] ? ["Hi-Score: Cupcake Clicker", string("{0}", global.HiScoresOverall[UnknownEnum.Value_9])] : ["Hi-Score: ???", "---"], global.UnlockedMinigames[UnknownEnum.Value_10] ? ["Hi-Score: Scott's Slots", string("{0}", global.HiScoresOverall[UnknownEnum.Value_10])] : ["Hi-Score: ???", "---"], ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", " "], ["Endings Seen", completion(Collections._Endings, Totals._Endings)], ["Animatronics Found", completion(Collections._Animatronics, Totals._Animatronics)], ["Minigames Unlocked", completion(Collections._Minigames, Totals._Minigames)], ["Gallery Entries Unlocked", completion(Collections._GalleryPages, Totals._GalleryPages)], ["Trophies Collected", completion(Collections._Trophies, Totals._Trophies)], ["Custom Night Challenges Beaten", completion(Collections._CNChallenges, Totals._CNChallenges)], ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", " "], ["Total Completion", string("{0}%", OverallCompletion)]];
            
            if (OverallCompletion >= 100)
                get_trophy(UnknownEnum.Value_42);
            
            TextHeight = (array_length(StatsArray) * 14) + 8;
            break;
        
        case 1:
            MaxValue = 1;
            
            for (var i = 0; i <= UnknownEnum.Value_55; i++)
            {
                var CharValue = i;
                var KillValue = global.DeathRecord[i];
                
                if (is_nonlethal(i) && i != UnknownEnum.Value_19)
                    continue;
                
                if (CharValue == UnknownEnum.Value_19)
                    CharValue = UnknownEnum.Value_56;
                
                if (i == UnknownEnum.Value_27)
                    KillValue += global.DeathRecord[UnknownEnum.Value_30];
                
                if (KillValue > MaxValue)
                    MaxValue = KillValue;
                
                array_push(StatsArray, 
                {
                    CharID: CharValue,
                    Kills: KillValue,
                    Hide: KillValue == 0 && !global.UnlockedAnimatronics[i]
                });
            }
            
            array_sort(StatsArray, function(arg0, arg1)
            {
                return ((arg0.Hide - arg1.Hide) * 1000) + ((arg1.Kills - arg0.Kills) * 100) + (arg0.CharID - arg1.CharID);
            });
            TextHeight = array_length(StatsArray) * 48;
            break;
        
        case 2:
            MaxValue = 1;
            
            for (var i = 0; i < array_length(global.SalvageRecord); i++)
            {
                var CharValue = i;
                
                if (array_contains([UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_16, UnknownEnum.Value_14], CharValue))
                    continue;
                
                var Value = global.SalvageRecord[i];
                
                if (Value > MaxValue)
                    MaxValue = Value;
                
                array_push(StatsArray, 
                {
                    CharID: CharValue,
                    Salvages: Value,
                    Hide: Value == 0 && !global.UnlockedAnimatronics[i]
                });
            }
            
            array_sort(StatsArray, function(arg0, arg1)
            {
                return ((arg0.Hide - arg1.Hide) * 1000) + ((arg1.Salvages - arg0.Salvages) * 100) + (arg0.CharID - arg1.CharID);
            });
            TextHeight = array_length(StatsArray) * 48;
            break;
        
        case 3:
            var MinigameNames = ["Fredsweeper", "Air Adventure", "Chomping With Chica", "Puppet Patrol", "Hare Pairs", "Pirate Plunder", "Circus Sorter", "Golden Fredsweeper", "Mangle Tangle Mania", "Cupcake Clicker", "Scott's Slots"];
            MaxValue = 1;
            
            for (var i = 0; i < 11; i++)
            {
                var CharValue = i;
                var Value = global.TokensPerMinigame[i];
                
                if (Value > MaxValue)
                    MaxValue = Value;
                
                array_push(StatsArray, 
                {
                    CharID: i,
                    Name: MinigameNames[i],
                    Tokens: Value,
                    Hide: Value == 0 && !global.UnlockedMinigames[i]
                });
            }
            
            array_sort(StatsArray, function(arg0, arg1)
            {
                return ((arg0.Hide - arg1.Hide) * 1000) + ((arg1.Tokens - arg0.Tokens) * 100) + (arg0.CharID - arg1.CharID);
            });
            TextHeight = array_length(StatsArray) * 32;
            break;
        
        case 4:
            var Upgrades = get_upgrades();
            MaxValue = 1;
            
            for (var i = 0; i <= UnknownEnum.Value_41; i++)
            {
                var CharValue = i;
                var Value = global.UpgradeRecord[i];
                
                if (Value > MaxValue)
                    MaxValue = Value;
                
                array_push(StatsArray, 
                {
                    CharID: i,
                    Name: Upgrades[i].Name,
                    Tokens: Value,
                    Hide: Value == 0
                });
            }
            
            array_sort(StatsArray, function(arg0, arg1)
            {
                return ((arg0.Hide - arg1.Hide) * 1000) + ((arg1.Tokens - arg0.Tokens) * 100) + (arg0.CharID - arg1.CharID);
            });
            TextHeight = array_length(StatsArray) * 32;
            break;
        
        case 5:
            var DifficultyNames = ["Easy", "Normal", "Hard", global.UnlockedAnimatronics[UnknownEnum.Value_68] ? "Lunatic" , "Madness" : ""];
            var EndingCompletions = array_create(array_length(global.ClearedEndings[1]), 0);
            array_push(StatsArray, ["", "Slacker", "Money", "Good", "Evil", "Ultimate", "Total"]);
            array_push(StatsArray, ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"]);
            
            for (var i = 0; i < array_length(global.ClearedEndings); i++)
            {
                array_push(StatsArray, [DifficultyNames[i], global.ClearedEndings[i][0], global.ClearedEndings[i][1], global.ClearedEndings[i][2], global.ClearedEndings[i][3], global.ClearedEndings[i][4], count_up(global.ClearedEndings[i], false)]);
                
                for (var j = 0; j < array_length(EndingCompletions); j++)
                    EndingCompletions[j] += global.ClearedEndings[i][j];
            }
            
            array_push(StatsArray, ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"]);
            array_push(StatsArray, ["Total", EndingCompletions[0], EndingCompletions[1], EndingCompletions[2], EndingCompletions[3], EndingCompletions[4], count_up(EndingCompletions, false)]);
            TextHeight = (array_length(StatsArray) * 14) + 8;
            break;
    }
}

get_stats(StatsMenu);
MenuScroll = 0;
BarHeld = false;
Active = true;

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_14 = 14,
    Value_15,
    Value_16,
    Value_19 = 19,
    Value_27 = 27,
    Value_29 = 29,
    Value_30,
    Value_31,
    Value_36 = 36,
    Value_41 = 41,
    Value_42,
    Value_55 = 55,
    Value_56,
    Value_66 = 66,
    Value_68 = 68
}
