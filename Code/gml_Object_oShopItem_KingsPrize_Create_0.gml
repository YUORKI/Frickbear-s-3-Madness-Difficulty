event_inherited();
Frame = 0;
SlotSpeed = 60;
CurrentImage = 0;
var Killables = [];
var Summonables = [];

for (var i = 0; i <= UnknownEnum.Value_46; i++)
{
    if (character_active(i))
        array_push(Killables, i);
    else if (instance_exists(get_animatronic_object(i)))
        array_push(Summonables, i);
}

AnimatronicToKill = 0;
AnimatronicToSummon = 0;
var ItemList = [];

if (array_length(Killables) > 0)
{
    AnimatronicToKill = Killables[irandom(array_length(Killables) - 1)];
    ItemList[array_length(ItemList)] = 
    {
        Description: "Score! " + global.Descriptions[other.AnimatronicToKill][0] + " has been removed.",
        Image: 1,
        Likelihood: 5,
        
        Function: function()
        {
            audio_play_sound(sfxMetalImpact, 25, false);
            instance_destroy(get_animatronic_object(other.AnimatronicToKill));
            play_deathcoin_voiceline(other.AnimatronicToKill);
        }
    };
}

ItemList[array_length(ItemList)] = 
{
    Description: "Score! You gained 10% power.",
    Image: 8,
    Likelihood: 5,
    
    Function: function()
    {
        audio_play_sound(sfxBitCollect, 10, false);
        global.Power += 10;
    }
};
ItemList[array_length(ItemList)] = 
{
    Description: "Score! You gained 25% power.",
    Image: 8,
    Likelihood: 3,
    
    Function: function()
    {
        audio_play_sound(sfxBitCollect, 10, false);
        global.Power += 25;
    }
};
ItemList[array_length(ItemList)] = 
{
    Description: "Score! Your power has been fully restored.",
    Image: 8,
    Likelihood: 2,
    
    Function: function()
    {
        audio_play_sound(sfxBitCollect, 10, false);
        global.Power += max(0, 100 - global.Power);
    }
};
ItemList[array_length(ItemList)] = 
{
    Description: "Score! You got 1 token.",
    Image: 2,
    Likelihood: 2,
    
    Function: function()
    {
        audio_play_sound(sfxBitCollect, 10, false);
        global.Tokens += 1;
    }
};
ItemList[array_length(ItemList)] = 
{
    Description: "Score! You got 5 tokens.",
    Image: 2,
    Likelihood: 3,
    
    Function: function()
    {
        audio_play_sound(sfxBitCollect, 10, false);
        global.Tokens += 5;
    }
};
ItemList[array_length(ItemList)] = 
{
    Description: "Score! You got 10 tokens.",
    Image: 2,
    Likelihood: 10,
    
    Function: function()
    {
        audio_play_sound(sfxBitCollect, 10, false);
        global.Tokens += 10;
    }
};
ItemList[array_length(ItemList)] = 
{
    Description: "Score! You got 25 tokens.",
    Image: 2,
    Likelihood: 3,
    
    Function: function()
    {
        audio_play_sound(sfxBitCollect, 10, false);
        global.Tokens += 25;
    }
};
ItemList[array_length(ItemList)] = 
{
    Description: "Score! You got 50 tokens.",
    Image: 2,
    Likelihood: 1,
    
    Function: function()
    {
        audio_play_sound(sfxBitCollect, 10, false);
        global.Tokens += 50;
    }
};
ItemList[array_length(ItemList)] = 
{
    Description: "Score! You won a free Snowcone.",
    Image: 3,
    Likelihood: 5,
    
    Function: function()
    {
        audio_play_sound(sfxBitCollect, 10, false);
        instance_create_depth(0, 0, 0, oShopItem_Snowcone);
    }
};
ItemList[array_length(ItemList)] = 
{
    Description: "Score! You won some free Laser Doors.",
    Image: 4,
    Likelihood: 5,
    
    Function: function()
    {
        audio_play_sound(sfxBitCollect, 10, false);
        instance_create_depth(0, 0, 0, oShopItem_LaserDoors);
    }
};
ItemList[array_length(ItemList)] = 
{
    Description: "Score! You won a free Golden Cupcake.",
    Image: 5,
    Likelihood: 5,
    
    Function: function()
    {
        audio_play_sound(sfxBitCollect, 10, false);
        instance_create_depth(0, 0, 0, oShopItem_GoldenCupcake);
    }
};
ItemList[array_length(ItemList)] = 
{
    Description: "Score! You won a free Beartrap.",
    Image: 6,
    Likelihood: 5,
    
    Function: function()
    {
        audio_play_sound(sfxBitCollect, 10, false);
        instance_create_depth(0, 0, 0, oShopItem_Beartrap);
    }
};
ItemList[array_length(ItemList)] = 
{
    Description: "Score! You won a free Deathcoin.",
    Image: 7,
    Likelihood: 1,
    
    Function: function()
    {
        audio_play_sound(sfxBitCollect, 10, false);
        instance_create_depth(0, 0, 0, oShopItem_DeathCoin);
    }
};

if (array_length(Summonables) > 0)
{
    AnimatronicToSummon = Summonables[irandom(array_length(Summonables) - 1)];
    ItemList[array_length(ItemList)] = 
    {
        Description: "Bad luck! An animatronic has been summoned.",
        Image: 9,
        Likelihood: 15,
        
        Function: function()
        {
            reverb_sound(get_selection_voiceline(other.AnimatronicToSummon), 0, 0, false, 1);
            global.AILevels[other.AnimatronicToSummon] = 10;
            array_push(global.SummonedAnimatronics, other.AnimatronicToSummon);
        }
    };
}

ItemList[array_length(ItemList)] = 
{
    Description: "Bad luck! You win nothing.",
    Image: 0,
    Likelihood: 20,
    
    Function: function()
    {
    }
};
ItemList[array_length(ItemList)] = 
{
    Description: "Bad luck! You won Funtime Chica.",
    Image: 10,
    Likelihood: 10,
    
    Function: function()
    {
        global.UnlockedAnimatronics[UnknownEnum.Value_47] = true;
        save_permanent_data();
        
        with (oFuntimeChica)
            WillKill = true;
        
        global.AILevels[UnknownEnum.Value_47] = 20;
        array_push(global.SummonedAnimatronics, UnknownEnum.Value_47);
    }
};
var PossibleItems = [];

for (var i = 0; i < array_length(ItemList); i++)
{
    var Item = ItemList[i];
    
    repeat (Item.Likelihood)
        array_push(PossibleItems, Item);
}

ItemChosen = PossibleItems[irandom(array_length(PossibleItems) - 1)];
CurrentImage = ItemChosen.Image - 5;
audio_play_sound(sfxRoulette, 10, false);

enum UnknownEnum
{
    Value_46 = 46,
    Value_47
}
