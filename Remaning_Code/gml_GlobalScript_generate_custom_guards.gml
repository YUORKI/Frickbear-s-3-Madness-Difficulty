global.GuardAmount = 4;
global.GuardNames = ["Jeremy", "Mike", "Vanessa", "Fritz"];

function int_to_suffix(arg0)
{
    return ((arg0 < 10) ? "0" : "") + string(arg0);
}

function get_folders(arg0 = "addons", arg1 = "*")
{
    global.GuardNames = ["Jeremy", "Mike", "Vanessa", "Fritz"];
    var folders = [];
    var folder = file_find_first(working_directory + arg0 + "/" + arg1, 16);
    
    while (folder != "")
    {
        array_push(folders, folder);
        array_push(global.GuardNames, folder);
        folder = file_find_next();
    }
    
    return folders;
}

function skin_sprite(arg0, arg1, arg2, arg3 = 1, arg4 = 0, arg5 = 0)
{
    if (arg1 < 0 || arg1 >= array_length(global.Skins))
        return sprite_duplicate(arg0);
    
    var AnimatronicID = 0;
    var SkinID = global.Skins[arg1];
    
    if (SkinID < 0)
        return sprite_duplicate(arg0);
    
    var SkinFolders = get_folders("skins", int_to_suffix(arg1 + 1) + "_*");
    var directory = working_directory + "skins/" + SkinFolders[SkinID] + "/sprites";
    var sprite = -1;
    
    if (!is_array(arg2))
        arg2 = [arg2];
    
    var filename = directory + "/" + arg2[0];
    
    if (file_find_first(filename, 0) != "")
        sprite = sprite_add(filename, arg3, false, false, arg4, arg5);
    else
        return sprite_duplicate(arg0);
    
    var spriteTemp = -1;
    
    for (var i = 1; i < array_length(arg2); i++)
    {
        show_debug_message(i);
        filename = directory + "/" + arg2[i];
        show_debug_message(filename);
        
        if (file_find_first(filename, 0) != "")
            spriteTemp = sprite_add(filename, arg3, false, false, arg4, arg5);
        else
            spriteTemp = sprite_duplicate(arg0);
        
        show_debug_message(spriteTemp);
        sprite_merge(sprite, spriteTemp);
        sprite_delete(spriteTemp);
    }
    
    return sprite;
}

function skin_hybrid_sprite(arg0, arg1 = "icon.png", arg2 = 0, arg3 = 0)
{
    var width = sprite_get_width(arg0);
    var height = sprite_get_height(arg0);
    var DrawSurf = surface_create(width, height);
    var ReturnSprite = -1;
    var ThisIcon = -1;
    surface_set_target(DrawSurf);
    
    for (var AnimatronicID = 0; AnimatronicID <= UnknownEnum.Value_46; AnimatronicID++)
    {
        draw_clear_alpha(c_black, 0);
        var SkinID = global.Skins[AnimatronicID];
        
        if (SkinID < 0)
        {
            ThisIcon = sprite_duplicate(arg0);
            show_debug_message(string("{0}: Default skin", AnimatronicID));
        }
        else
        {
            var SkinFolders = get_folders("skins", int_to_suffix(AnimatronicID + 1) + "_*");
            var directory = working_directory + "skins/" + SkinFolders[SkinID] + "/sprites";
            var file = directory + "/" + arg1;
            
            if (file_find_first(file, 0) != "")
            {
                ThisIcon = sprite_add(file, 1, false, false, 0, 0);
                show_debug_message(string("{0}: File found successfully", AnimatronicID));
            }
            else
            {
                ThisIcon = sprite_duplicate(arg0);
                show_debug_message(string("{0}: NO FILES FOUND", AnimatronicID));
            }
        }
        
        draw_sprite(ThisIcon, AnimatronicID, 0, 0);
        
        if (AnimatronicID == 0)
            ReturnSprite = sprite_create_from_surface(DrawSurf, 0, 0, width, height, false, false, 0, 0);
        else
            sprite_add_from_surface(ReturnSprite, DrawSurf, 0, 0, width, height, false, false);
        
        sprite_delete(ThisIcon);
    }
    
    surface_reset_target();
    surface_free(DrawSurf);
    return ReturnSprite;
}

