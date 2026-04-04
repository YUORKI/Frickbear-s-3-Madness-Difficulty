function get_trophy(arg0)
{
    if (global.UnlockedTrophies[arg0])
        exit;
    
    global.UnlockedTrophies[arg0] = true;
    array_push(global.TrophyQueue, 
    {
        _x: 640,
        _y: 360 - (56 * (array_length(global.TrophyQueue) + 1)),
        TrophyID: arg0,
        Name: get_trophy_name(arg0),
        Timer: 0
    });
}

function check_for_unlock_trophies()
{
    var GetFullUnlockTrophy = true;
    var Get47Trophy = true;
    var Get24Trophy = true;
    var GetMinigameTrophy = true;
    
    for (var i = 0; i <= UnknownEnum.Value_69; i++)
    {
        if (!global.UnlockedAnimatronics[i])
        {
            if (i <= UnknownEnum.Value_39 && !array_contains([UnknownEnum.Value_20, UnknownEnum.Value_33, UnknownEnum.Value_35, UnknownEnum.Value_34, UnknownEnum.Value_26, UnknownEnum.Value_27, UnknownEnum.Value_28, UnknownEnum.Value_29, UnknownEnum.Value_25, UnknownEnum.Value_39], i))
                Get24Trophy = false;
            
            if (i <= UnknownEnum.Value_46)
                Get47Trophy = false;
            
            GetFullUnlockTrophy = false;
        }
    }
    
    for (var i = 0; i <= UnknownEnum.Value_10; i++)
    {
        if (!global.UnlockedMinigames[i] && i != UnknownEnum.Value_7)
            GetMinigameTrophy = false;
    }
    
    if (GetMinigameTrophy)
    {
        get_trophy(UnknownEnum.Value_21);
        global.UnlockedMinigames[UnknownEnum.Value_7] = true;
    }
    
    if (GetFullUnlockTrophy)
        get_trophy(UnknownEnum.Value_40);
    
    if (Get47Trophy)
        get_trophy(UnknownEnum.Value_33);
    
    if (Get24Trophy)
        get_trophy(UnknownEnum.Value_25);
}

function get_trophy_name(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            return "Jeremy's For You and Me";
        
        case UnknownEnum.Value_1:
            return "A One to the Left, and a Three to the Right";
        
        case UnknownEnum.Value_2:
            return "Cloud Cruiser";
        
        case UnknownEnum.Value_3:
            return "That Much Pizza Can't Possibly Be Healthy";
        
        case UnknownEnum.Value_4:
            return "Peoplewatching";
        
        case UnknownEnum.Value_5:
            return "Consider Your Hares Paired";
        
        case UnknownEnum.Value_6:
            return "Coming For Your Booty";
        
        case UnknownEnum.Value_7:
            return "The Incredible Virtual Circus";
        
        case UnknownEnum.Value_8:
            return "Twist & Tangle";
        
        case UnknownEnum.Value_9:
            return "I'M SO HUNGRY!!";
        
        case UnknownEnum.Value_10:
            return "Keep Gambling";
        
        case UnknownEnum.Value_11:
            return "It'll Clear Out Several";
        
        case UnknownEnum.Value_17:
            return "Better Safe Than Sorry";
        
        case UnknownEnum.Value_18:
            return "Money Moves";
        
        case UnknownEnum.Value_12:
            return "FIVE FIFTY-NINE!?";
        
        case UnknownEnum.Value_20:
            return "Think Fast, Chucklenuts";
        
        case UnknownEnum.Value_13:
            return "Backdoor Dealings";
        
        case UnknownEnum.Value_14:
            return "We Like Mike";
        
        case UnknownEnum.Value_15:
            return "See You Next Week!";
        
        case UnknownEnum.Value_16:
            return "Pffft, I'm Broke!";
        
        case UnknownEnum.Value_19:
            return "True Happiness Achieved";
        
        case UnknownEnum.Value_21:
            return "Gamer Extraordinaire";
        
        case UnknownEnum.Value_22:
            return "Zillion-Dollar Coffin";
        
        case UnknownEnum.Value_23:
            return "Bear Necessities";
        
        case UnknownEnum.Value_24:
            return "You Know If You Beat It Even Faster You Get to See Freddy in a Bikini";
        
        case UnknownEnum.Value_25:
            return "Something Borrowed";
        
        case UnknownEnum.Value_26:
            return "Long Time No See!";
        
        case UnknownEnum.Value_27:
            return "Lorekeeper";
        
        case UnknownEnum.Value_28:
            return "Vanessa? I Barely Know Ya!";
        
        case UnknownEnum.Value_29:
            return "Ashes to Ashes";
        
        case UnknownEnum.Value_30:
            return "Put Back Together";
        
        case UnknownEnum.Value_31:
            return "Employee of the Month";
        
        case UnknownEnum.Value_32:
            return "Pacifist Run";
        
        case UnknownEnum.Value_39:
            return "Maximalist";
        
        case UnknownEnum.Value_33:
            return "Now It's a Party";
        
        case UnknownEnum.Value_34:
            return "World of Jumpscares";
        
        case UnknownEnum.Value_35:
            return "On the Fritz";
        
        case UnknownEnum.Value_36:
            return "The End";
        
        case UnknownEnum.Value_37:
            return "Gold Star";
        
        case UnknownEnum.Value_38:
            return "Platinum Star";
        
        case UnknownEnum.Value_40:
            return "These Truly Were Five Nights at Frickbear's";
        
        case UnknownEnum.Value_41:
            return "Into Madness";
        
        case UnknownEnum.Value_42:
            return "Too Much to Bear";
        
        case UnknownEnum.Value_43:
            return "Infernal 47";
        
        case UnknownEnum.Value_44:
            return "NPU";
        
        case UnknownEnum.Value_45:
            return "Naked and Afraid";
        
        case UnknownEnum.Value_46:
            return "Unkillable";
        
        default:
            return "No Trophy Title Found :(";
    }
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
    Value_41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_46,
    Value_69 = 69
}
