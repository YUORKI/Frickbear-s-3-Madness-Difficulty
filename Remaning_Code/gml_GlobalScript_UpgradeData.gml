function get_upgrades(arg0 = -1)
{
    var Upgrades = [];
    Upgrades[UnknownEnum.Value_0] = 
    {
        Name: "Overcharge",
        Desc: "Start each night with an extra 10% power.",
        StepUp: [UnknownEnum.Value_1, UnknownEnum.Value_2],
        StepDown: [],
        Price: 18
    };
    Upgrades[UnknownEnum.Value_1] = 
    {
        Name: "Overcharge+",
        Desc: "Start each night with an extra 25% power.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_0],
        Price: 30
    };
    Upgrades[UnknownEnum.Value_2] = 
    {
        Name: "Power Hour",
        Desc: "You have unlimited power for the first hour of the night. Replaces Overcharge.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_0],
        Price: 36
    };
    Upgrades[UnknownEnum.Value_3] = 
    {
        Name: "Mini Multiplier",
        Desc: "Minigames give 1.25x as many tokens.",
        StepUp: [UnknownEnum.Value_4],
        StepDown: [],
        Price: 25
    };
    Upgrades[UnknownEnum.Value_4] = 
    {
        Name: "Mini Multiplier+",
        Desc: "Minigames give 1.5x as many tokens.",
        StepUp: [UnknownEnum.Value_5],
        StepDown: [UnknownEnum.Value_3],
        Price: 36
    };
    Upgrades[UnknownEnum.Value_5] = 
    {
        Name: "Mini Multiplier++",
        Desc: "Minigames give 2x as many tokens.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_4],
        Price: 60
    };
    Upgrades[UnknownEnum.Value_6] = 
    {
        Name: "Employee Discount",
        Desc: "Items from Mendo's shop are 10% cheaper.",
        StepUp: [UnknownEnum.Value_7],
        StepDown: [],
        Price: 21
    };
    Upgrades[UnknownEnum.Value_7] = 
    {
        Name: "Employee Discount+",
        Desc: "Items from Mendo's shop are 25% cheaper.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_6],
        Price: 36
    };
    Upgrades[UnknownEnum.Value_8] = 
    {
        Name: "Backdoor Trading",
        Desc: "All salvage locations will have one additional animatronic to pick from.",
        StepUp: [UnknownEnum.Value_9],
        StepDown: [],
        Price: 8
    };
    Upgrades[UnknownEnum.Value_9] = 
    {
        Name: "Backdoor Trading+",
        Desc: "All salvage locations will have two additional animatronics to pick from.",
        StepUp: [UnknownEnum.Value_10],
        StepDown: [UnknownEnum.Value_8],
        Price: 10
    };
    Upgrades[UnknownEnum.Value_10] = 
    {
        Name: "Backdoor Trading++",
        Desc: "All salvage locations will have three additional animatronics to pick from.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_9],
        Price: 12
    };
    Upgrades[UnknownEnum.Value_11] = 
    {
        Name: "Cam Radar",
        Desc: "Camera buttons will indicate which rooms are occupied.",
        StepUp: [UnknownEnum.Value_12],
        StepDown: [],
        Price: 18
    };
    Upgrades[UnknownEnum.Value_12] = 
    {
        Name: "Cam Radar+",
        Desc: "Camera buttons will indicate where specific animatronics are in the building.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_11],
        Price: 55
    };
    Upgrades[UnknownEnum.Value_13] = 
    {
        Name: "Superfan",
        Desc: "The fan cools down the office faster.",
        StepUp: [UnknownEnum.Value_14],
        StepDown: [],
        Price: 16
    };
    Upgrades[UnknownEnum.Value_14] = 
    {
        Name: "Superfan+",
        Desc: "The fan cools down the office significantly faster.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_13],
        Price: 20
    };
    Upgrades[UnknownEnum.Value_15] = 
    {
        Name: "Head Start",
        Desc: "Animatronics will not activate until 15 seconds into the night.",
        StepUp: [UnknownEnum.Value_16, UnknownEnum.Value_17],
        StepDown: [],
        Price: 30
    };
    Upgrades[UnknownEnum.Value_16] = 
    {
        Name: "Head Start+",
        Desc: "Animatronics will not activate until 30 seconds into the night.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_15],
        Price: 36
    };
    Upgrades[UnknownEnum.Value_17] = 
    {
        Name: "Late Start",
        Desc: "Start the night at 12:30 AM. Replaces Head Start.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_15],
        Price: 32
    };
    Upgrades[UnknownEnum.Value_18] = 
    {
        Name: "Overstock",
        Desc: "Every item in Mendo's shop has 1 additional stock.",
        StepUp: [UnknownEnum.Value_19],
        StepDown: [],
        Price: 45
    };
    Upgrades[UnknownEnum.Value_19] = 
    {
        Name: "Overstock+",
        Desc: "Every item in Mendo's shop has 2 additional stock.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_18],
        Price: 60
    };
    Upgrades[UnknownEnum.Value_20] = 
    {
        Name: "Early Investment",
        Desc: "Start each night with 5 tokens.",
        StepUp: [UnknownEnum.Value_21],
        StepDown: [],
        Price: 10
    };
    Upgrades[UnknownEnum.Value_21] = 
    {
        Name: "Early Investment+",
        Desc: "Start each night with 15 tokens.",
        StepUp: [UnknownEnum.Value_22, UnknownEnum.Value_23],
        StepDown: [UnknownEnum.Value_20],
        Price: 20
    };
    Upgrades[UnknownEnum.Value_22] = 
    {
        Name: "Early Investment++",
        Desc: "Start each night with 30 tokens.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_21],
        Price: 30
    };
    Upgrades[UnknownEnum.Value_23] = 
    {
        Name: "Tasty Investment",
        Desc: "Start the night with a Golden Cupcake. Replaces Early Investment+.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_21],
        Price: 25
    };
    Upgrades[UnknownEnum.Value_24] = 
    {
        Name: "Felix's Loan",
        Desc: "You can go up to 15 tokens into debt, but will be jumpscared if you end the night with a negative token balance.",
        StepUp: [UnknownEnum.Value_25],
        StepDown: [],
        Price: 10
    };
    Upgrades[UnknownEnum.Value_25] = 
    {
        Name: "Felix's Loan+",
        Desc: "You can go up to 30 tokens into debt, but will be jumpscared if you end the night with a negative token balance.",
        StepUp: [UnknownEnum.Value_26],
        StepDown: [UnknownEnum.Value_24],
        Price: 20
    };
    Upgrades[UnknownEnum.Value_26] = 
    {
        Name: "Felix's Loan++",
        Desc: "You can go into unlimited debt, but will be jumpscared if you end the night with a negative token balance.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_25],
        Price: 30
    };
    Upgrades[UnknownEnum.Value_27] = 
    {
        Name: "Mangle Cartridge",
        Desc: "Lets you play Mangle Tangle Mania from the Games menu.",
        StepUp: [],
        StepDown: [],
        Price: 10
    };
    Upgrades[UnknownEnum.Value_28] = 
    {
        Name: "Cupcake Cartridge",
        Desc: "Lets you play Cupcake Clicker from the Games menu.",
        StepUp: [],
        StepDown: [],
        Price: 20
    };
    Upgrades[UnknownEnum.Value_29] = 
    {
        Name: "Animdude Cartridge",
        Desc: "Lets you play Scott's Slots from the Games menu.",
        StepUp: [],
        StepDown: [],
        Price: 15
    };
    Upgrades[UnknownEnum.Value_30] = 
    {
        Name: "Fuzzy Dice",
        Desc: "Initial rerolls at Upgrade Cadet's shop are free.",
        StepUp: [UnknownEnum.Value_31],
        StepDown: [],
        Price: 5
    };
    Upgrades[UnknownEnum.Value_31] = 
    {
        Name: "Upgrade Commander",
        Desc: "Upgrade Cadet's entire inventory is available from the start, but rerolls are no longer an option. Replaces Fuzzy Dice.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_30],
        Price: 10
    };
    Upgrades[UnknownEnum.Value_32] = 
    {
        Name: "Power AC",
        Desc: "The office temperature can go below zero.",
        StepUp: [UnknownEnum.Value_33],
        StepDown: [],
        Price: 15
    };
    Upgrades[UnknownEnum.Value_33] = 
    {
        Name: "Power AC+",
        Desc: "The office temperature can go twice as far below zero.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_32],
        Price: 20
    };
    Upgrades[UnknownEnum.Value_34] = 
    {
        Name: "Bear Change",
        Desc: "Blocked animatronics grant 1.5x as many tokens.",
        StepUp: [UnknownEnum.Value_35],
        StepDown: [],
        Price: 24
    };
    Upgrades[UnknownEnum.Value_35] = 
    {
        Name: "Bear Change+",
        Desc: "Blocked animatronics grant 2x as many tokens.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_34],
        Price: 32
    };
    Upgrades[UnknownEnum.Value_36] = 
    {
        Name: "All Ears",
        Desc: "The mask no longer muffles your hearing.",
        StepUp: [UnknownEnum.Value_37],
        StepDown: [],
        Price: 18
    };
    Upgrades[UnknownEnum.Value_37] = 
    {
        Name: "Cool Glasses",
        Desc: "The mask is replaced with some cool glasses, which are easier to see through. Replaces All Ears.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_36],
        Price: 20
    };
    Upgrades[UnknownEnum.Value_38] = 
    {
        Name: "Retina Burner",
        Desc: "The flashlight is more effective and has a bigger radius.",
        StepUp: [UnknownEnum.Value_39],
        StepDown: [],
        Price: 27
    };
    Upgrades[UnknownEnum.Value_39] = 
    {
        Name: "Retina Burner+",
        Desc: "The flashlight is even more effective and has an even bigger radius.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_38],
        Price: 33
    };
    Upgrades[UnknownEnum.Value_40] = 
    {
        Name: "Spawnkiller",
        Desc: "Start each night with a deathcoin.",
        StepUp: [],
        StepDown: [],
        Price: 66
    };
    Upgrades[UnknownEnum.Value_41] = 
    {
        Name: "Talbert's Files",
        Desc: "Effect unknown. (WARNING: Purchasing this item may lead you down a dangerous path.)",
        StepUp: [],
        StepDown: [],
        Price: 80
    };
    
    if (arg0 == -1)
        return Upgrades;
    else
        return Upgrades[arg0];
}

function get_upgrade_desc(arg0)
{
    switch (arg0)
    {
        default:
            return "You aren't supposed to have this.";
            break;
    }
}

function get_upgrade_icon(arg0)
{
    return 0;
}

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
    Value_41
}