function skin_sound(arg0, arg1, arg2)
{
    var AnimatronicID = 0;
    var SkinID = global.Skins[arg1];
    
    if (SkinID < 0)
        return arg0;
    
    var SkinFolders = get_folders("skins", int_to_suffix(arg1 + 1) + "_*");
    var directory = working_directory + "skins/" + SkinFolders[SkinID] + "/sounds";
    var sound = -1;
    var filename = directory + "/" + arg2 + ".ogg";
    var file = file_find_first(filename, 0);
    show_debug_message("FILE FOUND: " + string(file));
    
    if (file == "")
        return arg0;
    else
        return audio_create_stream(filename);
}

function update_description(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            return string("Approaches from either hallway. Watch {0} on the cameras or listen for {1} voice and close the door when {2} near.", string_lower(arg2), string_lower(arg3), string_lower(arg4));
        
        case UnknownEnum.Value_1:
            return string("Approaches from the left. Close the door when {0} near.", string_lower(arg4));
        
        case UnknownEnum.Value_2:
            return string("Approaches from the right. Close the door when {0} near.", string_lower(arg4));
        
        case UnknownEnum.Value_3:
            return string("Lurks in Pirate's Cove. Check on {0} often to keep {1} at bay, or close the left door if {2} makes a break for your office.", string_lower(arg2), string_lower(arg2), string_lower(arg1));
        
        case UnknownEnum.Value_4:
            return string("Quickly throw on the mask when {0} appears in your office.", string_lower(arg1));
        
        case UnknownEnum.Value_5:
            return string("Don't use your flashlight when {0} at your window. ANY flashlight usage will make {1} attack.", string_lower(arg4), string_lower(arg2));
        
        case UnknownEnum.Value_6:
            return string("Beat {0} high score on a minigame of your choice before 6:00 AM.", string_lower(arg3));
        
        case UnknownEnum.Value_7:
            return string("Crawls through the vents. Use the audio lure to keep {0} away, or put the mask on when you hear {1} approach your office. Moves faster than other vent animatronics, but is more susceptible to the audio lure.", string_lower(arg2), string_lower(arg2));
        
        case UnknownEnum.Value_8:
            return string("{0}'ll send {1} into the office to spy on you before attacking. Click on {2} quickly to remove {3} and avoid {4} attack.", arg1, arg5, arg5, arg6, string_lower(arg3));
        
        case UnknownEnum.Value_9:
            return string("{0} moves to a random camera each time the camera's down, and will attack if looked at for too long. Check the sticky note on the office window to know what camera {1} on.", arg1, string_lower(arg4));
        
        case UnknownEnum.Value_14:
            return string("Crawls through the vents. Put on the mask when {0} near. {1}'s unlikely to be fooled by the audio lure and will temporarily disable your flashlight if {2} gets in the office.", string_lower(arg4), arg2, string_lower(arg1));
        
        case UnknownEnum.Value_15:
            return string("Crawls through the vents. Put on the mask when {0} near. {1}'s immune to the heater and will temporarily disable your doors if {2} gets in the office.", string_lower(arg4), arg2, string_lower(arg1));
        
        case UnknownEnum.Value_10:
            return string("{0}'ll walk between the two doorways. Watch {1} through the office window and close the door {2} closest to when {3} leaves your sight.", arg1, string_lower(arg2), string_lower(arg4), string_lower(arg1));
        
        case UnknownEnum.Value_11:
            return string("When {0} appears in your office, throw on the mask and keep it on until {1} leaves.", string_lower(arg1), string_lower(arg1));
        
        case UnknownEnum.Value_12:
            return string("Crawls through the vents. Use the audio lure to keep {0} away, or put the mask on when you hear {1} approach your office. Moves slower than other vent animatronics, but is less susceptible to the audio lure.", string_lower(arg2), string_lower(arg2));
        
        case UnknownEnum.Value_13:
            return string("{0}'ll appear in the window at the front of your office. Shine your flashlight on {1} to make {2} go away.", arg1, string_lower(arg2), string_lower(arg2));
        
        case UnknownEnum.Value_16:
            return string("Reset {0} when you see the warning flash.", arg5);
        
        case UnknownEnum.Value_17:
            return string("{0}'ll suddenly show up once per night, temporarily plunging your office into complete darkness. Use your flashlight to see through the dark.", arg1);
        
        case UnknownEnum.Value_18:
            return string("Slowly materializes in your office, appearing more quickly as the building heats up. Shine your flashlight on {0} to make {1} go away.", string_lower(arg2), string_lower(arg2));
        
        case UnknownEnum.Value_19:
            return string("{0}'ll appear on the camera view at random. Close or switch the cam quickly or use your flashlight to avoid {1} attack. {2} can't kill you, but {3} will jumpscare you and increase the office temperature if looked at for too long.", string_lower(arg1), string_lower(arg3), string_lower(arg1), string_lower(arg1));
        
        case UnknownEnum.Value_20:
            return string("{0}'ll slowly emerge from the backstage hallway and make {1} way to your office. Shine your flashlight on {2} in the cameras to push {3} back. If {4} reaches the doorway, {5}'ll never leave.", arg1, string_lower(arg3), string_lower(arg2), string_lower(arg2), string_lower(arg1), string_lower(arg1));
        
        case UnknownEnum.Value_21:
            return string("{0}'ll appear at the window and quickly hide when flipping down the monitor. When this happens, shine your flashlight down the hallway {1} closest to.", arg1, string_lower(arg4));
        
        case UnknownEnum.Value_22:
            return string("If {0} {1} begin closing in on you, cool the office down quickly.", string_lower(arg3), arg5);
        
        case UnknownEnum.Value_23:
            return string("{0}'ll sometimes appear on the cameras. Click on {1} repeatedly to remove {2} before {3} attacks.", arg1, string_lower(arg2), string_lower(arg2), string_lower(arg1));
        
        case UnknownEnum.Value_24:
            return string("Avoid looking in {0} direction when {1} descends into your office.", string_lower(arg3), string_lower(arg1));
        
        case UnknownEnum.Value_25:
            return "Will increase the price of all shop items when active.";
        
        case UnknownEnum.Value_26:
            return string("Find and click on all of {0} on the cameras before the end of the night.", arg5);
        
        case UnknownEnum.Value_27:
            return string("{0}'ll attack from the hallways and use {1} to try and fake you out. If you hear {2} or see {3} on the cameras and {4} is with {5}, close the door {6} at. If {7} is missing, close the opposite door.", arg1, arg5, string_lower(arg2), string_lower(arg2), arg5, string_lower(arg2), string_lower(arg4), arg5);
        
        case UnknownEnum.Value_28:
            return "A cardboard cutout in the Dining Area will display a showtime. When showtime hits, make sure your right door is closed.";
        
        case UnknownEnum.Value_29:
            return string("When you hear {0} {1}, search the cameras for {2} four {3} and click on them before time runs out.", string_lower(arg3), arg5, string_lower(arg3), arg6);
        
        case UnknownEnum.Value_30:
            return "Will spawn a barrage of pop-up ads to block your view. Click the X button on these pop-ups to close them.";
        
        case UnknownEnum.Value_31:
            return "Plays random fake audio cues throughout the night. Can't kill you, but will absolutely annoy you.";
        
        case UnknownEnum.Value_32:
            return string("Crawls through the vents. Use the audio lure to keep {0} away, or put the mask on when you hear {1} approach your office. The sound of {2} approach is much more subtle than other vent animatronics, but if {3} gets in the office, {4}'ll cause a lengthy audio disturbance.", string_lower(arg2), string_lower(arg2), string_lower(arg3), string_lower(arg1), string_lower(arg1));
        
        case UnknownEnum.Value_33:
            return string("Crawls through the vents, though unlike other vent animatronics will actively avoid the audio lure whenever possible. If {0} reaches your office, the mask will not fool {1}.", string_lower(arg1), string_lower(arg2));
        
        case UnknownEnum.Value_34:
            return string("Approaches rapidly from either hallway. Listen for the increasingly loud sound of {0} and close the correct door when {1} near.", arg5, string_lower(arg4));
        
        case UnknownEnum.Value_35:
            return string("{0}'ll appear backstage, draining your power and making a lot of noise. Administer a controlled shock to make {1} stop.", arg1, string_lower(arg2));
        
        case UnknownEnum.Value_36:
            return string("{0}'ll suddenly appear in your office when flipping down the monitor. Click on {1} {2} to disable it, stopping {3} attack.", arg1, string_lower(arg3), arg5, string_lower(arg3));
        
        case UnknownEnum.Value_37:
            return string("{0}'ll begin appearing after the monitor has been flipped up a certain amount of times. If you run out of flips, your monitor will be disabled for the rest of the night.", arg1);
        
        case UnknownEnum.Value_38:
            return string("{0}'ll appear at the center window. When {1} does, drag a {2} from the correct {3} to {4} to make {5} go away.", arg1, string_lower(arg1), arg5, arg6, string_lower(arg2), string_lower(arg2));
        
        case UnknownEnum.Value_39:
            return string("{0}'ll force you to add a new animatronic to the night. Select one from the popup menu when it appears.", arg1);
        
        case UnknownEnum.Value_41:
            return "A minigame window will appear on your screen once per night. Press space to jump and dodge obstacles. Losing all lives will result in a jumpscare.";
        
        case UnknownEnum.Value_40:
            return string("{0}'ll activate once per night, forcing you to play a minigame. Use the mouse to move {1} up and down and hit {2} back. Missing {3} will cause a power outage.", arg1, arg5, arg6, arg6);
        
        case UnknownEnum.Value_42:
            return string("Buy {0} {1} from the shop before 6 AM.", string_lower(arg3), arg5);
        
        case UnknownEnum.Value_43:
            return string("When you hear {0} {1}, search for {2} on the cameras. Once you find the camera where {3} {4} is loudest, zap {5} with a controlled shock.", string_lower(arg2), arg5, string_lower(arg2), string_lower(arg3), arg6, string_lower(arg2));
        
        case UnknownEnum.Value_44:
            return "A countdown will appear on the office TV. Make sure your mask is on when it hits zero.";
        
        case UnknownEnum.Value_45:
            return string("{0}'ll start in the dining area before moving to one of four rooms adjacent to it. Administer a controlled shock on the camera {1} moves to before {2} can {3}.", arg1, string_lower(arg1), string_lower(arg1), arg5);
        
        case UnknownEnum.Value_46:
            return string("Just ignore {0}.", string_lower(arg2));
        
        default:
            return "ERROR!";
    }
}

