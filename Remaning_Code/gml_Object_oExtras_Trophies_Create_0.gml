Timer = 0;
YOffset = 56;
Active = true;
TileSize = 0;
TrophyAmount = 48;
Trophies = array_create(TrophyAmount, 
{
    Name: "???",
    Desc: "???",
    Display: true,
    Icon: UnknownEnum.Value_0
});
TrophiesNum = count_up(global.UnlockedTrophies, true, 42);
ForbiddenTrophiesNum = count_up(global.UnlockedTrophies, true, 5, 42);
Trophies[UnknownEnum.Value_0] = 
{
    Desc: "Beat the game on Easy difficulty.",
    Display: true,
    Icon: UnknownEnum.Value_66
};
Trophies[UnknownEnum.Value_1] = 
{
    Desc: "Beat Fredsweeper in 15 seconds or less.",
    Display: true,
    Icon: UnknownEnum.Value_0
};
Trophies[UnknownEnum.Value_2] = 
{
    Desc: "Get a score of 30 or higher in Air Adventure.",
    Display: true,
    Icon: UnknownEnum.Value_14
};
Trophies[UnknownEnum.Value_3] = 
{
    Desc: "Get a combo of 150 or greater in Chomping With Chica.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_2],
    Icon: UnknownEnum.Value_2
};
Trophies[UnknownEnum.Value_4] = 
{
    Desc: "Get a score of 30 or higher in 30 seconds or less in Puppet Patrol.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_3],
    Icon: UnknownEnum.Value_16
};
Trophies[UnknownEnum.Value_5] = 
{
    Desc: "Beat Hare Pairs in 25 seconds or less.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_4],
    Icon: UnknownEnum.Value_1
};
Trophies[UnknownEnum.Value_6] = 
{
    Desc: "Get a score of 80 or higher in Pirate Plunder.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_5],
    Icon: UnknownEnum.Value_3
};
Trophies[UnknownEnum.Value_7] = 
{
    Desc: "Get a score of 128 or higher in Circus Sorter.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_6],
    Icon: UnknownEnum.Value_26
};
Trophies[UnknownEnum.Value_8] = 
{
    Desc: "Get a score of 50 or higher in Mangle Tangle Mania.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_8],
    Icon: UnknownEnum.Value_9
};
Trophies[UnknownEnum.Value_9] = 
{
    Desc: "Destroy the cupcake in Cupcake Clicker.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_9],
    Icon: UnknownEnum.Value_8
};
Trophies[UnknownEnum.Value_10] = 
{
    Desc: "Get a jackpot worth 40 tokens or more in Scott's Slots.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_10],
    Icon: UnknownEnum.Value_42
};
Trophies[UnknownEnum.Value_11] = 
{
    Desc: "Beat Golden Fredsweeper.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_7],
    Icon: UnknownEnum.Value_22
};
Trophies[UnknownEnum.Value_17] = 
{
    Desc: "Have a Snowcone, an AR Mask, and Laser Doors all active at the same time.",
    Display: false,
    Icon: UnknownEnum.Value_11
};
Trophies[UnknownEnum.Value_18] = 
{
    Desc: "Sell a Golden Cupcake for at least 40 tokens more than the amount you bought it for.",
    Display: true,
    Icon: UnknownEnum.Value_12
};
Trophies[UnknownEnum.Value_12] = 
{
    Desc: "End a night mid-jumpscare.",
    Display: true,
    Icon: UnknownEnum.Value_13
};
Trophies[UnknownEnum.Value_20] = 
{
    Desc: "Use a deathcoin on Funtime Chica.",
    Display: global.UnlockedAnimatronics[UnknownEnum.Value_47],
    Icon: UnknownEnum.Value_47
};
Trophies[UnknownEnum.Value_13] = 
{
    Desc: "Salvage a guest animatronic.",
    Display: false,
    Icon: UnknownEnum.Value_44
};
Trophies[UnknownEnum.Value_14] = 
{
    Desc: "Beat the game on Normal difficulty.",
    Display: true,
    Icon: UnknownEnum.Value_67
};
Trophies[UnknownEnum.Value_15] = 
{
    Desc: "Get the Slacker ending.",
    Display: true,
    Icon: UnknownEnum.Value_56
};
Trophies[UnknownEnum.Value_16] = 
{
    Desc: "Beat 5 custom night challenges without using any powerups.",
    Display: true,
    Icon: UnknownEnum.Value_57
};
Trophies[UnknownEnum.Value_19] = 
{
    Desc: "Buy the Pickles.",
    Display: false,
    Icon: UnknownEnum.Value_32
};
Trophies[UnknownEnum.Value_21] = 
{
    Desc: "Unlock every minigame.",
    Display: true,
    Icon: UnknownEnum.Value_6
};
Trophies[UnknownEnum.Value_22] = 
{
    Desc: "Earn $300 or more over the course of a run.",
    Display: true,
    Icon: UnknownEnum.Value_25
};
Trophies[UnknownEnum.Value_23] = 
{
    Desc: "Beat a run on Hard difficulty or higher without buying any upgrades (not counting Talbert's Files).",
    Display: global.UnlockedAnimatronics[UnknownEnum.Value_68],
    Icon: UnknownEnum.Value_40
};
Trophies[UnknownEnum.Value_24] = 
{
    Desc: "Finish a run in 20 minutes or less.",
    Display: global.UnlockedAnimatronics[UnknownEnum.Value_67],
    Icon: UnknownEnum.Value_41
};
Trophies[UnknownEnum.Value_25] = 
{
    Desc: "Salvage all 24 regular animatronics.",
    Display: true,
    Icon: UnknownEnum.Value_10
};
Trophies[UnknownEnum.Value_26] = 
{
    Desc: "Die to a single animatronic 10 times.",
    Display: true,
    Icon: UnknownEnum.Value_7
};
Trophies[UnknownEnum.Value_27] = 
{
    Desc: "Hear all of Upgrade Cadet's stories.",
    Display: true,
    Icon: UnknownEnum.Value_58
};
Trophies[UnknownEnum.Value_28] = 
{
    Desc: "Beat the game on Hard difficulty.",
    Display: true,
    Icon: UnknownEnum.Value_68
};
Trophies[UnknownEnum.Value_29] = 
{
    Desc: "Get the Evil ending.",
    Display: false,
    Icon: UnknownEnum.Value_62
};
Trophies[UnknownEnum.Value_30] = 
{
    Desc: "Get the Good ending.",
    Display: false,
    Icon: UnknownEnum.Value_63
};
Trophies[UnknownEnum.Value_31] = 
{
    Desc: "Get the Money ending.",
    Display: false,
    Icon: UnknownEnum.Value_61
};
Trophies[UnknownEnum.Value_32] = 
{
    Desc: "Clear 10 custom night challenges without the deathcoin.",
    Display: true,
    Icon: UnknownEnum.Value_33
};
Trophies[UnknownEnum.Value_39] = 
{
    Desc: "Beat a run with the maximum possible amount of animatronics salvaged.",
    Display: true,
    Icon: UnknownEnum.Value_24
};
Trophies[UnknownEnum.Value_33] = 
{
    Desc: "Unlock all 47 animatronics.",
    Display: true,
    Icon: UnknownEnum.Value_39
};
Trophies[UnknownEnum.Value_34] = 
{
    Desc: "Die to every character who can kill you at least once.",
    Display: true,
    Icon: UnknownEnum.Value_5
};
Trophies[UnknownEnum.Value_35] = 
{
    Desc: "Beat the game on Lunatic difficulty.",
    Display: global.UnlockedAnimatronics[UnknownEnum.Value_68],
    Icon: UnknownEnum.Value_69
};
Trophies[UnknownEnum.Value_36] = 
{
    Desc: "Get the Ultimate ending.",
    Display: false,
    Icon: UnknownEnum.Value_60
};
Trophies[UnknownEnum.Value_37] = 
{
    Desc: "Clear every custom night challenge.",
    Display: true,
    Icon: UnknownEnum.Value_4
};
Trophies[UnknownEnum.Value_38] = 
{
    Desc: "Clear every custom night challenge without the deathcoin.",
    Display: global.UnlockedTrophies[UnknownEnum.Value_37],
    Icon: UnknownEnum.Value_20
};
Trophies[UnknownEnum.Value_40] = 
{
    Desc: "Unlock every character in the extras menu's character gallery.",
    Display: true,
    Icon: UnknownEnum.Value_49
};
Trophies[UnknownEnum.Value_41] = 
{
    Desc: "Get every ending on Lunatic difficulty.",
    Display: global.UnlockedAnimatronics[UnknownEnum.Value_69] && global.UnlockedAnimatronics[UnknownEnum.Value_55],
    Icon: UnknownEnum.Value_50
};
Trophies[UnknownEnum.Value_42] = 
{
    Desc: "100% the game.",
    Display: false,
    Icon: UnknownEnum.Value_55
};
Trophies[UnknownEnum.Value_43] = 
{
    Desc: "Beat maxmode.",
    Display: false,
    Icon: UnknownEnum.Value_51
};
Trophies[UnknownEnum.Value_44] = 
{
    Desc: "Clear all 20 custom night challenges without using any powerups.",
    Display: false,
    Icon: UnknownEnum.Value_52
};
Trophies[UnknownEnum.Value_45] = 
{
    Desc: "Beat a run with 30 animatronics salvaged and zero upgrades (aside from Talbert's Files) purchased.",
    Display: false,
    Icon: UnknownEnum.Value_53
};
Trophies[UnknownEnum.Value_46] = 
{
    Desc: "Beat a run on Lunatic difficulty without dying once.",
    Display: false,
    Icon: UnknownEnum.Value_54
};
Trophies[UnknownEnum.Value_47] = 
{
    Desc: "Beat Madness Mode.",
    Display: false,
    Icon: UnknownEnum.Value_46
};

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
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_31,
    Value_32,
    Value_33,
    Value_34,
    Value_35,
    Value_36,
    Value_37,
    Value_38,
    Value_39,
    Value_40,
    Value_41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_46,
    Value_47,
    Value_49 = 49,
    Value_50,
    Value_51,
    Value_52,
    Value_53,
    Value_54,
    Value_55,
    Value_56,
    Value_57,
    Value_58,
    Value_60 = 60,
    Value_61,
    Value_62,
    Value_63,
    Value_66 = 66,
    Value_67,
    Value_68,
    Value_69
}
