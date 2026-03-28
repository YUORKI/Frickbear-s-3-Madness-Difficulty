function get_tips(arg0, arg1 = -1)
{
    Tips = array_create(70, ["Work smarter, and harder.", "Pay closer attention next time.", "This will be deducted from your pay.", "Not everyone's cut out for this job.", "Frickbear Entertainment is not responsible for any injury or death.", "Frickbear Entertainment values safety over all else.", "Don't give up! We'll fire you if you do.", "All they want is closure.", "Don't hold it against us.", "At this rate, you're never getting a raise.", "Nothing happened to anyone.", "Another death, another dollar.", "Welcome to the family!", "You'll get used to this after a while.", "Maybe you should've played dead.", "Now let's get you suited up, shall we?", "Your first mistake was signing up.", "You've made a very poor career choice.", "Get up. We're not paying you to sleep on the job.", "It wasn't meant to last."]);
    Tips[UnknownEnum.Value_0] = ["You aren't in danger until the third time he laughs.", "If you have trouble hearing him, watch the cameras instead.", "If you can't watch the cameras, listen for his laughter instead."];
    Tips[UnknownEnum.Value_1] = ["Listen for his footsteps.", "You're safe so long as he can't see you.", "He'll growl before attacking. If you hear this, close the door quickly."];
    Tips[UnknownEnum.Value_2] = ["Listen for her footsteps.", "You're safe so long as she can't see you.", "She'll growl before attacking. If you hear this, close the door quickly."];
    Tips[UnknownEnum.Value_3] = ["He'll slow down so long as you're watching any camera, but only freeze up if you're watching him specifically.", "You can slow him down by leaving your camera on him, even if it isn't up.", "Watch out, he drains more power each time he's blocked."];
    Tips[UnknownEnum.Value_4] = ["Put that mask on a little quicker next time.", "Anticipate him whenever you flip down the monitor.", "It's me."];
    Tips[UnknownEnum.Value_5] = ["The flashlight won't anger it so long as it's not looking at you.", "The endoskeleton's servos are a bit creaky. Listen for its sound cue before it activates.", "ANY flashlight usage will anger the Endoskeleton - even if you're looking away or in the cameras."];
    Tips[UnknownEnum.Value_6] = ["Gaming hard or hardly gaming?", "Remember that any minigame will do - focus on beating whatever you're best at.", "Try playing the minigames whenever you have downtime."];
    Tips[UnknownEnum.Value_7] = ["Listen for his voice as he approaches. Wait until you hear him again before taking your mask off.", "Toy Bonnie's especially suceptible to the audio lure. Use it to keep him away."];
    Tips[UnknownEnum.Value_8] = ["The cupcake can only show up in one of five places. Memorize these locations to find it faster.", "Be sure to scour your entire office before flipping the monitor up again."];
    Tips[UnknownEnum.Value_9] = ["Mangle will calm down if not looked at for a while. You can get away with looking at them so long as you don't do so often.", "Mangle will never be on the same camera twice in a row. Use this to your advantage.", "Mangle will never move to the last camera viewed when flipping the monitor down. You can use this to protect a specific camera."];
    Tips[UnknownEnum.Value_10] = ["Close the door as soon as he leaves your sight.", "Listen for his clanking to know if he's close to the door."];
    Tips[UnknownEnum.Value_11] = ["Be prepared when flipping your monitor down - He can show up at any time.", "Put the mask on as soon as you see him, and keep it on until he leaves."];
    Tips[UnknownEnum.Value_12] = ["Listen for her voice as she approaches. Wait until you hear her again before taking your mask off.", "She's not as gullible to the audio lure, but she'll take a bit longer to reach your office than other vent animatronics."];
    Tips[UnknownEnum.Value_13] = ["Keep your flashlight on him whenever you can.", "Hold your flashlight on him - don't flicker it."];
    Tips[UnknownEnum.Value_16] = ["You can reset the music box even when it's not low, just to be safe."];
    Tips[UnknownEnum.Value_14] = ["Balloon Boy has a small chance of jumpscaring you every time he enters the office. That chance is 100% if playing on Lunatic difficulty."];
    Tips[UnknownEnum.Value_18] = ["Its music box will get louder as it manifests. Listen out for it to make sure you're not in danger.", "Remember to keep the temperature low - it manifests faster the hotter the office is."];
    Tips[UnknownEnum.Value_20] = ["Springtrap will always follow a linear path both forwards and backwards. Know his route to find him faster.", "If you're having trouble keeping track of him, listen for his audio cue."];
    Tips[UnknownEnum.Value_21] = ["Remember not to shine your light down the wrong hallway.", "Make sure you're paying attention when flipping down your monitor.", "If you don't think you'll find him in time, you can use the doors to keep him out."];
    Tips[UnknownEnum.Value_22] = ["You won't see him coming if the monitor's up.", "Keep an eye on the temperature meter."];
    Tips[UnknownEnum.Value_23] = ["Be sure to deal with him before you switch to another camera.", "Be prepared for him to show up every time you switch cameras.", "If you've dealt with him already, he won't show up until flipping the monitor back up again."];
    Tips[UnknownEnum.Value_24] = ["Listen out for audio cues to know where Nightmarionne is without needing to look at him.", "You might be able to sneak quick glances to the sides of the office while Nightmarionne is there - just don't overdo it.", "Be sure to pay special attention to audio cues when Nightmarionne is active - you may miss an animatronic if you can't look at them."];
    Tips[UnknownEnum.Value_26] = ["Up to four Bidybabs can appear on a single camera. If you've already found that many, you know that camera is safe.", "Be sure to check the arcade camera to know how many are left."];
    Tips[UnknownEnum.Value_27] = ["Funtime Freddy will announce himself before attacking. Listen to which side he's on to know which camera to check.", "If you can't check on Funtime Freddy in time, you can keep both doors closed - He'll wait for you to open one before leaving, though.", "Some - but not all - of Funtime Freddy's voice clips will give away if he's faking you out. If you're in a pinch, you can use these to your advantage."];
    Tips[UnknownEnum.Value_30] = ["Funtime Freddy will announce himself before attacking. Listen to which side he's on to know which camera to check.", "If you can't check on Funtime Freddy in time, you can keep both doors closed - He'll wait for you to open one before leaving, though.", "Some - but not all - of Funtime Freddy's voice clips will give away if he's faking you out. If you're in a pinch, you can use these to your advantage."];
    Tips[UnknownEnum.Value_28] = ["Funtime Foxy's showtimes are always on 15-second intervals. If you can't check the showtime, you can close the door every 15 seconds just to be safe.", "Funtime Foxy's showtime will update every time he's blocked. Make sure you're keeping up with them to know when she'll attack next."];
    Tips[UnknownEnum.Value_29] = ["A Minireena can only appear in one place on any given camera. If you've seen a Minireena in a spot before, you can memorize it for the next time you have to find them.", "Only one Minireena can appear on any given camera. If you've found one already, you don't need to check that camera again."];
    Tips[UnknownEnum.Value_33] = ["Lefty will typically move to whatever tile is farthest from the audio lure, but prioritize going downwards whenever possible.", "If you're clever, you can trap Lefty in either the left or right corner of the vent system.", "Lefty will never move upwards, unless it's his only option.", "If you want to keep Lefty out, it's recommended you place the audio lure directly in front of the vent opening he's closest to.", "Placing the audio lure directly on top of Lefty will make him move in a random direction immediately. In a pinch, you can use this to push him around."];
    Tips[UnknownEnum.Value_35] = ["You ran out of power."];
    Tips[UnknownEnum.Value_34] = ["Be sure to listen out for his clattering.", "He'll go away faster the sooner you close the door.", "If you can't tell which side he's coming from, you can always close both doors."];
    Tips[UnknownEnum.Value_36] = ["Stay alert - His illusion disc can appear in one of many locations.", "Brace yourself to see him whenever you flip down your monitor."];
    Tips[UnknownEnum.Value_38] = ["Make sure you don't overshoot his jaw - The candy needs to be placed directly into Dreadbear's mouth for him to eat it.", "If you have trouble differentiating the two kinds of candy, remember that Dreadbear's speech bubble will always be on the same side of the office as the bowl of candy he wants."];
    Tips[UnknownEnum.Value_41] = ["It's okay to let Animdude lose a few lives if you need to focus on other tasks - Just don't ignore him for too long.", "A death will only send Animdude to the start of the current screen. If you can't get the whole level done at once, try and aim for incremental progress."];
    Tips[UnknownEnum.Value_42] = ["If you're struggling to save up enough tokens, purchasing a Golden Cupcake and cashing it out near the end of the night may help.", "Don't worry if you can't afford his lumber right away - You'll naturally earn tokens over the course of the night by dealing with animatronics."];
    Tips[UnknownEnum.Value_43] = ["Sparky will become a bit closer to attacking with each camera switch. Check cameras wisely.", "Sparky will attack faster if being actively looked for. If you need to get something done in the office, do it before looking for him.", "Listen to Sparky's barks as you flip through the cameras - They'll give away his position relative to the camera you're watching."];
    Tips[UnknownEnum.Value_44] = ["Be sure to glance at the TV every now and then.", "If you aren't able to put on the mask, purchasing and using an AR Mask should also do the trick."];
    Tips[UnknownEnum.Value_45] = ["Pay attention to where Popgoes is looking while in the showroom - It'll give away which room he intends to move to next.", "Popgoes will make a sound when he moves from his initial position. Listen out for it to know when he leaves."];
    Tips[UnknownEnum.Value_47] = ["Gamble responsibly."];
    Tips[UnknownEnum.Value_48] = ["Don't write checks you can't cash."];
    Tips[UnknownEnum.Value_49] = ["You can use your flashlight on him in the cameras to drain his HP and make him move faster.", "The volume of his footsteps changes depending on where he moves to. Listen out for his audio cues to know where he's going.", "He moves faster when the lights are out, and will always go for the doors after turning them off.", "He can be kept out by keeping the doors closed, but you'll need to let him in to deal damage.", "Certain items may work on him just as they do with other animatronics."];
    Tips[UnknownEnum.Value_50] = ["The temperature will rise over time, and jump up every time you die. Pass a checkpoint to reset it back to zero."];
    Tips[UnknownEnum.Value_51] = ["Nightmare Freddy only attacks if three Freddles latch onto your face. You can let one or two in and still survive."];
    Tips[UnknownEnum.Value_52] = ["Remember that you can control the game even while the handheld is down!"];
    Tips[UnknownEnum.Value_53] = ["Be sure your character is in a safe spot before flipping the handheld down; The game will still run regardless of if it's up or not."];
    Tips[UnknownEnum.Value_54] = ["You can still look around the office while the handheld is up. Use this to keep Foxy's timer in view."];
    
    if (arg1 == -1)
        arg1 = ((global.DeathRecord[arg0] + global.FunValue[0]) * global.FunValue[1]) % array_length(Tips[arg0]);
    
    return Tips[arg0][arg1];
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
    Value_16 = 16,
    Value_18 = 18,
    Value_20 = 20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_26 = 26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_33 = 33,
    Value_34,
    Value_35,
    Value_36,
    Value_38 = 38,
    Value_41 = 41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_47 = 47,
    Value_48,
    Value_49,
    Value_50,
    Value_51,
    Value_52,
    Value_53,
    Value_54
}