function reset_descriptions()
{
    global.Descriptions = array_create(70, ["UNKNOWN", "No info available."]);
    global.Descriptions[UnknownEnum.Value_0] = ["Freddy", update_description(UnknownEnum.Value_0, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_1] = ["Bonnie", update_description(UnknownEnum.Value_1, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_2] = ["Chica", update_description(UnknownEnum.Value_2, "She", "Her", "Her", "She's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_3] = ["Foxy", update_description(UnknownEnum.Value_3, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_4] = ["Golden Freddy", update_description(UnknownEnum.Value_4, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_5] = ["Endoskeleton", update_description(UnknownEnum.Value_5, "It", "It", "Its", "It's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_6] = ["Toy Freddy", update_description(UnknownEnum.Value_6, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_7] = ["Toy Bonnie", update_description(UnknownEnum.Value_7, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_8] = ["Toy Chica", update_description(UnknownEnum.Value_8, "She", "Her", "Her", "She's", "her cupcake", "it")];
    global.Descriptions[UnknownEnum.Value_9] = ["Mangle", update_description(UnknownEnum.Value_9, "She", "Him", "Her", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_14] = ["BB", update_description(UnknownEnum.Value_14, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_15] = ["JJ", update_description(UnknownEnum.Value_15, "She", "Her", "Her", "She's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_10] = ["Withered Freddy", update_description(UnknownEnum.Value_10, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_11] = ["Withered Bonnie", update_description(UnknownEnum.Value_11, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_12] = ["Withered Chica", update_description(UnknownEnum.Value_12, "She", "Her", "Her", "She's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_13] = ["Withered Foxy", update_description(UnknownEnum.Value_13, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_16] = ["Marionette", update_description(UnknownEnum.Value_16, "He", "Him", "His", "He's", "the music box", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_17] = ["Shadow Freddy", update_description(UnknownEnum.Value_17, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_18] = ["RWQFSFASXC", update_description(UnknownEnum.Value_18, "It", "It", "Its", "It's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_19] = ["The Phantoms", update_description(UnknownEnum.Value_19, "They", "Them", "Their", "They're", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_20] = ["Springtrap", update_description(UnknownEnum.Value_20, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_21] = ["Plushtrap", update_description(UnknownEnum.Value_21, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_22] = ["Nightmare Fredbear", update_description(UnknownEnum.Value_22, "He", "Him", "His", "He's", "teeth", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_23] = ["Nightmare BB", update_description(UnknownEnum.Value_23, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_24] = ["Nightmarionne", update_description(UnknownEnum.Value_24, "It", "It", "Its", "It's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_25] = ["Lolbit", update_description(UnknownEnum.Value_25, "They", "Them", "Their", "They're", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_26] = ["Circus Baby", update_description(UnknownEnum.Value_26, "She", "Her", "Her", "She's", "her Bidybabs", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_27] = ["Funtime Freddy", update_description(UnknownEnum.Value_27, "He", "Him", "His", "He's", "Bon-Bon", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_28] = ["Funtime Foxy", update_description(UnknownEnum.Value_28, "She", "Him", "Her", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_29] = ["Ballora", update_description(UnknownEnum.Value_29, "She", "Her", "Her", "She's", "music begin playing", "Minireenas")];
    global.Descriptions[UnknownEnum.Value_30] = ["Helpy", update_description(UnknownEnum.Value_30, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_31] = ["Music Man", update_description(UnknownEnum.Value_31, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_32] = ["Mr. Hippo", update_description(UnknownEnum.Value_32, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_33] = ["Lefty", update_description(UnknownEnum.Value_33, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_34] = ["Molten Freddy", update_description(UnknownEnum.Value_34, "They", "Them", "Their", "They're", "metal clattering", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_35] = ["Scrap Baby", update_description(UnknownEnum.Value_35, "She", "Her", "Her", "She's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_36] = ["Twisted Wolf", update_description(UnknownEnum.Value_36, "He", "Him", "His", "He's", "flashing illusion disc", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_37] = ["Malhare", update_description(UnknownEnum.Value_37, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_38] = ["Dreadbear", update_description(UnknownEnum.Value_38, "He", "Him", "His", "He's", "piece of candy", "candy bowl")];
    global.Descriptions[UnknownEnum.Value_39] = ["LolzHax", update_description(UnknownEnum.Value_39, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_41] = ["Animdude", update_description(UnknownEnum.Value_41, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_40] = ["Coffee", update_description(UnknownEnum.Value_40, "He", "Him", "His", "He's", "Coffee", "the ball")];
    global.Descriptions[UnknownEnum.Value_42] = ["Chipper", update_description(UnknownEnum.Value_42, "He", "Him", "His", "He's", "lumber", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_43] = ["Sparky", update_description(UnknownEnum.Value_43, "He", "Him", "His", "He's", "bark", "barking")];
    global.Descriptions[UnknownEnum.Value_44] = ["Candy", update_description(UnknownEnum.Value_44, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_45] = ["Popgoes", update_description(UnknownEnum.Value_45, "He", "Him", "His", "He's", "use the printer", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_46] = ["Rodney", update_description(UnknownEnum.Value_46, "He", "Him", "His", "He's", "UNUSED", "UNUSED")];
    global.Descriptions[UnknownEnum.Value_47] = ["Funtime Chica", "You are about to die."];
    global.Descriptions[UnknownEnum.Value_48] = ["Felix", "Pay off your token debt before 6 AM."];
    global.Descriptions[UnknownEnum.Value_55] = ["Psycho Foe Fredbear", ""];
    global.Descriptions[UnknownEnum.Value_51] = ["Nightmare Freddy", "Freddles will continuously appear outside your office. Shine your flashlight on them to make them go away. If any more than three latch onto you, Nightmare Freddy will enter himself."];
    global.Descriptions[UnknownEnum.Value_52] = ["Nightmare Bonnie", "He'll run down either hallway. Listen out for him and shine your light into the doorway when he's close."];
    global.Descriptions[UnknownEnum.Value_53] = ["Nightmare Chica", "She'll walk past the office window searching for you. Put your mask on when she looks at you."];
    global.Descriptions[UnknownEnum.Value_54] = ["Nightmare Foxy", "Keep an eye on his timer. Put your mask on when it hits zero."];
    global.Descriptions[UnknownEnum.Value_50] = ["Nightmare", "The temperature will rise over time, as well as each time you die in the game. He'll attack once the temperature bar is full."];
    global.Descriptions[UnknownEnum.Value_49] = ["Salvage", ""];
    global.Descriptions[UnknownEnum.Value_66] = ["Jeremy Fitzgerald", ""];
    global.Descriptions[UnknownEnum.Value_67] = ["Mike Schmidt", ""];
    global.Descriptions[UnknownEnum.Value_68] = ["Vanessa Shelley", ""];
    global.Descriptions[UnknownEnum.Value_69] = ["Fritz Smith", ""];
    global.Descriptions[UnknownEnum.Value_60] = ["Psychic Friend Fredbear", ""];
    global.Descriptions[UnknownEnum.Value_58] = ["Upgrade Cadet", ""];
    global.Descriptions[UnknownEnum.Value_59] = ["Endo Chaser", ""];
    global.Descriptions[UnknownEnum.Value_57] = ["Mendo", ""];
    global.Descriptions[UnknownEnum.Value_56] = ["Phone Guys", ""];
    global.Descriptions[UnknownEnum.Value_63] = ["Michael Afton", ""];
    global.Descriptions[UnknownEnum.Value_62] = ["Vanny", ""];
    global.Descriptions[UnknownEnum.Value_61] = ["The Boss", ""];
    global.Descriptions[UnknownEnum.Value_64] = ["The Missing Children", ""];
    global.Descriptions[UnknownEnum.Value_65] = ["Charlie Emily", ""];
}

reset_descriptions();

function get_pronouns(arg0)
{
}

function skin_replace_descriptions(arg0 = "data.txt")
{
    reset_descriptions();
    
    for (var i = 0; i <= UnknownEnum.Value_46; i++)
    {
        var SkinID = global.Skins[i];
        
        if (SkinID < 0)
            continue;
        
        var SkinFolders = get_folders("skins", int_to_suffix(i + 1) + "_*");
        var directory = working_directory + "skins/" + SkinFolders[SkinID];
        var filename = directory + "/" + arg0;
        var file = file_find_first(filename, 0);
        show_debug_message("FILE FOUND: " + string(file) + " for animatronic " + string(i));
        
        if (file == "")
        {
            continue;
        }
        else
        {
            var _buffer = buffer_load(filename);
            var _string = buffer_read(_buffer, buffer_string);
            buffer_delete(_buffer);
            var data = json_parse(_string);
            global.Descriptions[i][0] = data.Name;
            var He = data.Pronouns.He;
            var Him = data.Pronouns.Him;
            var His = data.Pronouns.His;
            var Hes = data.Pronouns.Hes;
            var Extra1 = data.Pronouns.Extra1;
            var Extra2 = data.Pronouns.Extra2;
            global.Descriptions[i][1] = update_description(i, He, Him, His, Hes, Extra1, Extra2);
        }
    }
}

function skin_sound_subtitles(arg0)
{
    var txt = filename_change_ext(arg0, ".txt");
    
    if (!file_exists(txt))
        return [["No subtitles found."], [0]];
    
    var _buffer = buffer_load(txt);
    var _string = buffer_read(_buffer, buffer_string);
    buffer_delete(_buffer);
    return json_parse(_string);
}

function skin_sound_array(arg0, arg1)
{
    var AnimatronicID = 0;
    var SkinID = global.Skins[arg0];
    
    if (SkinID < 0)
        return [sfxNOTHING];
    
    var AnimatronicFolders = get_folders("skins");
    var SkinFolders = get_folders("skins", int_to_suffix(arg0 + 1) + "_*");
    var directory = working_directory + "skins/" + SkinFolders[SkinID] + "/sounds";
    var sound = -1;
    var filename = directory + "/" + arg1 + "_*.ogg";
    var file = file_find_first(filename, 0);
    var results = [];
    
    while (file != "")
    {
        array_push(results, directory + "/" + file);
        file = file_find_next();
    }
    
    return results;
}

function draw_imported_deathscreen(arg0)
{
    draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
    shader_set(shFlash);
    
    for (var i = 0; i < 360; i += 45)
        draw_sprite_ext(arg0, 1, 320 + round(lengthdir_x(1, i)), 180 + round(lengthdir_y(1, i)), 1, 1, 0, #280000, 1);
    
    shader_set(shDeathscreen);
    shader_set_uniform_f(shader_get_uniform(shDeathscreen, "u_tint"), 0.9098, 0.0784, 0.0784);
    draw_sprite(arg0, 0, 320, 180);
    shader_reset();
}

function no_brackets(arg0)
{
    var _pos = string_pos(" (", arg0);
    
    if (_pos > 0)
        return string_copy(arg0, 1, _pos - 1);
    
    return arg0;
}

function import_sprites(arg0, arg1, arg2 = 1, arg3 = 0, arg4 = 0, arg5 = sBear5)
{
    global.GuardNames = ["Jeremy", "Mike", "Vanessa", "Fritz"];
    var custom_sprite = sprite_duplicate(arg1);
    var sprite = -1;
    var folders = get_folders();
    global.GuardAmount = 4 + array_length(folders);
    
    for (var i = 0; i < array_length(folders); i++)
    {
        var filename = working_directory + "addons/" + folders[i] + "/" + string(arg0);
        
        if (file_find_first(filename, 0) != "")
            sprite = sprite_add(filename, arg2, false, false, arg3, arg4);
        else
            sprite = sprite_duplicate(arg5);
        
        if (sprite != -1)
        {
            sprite_merge(custom_sprite, sprite);
            sprite_delete(sprite);
        }
    }
    
    return custom_sprite;
}

function import_sound(arg0, arg1 = "/talksound.ogg", arg2 = [])
{
    var filename = working_directory + "addons/" + guard_name(arg0) + arg1;
    
    if (file_find_first(filename, 0) != "")
    {
        var Stream = audio_create_stream(filename);
        
        if (array_length(arg2) > 0)
        {
            audio_sound_loop_start(Stream, arg2[0]);
            audio_sound_loop_end(Stream, arg2[1]);
        }
        
        audio_sound_gain(Stream, (global.Settings[2][0] * global.Settings[2][1]) / 100, 0);
        return Stream;
    }
    else
    {
        return voc_tsDefault;
    }
}

function import_dialogue(arg0, arg1 = "/opening_dialogue.txt", arg2 = false)
{
    var filename = working_directory + "addons/" + guard_name() + arg1;
    
    if (file_find_first(filename, 0) != "")
    {
        try
        {
            var _buffer = buffer_load(filename);
            var _string = buffer_read(_buffer, buffer_string);
            buffer_delete(_buffer);
            return json_parse(_string);
        }
        catch (_exception)
        {
            show_message(string("ERR: {0}'s {1} file appears to be incorrectly formatted. Data could not be imported.", guard_name(), arg1));
        }
    }
    
    return 
    {
        DIALOGUE: ["There was an error loading the dialogue. Bet you feel real stupid now, huh?"],
        FIRST_PERSON: "false",
        PHOTO_CAPTION: "As for you..."
    };
}

function import_extras()
{
    var folders = get_folders();
    var extras_info = [];
    
    for (var i = 0; i < array_length(folders); i++)
    {
        var filename = working_directory + "addons/" + folders[i] + "/extras_info.txt";
        
        if (file_find_first(filename, 0) != "")
        {
            try
            {
                var _buffer = buffer_load(filename);
                var _string = buffer_read(_buffer, buffer_string);
                buffer_delete(_buffer);
                array_push(extras_info, json_parse(_string));
            }
            catch (_exception)
            {
                show_message(string("ERR: {0}'s extras_info.txt file appears to be incorrectly formatted. Data could not be imported.", folders[i]));
                array_push(extras_info, 
                {
                    FULL_NAME: "ERROR",
                    DEV_NOTES: "N/A",
                    DESCRIPTION: "Looks like you're missing the extras_info file."
                });
            }
        }
        else
        {
            array_push(extras_info, 
            {
                FULL_NAME: "ERROR",
                DEV_NOTES: "N/A",
                DESCRIPTION: "Looks like you're missing the extras_info file."
            });
        }
    }
    
    return extras_info;
}

function import_portraits()
{
    var folders = get_folders();
    var portraits = [];
    
    for (var i = 0; i < array_length(folders); i++)
    {
        var filename = working_directory + "addons/" + folders[i] + "/portrait.png";
        var sprite;
        
        if (file_find_first(filename, 0) != "")
            sprite = sprite_add(filename, 1, false, false, 0, 0);
        else
            sprite = sprite_duplicate(sBear5);
        
        if (sprite != -1)
            array_push(portraits, sprite);
    }
    
    return portraits;
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
    Value_47,
    Value_48,
    Value_49,
    Value_50,
    Value_51,
    Value_52,
    Value_53,
    Value_54,
    Value_55,
    Value_56,
    Value_57,
    Value_58,
    Value_59,
    Value_60,
    Value_61,
    Value_62,
    Value_63,
    Value_64,
    Value_65,
    Value_66,
    Value_67,
    Value_68,
    Value_69
}
